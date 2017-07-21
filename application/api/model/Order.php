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
}