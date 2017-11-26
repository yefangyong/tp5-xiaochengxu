<?php
/**
 * Created by PhpStorm.
 * User: yefy
 * Date: 2017/8/3
 * Time: 11:42
 */

namespace app\api\controller\v1;


use app\api\service\AppToken;
use app\api\service\UserToken;
use app\api\service\Token as TokenService;
use app\api\validate\AppTokenGet;
use app\api\validate\TokenGet;
use app\lib\exception\ParameterException;

class Token
{

    /**
     * @param string $code
     * @return array
     * 根据客户端的code获取token
     */
    public function getToken($code = '') {
        (new TokenGet())->goCheck();
        $ut = new UserToken($code);
        $token = $ut->get();
        return [
            'token'=>$token
        ];
    }

    /**
     * @param string $token
     * @return array
     * 验证客户端token的合法性
     */
    public function verifyToken($token = '') {
        if(!$token) {
            new ParameterException([
                'token 不存在'
            ]);
        }
        $valid = TokenService::verifyToken($token);

        return [
            'isValid'=>$valid
        ];
    }

    /**
     * @param string $ac
     * @param string $se
     * @return array
     * 获取第三方应用的token
     */
    public function getAppToken($ac = '',$se = '') {
        (new AppTokenGet())->goCheck();
        $token = new AppToken();
        $token->get($ac,$se);
        if($token) {
            return [
                'token'=>$token
            ];
        }

    }
}