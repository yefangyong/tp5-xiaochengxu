<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/5
 * Time: 15:25
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use app\api\service\Pay as PayService;
use app\api\service\WxNotify;
use app\api\validate\IsMustBePostiveInt;

class Pay extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope'=>['only'=>'getPreOrder']
    ];

    /**
     * @param string $id
     * @return array
     * 获得预订订单
     */
    public function getPreOrder($id = '') {
        (new IsMustBePostiveInt())->goCheck();
        $pay = new PayService($id);
        $status = $pay->pay();
        return $status;
    }

    public function receiveNotify() {
        //通知频率为15/15/30/180/。。。。s

        //1.检测库存量,防止超卖
        //2.更新这个订单的status的状态
        //3.减少库存
        //4.如果成功处理，我们返回微信成功处理的信息，如果没有，我们返回微信处理失败的信息

        //特点：post方法,xml格式,不能携带参数
        $notify = new WxNotify();
        $notify->Handle();
    }
}