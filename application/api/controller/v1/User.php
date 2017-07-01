<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/25
 * Time: 14:12
 */

namespace app\api\controller\v1;


use app\api\service\UserToken;
use app\api\validate\TokenGet;

class User
{
    public function getToken($code = '') {
        (new TokenGet())->goCheck();
        $tk = new UserToken($code);
        $token = $tk->get();
        return [
            'token'=>$token
        ];
    }
}