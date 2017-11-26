<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/2
 * Time: 9:32
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\validate\IsMustBePostiveInt;
use app\api\validate\OrderPlace;
use app\api\service\Order as OrderService;
use app\api\service\Token as TokenService;
use app\api\model\Order as OrderModel;
use app\api\validate\PagingParameter;
use app\lib\exception\OrderException;

class Order extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope'=>['only'=>'placeOrder'],
        'checkPrimaryScope'=>['only'=>'getOrderDetailById','getSummaryByUser']
    ];

    /**
     * @return array
     * 下单接口
     */
    public function placeOrder() {
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $uid = TokenService::getCurrentUid();
        $status = new OrderService();
        $result = $status->place($uid,$products);
        return $result;
    }

    /***
     * @param int $page
     * @param int $size
     * @return array
     * 根据用户获取订单的概要信息
     */
    public function getSummaryByUser($page = 1,$size = 15) {
        (new PagingParameter())->goCheck();
        $uid = TokenService::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByUser($uid,$page,$size);
        if($pagingOrders->isEmpty()) {
            return [
                'data'=>[],
                'current_page'=>$pagingOrders->currentPage()
            ];
        }
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])->toArray();
        return [
            'data'=>$data,
            'current_page'=>$pagingOrders->currentPage()
        ];
    }



    /**
     * @param int $page
     * @param int $size
     * @return array
     * 获取订单的简要信息
     */
    public function getSummary($page = 1,$size = 15) {
        (new PagingParameter())->goCheck();
        $pagingOrders = OrderModel::getSummary($page,$size);
        if($pagingOrders->isEmpty()) {
            return [
                'data'=>[],
                'current_page'=>$pagingOrders->currentPage()
            ];
        }
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])->toArray();
        return [
            'data'=>$data,
            'current_page'=>$pagingOrders->currentPage()
        ];
    }

    /**
     * @param $id
     * @return array
     * @throws OrderException
     * 获取某个订单的详细信息
     */
    public function getOrderDetailById($id) {
        (new IsMustBePostiveInt())->goCheck();
        $order =OrderModel::get($id);
        if(!$order){
            throw new OrderException();
        }else {
            return $order->toArray();
        }
    }
}