<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/2
 * Time: 21:50
 */

namespace app\api\model;


class Order extends BaseModel
{
    protected $autoWriteTimestamp = true;


    public function getSnapItemsAttr($value) {
        if(empty($value)) {
            return null;
        }else {
            return json_decode($value);
        }
    }

    public function getSnapAddressAttr($value) {
        if(empty($value)) {
            return null;
        }else {
            return json_decode($value);
        }
    }
    /**
     * @param $uid
     * @param int $page
     * @param int $size
     * @return \think\Paginator
     * 通过用户id获取订单的概要信息
     */
    public static function getSummaryByUser($uid,$page=1,$size=15) {
        $result = self::where('user_id','=',$uid)->order('create_time desc')
            ->paginate($size,false,['page'=>$page]);
        return $result;
    }

    /**
     * @param $page
     * @param $size
     * @return \think\Paginator
     * 获取订单的简要信息
     */
    public static function getSummary($page,$size) {
        $result = self::order('create_time desc')->paginate($size,false,['page'=>$page]);
        return $result;
    }
}