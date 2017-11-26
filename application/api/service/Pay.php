<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/5
 * Time: 15:25
 */

namespace app\api\service;
use app\api\model\Order;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;

use app\lib\enum\OrderStatusEnum;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');
class Pay
{
    private $orderID;
    private $orderNO;

    public function __construct($orderID)
    {
        if(!$orderID) {
            throw new Exception("订单号不得为空");
        }
        $this->orderID = $orderID;
    }
    public function pay() {
        //订单根本就不存在
        //订单和用户不匹配
        //订单已经被支付过了
        //库存量检测
        $this->checkOrderValid();
        $orderService = new OrderService();
        $status = $orderService->checkOrderStock($this->orderID);
        if(!$status['pass']) {
            return $status;
        }
        return $this->makeWxPreOrder($status['orderPrice']);
    }

    private function makeWxPreOrder($totalPrice) {
        $openID = Token::getCurrentTokenVar('openid');
        if(!$openID) {
            throw new TokenException();
        }
        $wxOrderData = new \WxPayUnifiedOrder();
        $wxOrderData->SetOut_trade_no($this->orderNO);
        $wxOrderData->SetTrade_type('JSAPI');
        $wxOrderData->SetTotal_fee($totalPrice*100);
        $wxOrderData->SetBody('零食小铺');
        $wxOrderData->SetOpenid($openID);
        $wxOrderData->SetNotify_url('https://30166482.qcloud.la/index.php/api/v1/pay/notify');
        return $this->getPaySignature($wxOrderData);
    }

    private function getPaySignature($wxOrderData) {
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        if($wxOrder['return_code']!='SUCCESS') {
            //记录日志
            Log::record($wxOrder,'error');
            Log::record('获取预订单支付接口失败','error');
            return [
                'msg'=>'请查看系统日志'
            ];
        }
        $this->recordPreOrder($wxOrder);
        return $this->sign($wxOrder);
    }

    /**
     * @param $wxOrder
     * @return array
     * 获取小程序发起微信支付的参数
     */
    private function sign($wxOrder) {
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());
        $rand = md5(time() . mt_rand(0, 1000));
        $jsApiPayData->SetNonceStr($rand);
        $jsApiPayData->SetPackage('prepay_id=' . $wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');
        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] = $sign;
        unset($rawValues['appId']);
        return $rawValues;

    }

    /**
     * @param $wxOrder
     * 记录prepay_id的值写入数据库
     */
    private function recordPreOrder($wxOrder) {
        Order::where('id','=',$this->orderID)->update(['prepay_id'=>$wxOrder['prepay_id']]);
    }

    /**
     * @return bool
     * @throws OrderException
     * @throws TokenException
     * 检测订单的合法性
     */
    public function checkOrderValid() {
        $order = OrderModel::where('id','=',$this->orderID)->find();
        if(!$order) {
            throw new OrderException();
        }
        if(!Token::isValidOperate($order->user_id)) {
            throw new TokenException([
                'msg'=>'订单与用户不匹配',
                'errorCode'=>10003
            ]);
        }
        if($order->status!=OrderStatusEnum::UNPAID) {
            throw new OrderException([
                'msg'=>'订单已经支付',
                'errorCode'=>80003,
                'code'=>400
            ]);
        }
        $this->orderNO = $order->order_no;
        return true;

    }
}