<?php
/**
 * Created by PhpStorm.
 * User: yefy
 * Date: 2017/8/6
 * Time: 19:25
 */

namespace app\api\service;


use app\api\model\ThirdApp;
use app\lib\exception\TokenException;


class AppToken extends Token
{
    /**
     * @param $ac
     * @param $se
     * @return string
     * 获取appToken
     */
    public function get($ac,$se) {
        $app = ThirdApp::check($ac,$se);
        if(!$app) {
            throw new TokenException([
                'msg'=>'授权失败',
                'errorCode'=>100004
            ]);
        }else {
            $scope = $app->scope;
            $uid = $app->id;
            $value = [
                'scope'=>$scope,
                'uid'=>$uid
            ];
            $token = $this->saveToCache($value);
            return $token;
        }
    }

    /**
     * @param $value
     * @return string
     * 把用户的信息存在缓存中，随机生成token，反悔token,我们可以根据token获取到用户的信息，根据token是否存在，判断身份
     * 是否有效
     */
    public function saveToCache($value) {
        $token = Token::generateToken();
        $expire_in = config('setting.token_expire_in');
        $result = cache($token,json_encode($value),$expire_in);
        if(!$result) {
            new TokenException([
                'msg'=>'缓存服务一场',
                'errorCode'=>10005
            ]);
        }
        return $token;
    }
}