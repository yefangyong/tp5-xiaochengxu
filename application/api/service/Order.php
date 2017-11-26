<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/2
 * Time: 10:36
 */

namespace app\api\service;
use app\api\model\Order as OrderModel;
use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\UserAddress;
use app\lib\exception\OrderException;
use app\lib\exception\UserException;
use think\Db;
use think\Exception;


class Order
{
    //订单的商品列表，从客户端传过来的参数
    protected $oProducts;

    //真实的商品列表
    protected $Products;

    //当前用户登录ID
    protected $uid;

    /**
     * @param $uid
     * @param $oProducts
     * @return array
     * 下单接口
     */
    public function place($uid,$oProducts) {
       $this->oProducts = $oProducts;
       $this->Products = $this->getProductsByOrder($oProducts);
       $this->uid = $uid;
       $status = $this->getOrderStatus();
       if(!$status['pass']) {
           $status['order_id'] = -1;
           return $status;
       }
       //开始创建订单，先开始创建订单快照,保存当时的订单状态，
        ////防止商品的属性发生改变，造成订单信息前后不一致
        $orderSnap =$this->snapOrder($status);
       $status = $this->createOrder($orderSnap);
       $status['pass'] = true;
       return $status;
    }

    /**
     * @param $snap
     * @return array
     * @throws Exception
     * 创建订单
     */
    private function createOrder($snap) {
        Db::startTrans();
        try {
            $orderNO = $this->makeOrderNo();
            $order = new OrderModel();
            $order->user_id = $this->uid;
            $order->order_no = $orderNO;
            $order->total_price = $snap['totalPrice'];
            $order->total_count = $snap['totalCount'];
            $order->snap_img = $snap['snapImage'];
            $order->snap_address = $snap['snapAddress'];
            $order->snap_name = $snap['snapName'];
            $order->snap_items = json_encode($snap['pStatus']);
            $order->save();
            $orderId = $order->id;
            $create_time = $order->create_time;
            //写入order_product表
            $orderProduct = new OrderProduct();
            foreach ($this->oProducts as &$oProduct) {
                $oProduct['order_id'] = $orderId;
            }
            $orderProduct->saveAll($this->oProducts);
            Db::commit();
        }catch (Exception $ex) {
            Db::rollback();
            throw $ex;
        }
        return [
            'order_no'=>$orderNO,
            'order_id'=>$orderId,
            'create_time'=>$create_time
        ];

    }

    /**
     * @return string
     * 随机产生订单编号
     */
    private function makeOrderNo() {
        $yCode = array('A','B','C','D','E','F','G','H','I','J');
        $orderSn = $yCode[intval(date('Y'))-2017].strtoupper(dechex(date('m'))).date('d').substr(time(),-5).substr(microtime(),2,5).sprintf('%02d',rand(0,99));
        return $orderSn;
    }

    /**
     * @param $status
     * @return array
     * 订单快照，存储当时订单的详细信息
     */
    public function snapOrder($status) {
        $snap = [
            'totalPrice'=>0,
            'totalCount'=>0,
            'pStatus'=>[],
            'snapAddress'=>null,
            'snapName'=>'',
            'snapImage'=>''
        ];
        $snap['totalPrice'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pStatusArray'];
        $snap['snapAddress'] = json_encode($this->getUserAddress($status));
        $snap['snapName'] =$this->Products[0]['name'];
        $snap['snapImage'] = $this->Products[0]['main_img_url'];
        if(count($this->oProducts)>1) {
            $snap['snapName'] .='等';
        }
        return $snap;
    }

    /**
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws UserException
     * 获取用户地址
     */
    public function getUserAddress() {
        $user =  UserAddress::where('user_id',$this->uid)->find();
        if(!$user) {
            throw new UserException([
                'msg'=>'用户地址不存在，创建订单失败'
            ]);
        }
        return $user;

    }

    /**
     * @param $orderID
     * @return array
     * 订单量的检测，复用getOrderStatus函数
     */
    public function checkOrderStock($orderID) {
        $oProduct = OrderProduct::where('order_id','=',$orderID)->select();
        $this->oProducts = $oProduct;
        $this->Products = $this->getProductsByOrder($oProduct);
        $status = $this->getOrderStatus();
        return $status;
    }

    /**
     * @return array
     * 获取订单状态
     */
    private function getOrderStatus() {
        $status = [
            'pass'=>true,
            'orderPrice'=>0,
            'totalCount'=>0,
            'pStatusArray'=>[]
        ];
        foreach($this->oProducts as $oProduct) {
            $pStatus = $this->getProductStatus(
                $oProduct['product_id'],$oProduct['count'],$this->Products
            );
            if(!$pStatus['haveStock']) {
                $status['pass'] = false;
            }
            $status['totalCount']+=$pStatus['counts'];
            $status['orderPrice']+=$pStatus['totalPrice'];
            array_push($status['pStatusArray'],$pStatus);
        }
        return $status;
    }

    /**
     * @param $oPID
     * @param $oCount
     * @param $products
     * @return array
     * @throws OrderException
     * 获取某个商品的订单状态
     */
    private function getProductStatus($oPID,$oCount,$products) {
        $pIndex = -1;
        $pStatus = [
            'id'=>null,
            'haveStock'=>false,
            'counts'=>0,
            'name'=>'',
            'price'=>0,
            'main_img_url',
            'totalPrice'=>0
        ];
        for($i = 0;$i<count($products);$i++) {
            if($oPID == $products[$i]['id']) {
                $pIndex = $i;
            }
        }
        if($pIndex == -1) {
            throw new OrderException([
                'msg'=>'ID'.'为'.$oPID.'的商品不存在,创建订单失败'
            ]);
        }else {
            $product = $products[$pIndex];
            $pStatus['id'] = $product['id'];
            $pStatus['name'] = $product['name'];
            $pStatus['counts'] = $oCount;
            $pStatus['main_img_url'] = $product['main_img_url'];
            $pStatus['price'] = $product['price'];
            $pStatus['totalPrice'] = $oCount*$product['price'];
            if($product['stock']-$oCount>=0) {
                $pStatus['haveStock'] = true;
            }else {
                $pStatus['haveStock'] = false;
            }
        }
        return $pStatus;
    }

    /**
     * @param $oProducts
     * @return mixed
     * 根据订单获取数据库里面的真实商品数量
     */
    public function getProductsByOrder($oProducts) {
        //还有一种方法就是循环查询数据库，但是不可取
        $opIDs = [];
        foreach ($oProducts as $Items) {
            array_push($opIDs,$Items['product_id']);
        }
        $products = Product::all($opIDs)->
        visible(['id','price','stock','name','main_img_url'])
            ->toArray();
        return $products;
    }


}