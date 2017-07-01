<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/29
 * Time: 11:16
 */

namespace app\api\service;


use app\lib\exception\TokenException;
use think\Cache;
use think\Exception;
use think\Request;
use think\Response;

class Token
{
    /**
     * @return string
     * 形成随机token
     */
    public static function generateToken() {
        //32个随机组成的随机字符串
        $randChars = getRandChars(32);
        $timestamp = $_SERVER['REQUEST_TIME'];
        $salt = config('secure.token_salt');
        return md5($randChars.$timestamp.$salt);
    }

    /**
     * @param $key
     * @return mixed
     * @throws Exception
     * @throws TokenException
     * 根据变量获取缓存token里面的内容，例如：uid，openid,session_key
     */
    public static function getCurrentTokenVar($key) {
        //获取token
        $token = Request::instance()->header('token');
        $vars = Cache::get($token);
        if(!$vars) {
            throw new TokenException();
        }else {
            if(!is_array($vars)) {
                $vars = json_decode($vars,true);
            }
            if(array_key_exists($key,$vars)) {
                return $vars[$key];
            }else {
                throw new Exception(['尝试获取token的变量不存在']);
            }
        }
    }
    public static function getCurrentUid() {
        $uid = self::getCurrentTokenVar('uid');
        return $uid;
    }
}