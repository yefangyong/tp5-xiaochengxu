<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/25
 * Time: 14:13
 */

namespace app\api\model;


class User extends BaseModel
{

    /**
     * @return \think\model\relation\HasOne
     * 关联地址模型
     */
    public function address() {
        return $this->hasOne('userAddress','user_id','id');
    }
    /**
     * @param $openid
     * @return array|false|\PDOStatement|string|\think\Model
     * 根据openid获取用户
     */
    public static function getUserByOpenID($openid) {
        $user = self::where('openid','=',$openid)->find();
        return $user;
    }
}