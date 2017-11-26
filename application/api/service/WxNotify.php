<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/9
 * Time: 13:16
 */

namespace app\api\service;

use app\api\model\Order as OrderModel;
use app\api\model\Product;
use app\api\service\Order as OrderService;
use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');
class WxNotify extends \WxPayNotify
{
    public function NotifyProcess($data, &$msg)
    {
        if($data['return_code'] == 'SUCCESS') {
            $orderno = $data['out_trade_no'];
            //用事务，防止多次减少了库存量,一个执行单元，
            Db::startTrans();
            try {
                $order = OrderModel::where('order_no', '=', $orderno)->lock(true)->find();
                if ($order['status'] == 1) {
                    $service = new OrderService();
                    $stockStatus = $service->checkOrderStock($order->id);
                    if ($stockStatus['pass']) {
                        $this->updateStockStatus($order->id, true);
                        $this->reduceStock($stockStatus);
                    } else {
                        $this->updateStockStatus($order->id, false);
                    }
                }
                Db::commit();
                return true;
            }catch (Exception $ex) {
                Db::rollback();
                Log::record($ex);
                return false;
            }
        }else{
            return true;
        }
    }

    /**
     * @param $stockStatus
     * 减少库存量
     */
    private function reduceStock($stockStatus) {
        foreach ($stockStatus['pStatusArray'] as $pArrayStatus) {
            $product_id = $pArrayStatus['id'];
            $count = $pArrayStatus['counts'];
            Product::where('id','=',$product_id)->setDec('stock',$count);
        }
    }

    /**
     * @param $orderID
     * @param $success
     * 修改订单的状态值
     */
    private function updateStockStatus($orderID,$success) {
        $status = $success?OrderStatusEnum::PAID:OrderStatusEnum::PAID_BUT_OUT_OF;
        OrderModel::where('id','=',$orderID)->update(['status'=>$status]);
    }
}