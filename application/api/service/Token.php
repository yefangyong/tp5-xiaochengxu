<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/29
 * Time: 11:16
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbidException;
use app\lib\exception\ParameterException;
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

    /**
     * @return bool
     * @throws ForbidException
     * @throws TokenException
     * 检查基本的权限，用户和cms管理员都可以访问
     */
    public static function needPrimaryScope() {
        $scope = Token::getCurrentTokenVar('scope');
        if($scope) {
            if($scope>=ScopeEnum::user) {
                return true;
            }else {
                throw new ForbidException([
                    'msg'=>'很抱歉你没有这个权限访问'
                ]);
            }
        }else {
            throw new TokenException();
        }
    }

    /**
     * @return bool
     * @throws ForbidException
     * @throws TokenException
     * 只有用户才可以访问的权限
     */
    public static function needExclusiveScope() {
        $scope = Token::getCurrentTokenVar('scope');
        if($scope) {
            if($scope==ScopeEnum::user) {
                return true;
            }else {
                throw new ForbidException([
                    'msg'=>'很抱歉你没有这个权限访问'
                ]);
            }
        }else {
            throw new TokenException();
        }
    }

    /**
     * @param $checkdUID
     * @return bool
     * @throws ParameterException
     * 验证是否是合法的操作
     */
    public static function isValidOperate($checkdUID) {
        if(!$checkdUID) {
            throw new ParameterException([
                'msg'=>'uid参数不得为空'
            ]);
        }
        if($checkdUID == self::getCurrentUid()) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * @param string $token
     * @return bool
     * 验证客户端token的合法性
     */
    public static function verifyToken($token = ''){
        $token = Cache::get($token);
        if($token) {
            return true;
        }else {
            return false;
        }
    }
}