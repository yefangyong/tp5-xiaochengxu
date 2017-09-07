<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/25
 * Time: 14:14
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\WxChatException;
use think\Exception;
use app\api\model\User as UserModel;

class UserToken extends Token
{
    protected $code;
    protected $wxAppID;
    protected $wxAppSecret;
    protected $wxLoginUrl;

    public function __construct($code)
    {
        $this->code = $code;
        $this->wxAppID = config('wx.app_id');
        $this->wxAppSecret = config('wx.app_secret');
        $this->wxLoginUrl = sprintf(config('wx.login_url'),$this->wxAppID,$this->wxAppSecret,$this->code);
    }

    /**
     * @return string
     * @throws Exception
     * 获取令牌
     */
    public function get() {
        $result = curl_get($this->wxLoginUrl);
        $wxresult = json_decode($result,true);
        if(empty($wxresult)) {
            throw new Exception('获取session_key和openid异常，微信内部错误');
        }else {
            $loginFail = array_key_exists('errcode',$wxresult);
            if($loginFail) {
                $this->processLoginError($wxresult);
            }else {
              return  $this->grantToken($wxresult);
            }
        }

    }

    /**
     * @param $wxresult
     * @throws WxChatException
     * 处理微信登录错误
     */
    protected function processLoginError($wxresult) {
        throw new WxChatException([
            'msg'=>$wxresult['errmsg'],
            'errorCode'=>$wxresult['errcode']
        ]);
    }


    /**
     * @param $wxresult
     * @return string
     * 分配令牌
     */
    protected function grantToken($wxresult) {
        //拿到openid
        //数据库里面看一下这个openid是否存在，如果存在则不处理，不存在则新增加一条user记录
        //生成令牌，准备缓存数据，写入缓存
        //把令牌返回到客户端
        //key 令牌
        //value wxresult ,$uid,scope
        $openid = $wxresult['openid'];
        $user = UserModel::getUserByOpenID($openid);
        if($user) {
            $uid = $user->id;
        }else {
            $uid = $this->newUser($openid);
        }
        $cacheValue = $this->prepareCacheValue($wxresult,$uid);
        return $this->saveToCache($cacheValue);
    }

    /**
     * @param $wxresult
     * @param $uid
     * @return mixed
     * 准备缓存数据
     */
    private function prepareCacheValue($wxresult,$uid) {
        $CacheValue = $wxresult;
        $CacheValue['uid'] = $uid;
        //16 普通用户 32 super用户 枚举类型
        $CacheValue['scope'] = ScopeEnum::user;
        return $CacheValue;
    }

    /**
     * @param $cacheValue
     * @return string
     * @throws TokenException
     * 把令牌信息和用户信息写入缓存
     */
    private function saveToCache($cacheValue) {
        $key =self::generateToken();
        //json_encode 可以把数组转化成字符串
        $value =json_encode($cacheValue);
        $expire_in = config('setting.token_expire_in');
        $cache = cache($key,$value,$expire_in);
        if(!$cache) {
            throw new TokenException([
                'msg'=>'服务器缓存异常',
                'errorCode'=>10005
            ]);
        }else {
            return $key;
        }

    }


    /**
     * @param $openid
     * @return mixed
     * 创建新用户
     */
    protected function newUser($openid) {
        $user = UserModel::create([
            'openid'=>$openid
        ]);
        return $user->id;
    }
}