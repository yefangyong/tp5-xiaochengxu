<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/1
 * Time: 14:27
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\User;
use app\api\model\UserAddress;
use app\api\service\Token;
use app\api\validate\AddressNews;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;

class Address extends BaseController
{
    protected $beforeActionList = [
        'checkPrimaryScope'=>['only'=>'createOrUpdateAddress,getAddress']
    ];

    /**
     * @return null|static
     * 获取用户的地址信息
     */
    public function getAddress() {
        $uid = Token::getCurrentUid();
        $userAddress = UserAddress::where('user_id','=',$uid)->find();
        if(!$userAddress) {
            new UserException([
                'msg'=>'用户地址不存在',
                'errorCode'=>600001
            ]);
        }
        return $userAddress;
    }

    /**
     * 获取快递的信息
     */
    public function getEmsData() {
        $type = 'zhongtong';
        $openId = '463675727356';
        $url = "https://www.kuaidi100.com/query?type=".$type."&postid=".$openId;
        $arr = json_decode(curl_get($url),true);
        echo '快递单号：'.$openId.'<br/>';
        foreach ($arr['data'] as $k=>$v) {
            if($k == 0) {
                echo "<span style='color: red'>".$v['time'].'&emsp;'.$v['context'].'&emsp;'.$v['location']."</span><br/>";
            }else {
               echo "<span>".$v['time'].'&emsp;'.$v['context'].'&emsp;'.$v['location']."</span><br/>";
            }
        }
    }

    /**
     *短信验证码的功能
     */
    public function sendCode() {
        $mobile = '13053112897';
        $tpl_id = 53036;
        $key = '98cfbf52a2ef191424ff071f4ae1615b';
        $url = "http://v.juhe.cn/sms/send?mobile=".$mobile."&tpl_id=".$tpl_id."&key=".$key."&tpl_value=";
        $code = rand(1000,9999);
        $str = '#code#='.$code;
        $str = urlencode($str);
        $url = $url.$str;
        $arr = json_decode(curl_get($url),true);
        if($arr['error_code'] == 0) {
            echo '发送成功';
        }else {
            echo '发送失败';
        }
    }



    /**
     * @return SuccessMessage
     * @throws UserException
     * 新增或者更新用户收获地址
     */
    public function createOrUpdateAddress() {
        //根据token来获取uid
        //根据uid判断用户是否存在，不存在则抛出异常
        //获取用户提交的地址信息
        //判断地址信息是否存在，不存在则添加，存在则更新
        $validate = new AddressNews();
        $validate->goCheck();
        $uid = Token::getCurrentUid();
        $user = User::get($uid);
        if(!$user) {
            throw new UserException();
        }
        //参数过滤
        $dataArr = $validate->getDataByRule(input('post.'));
        $userAddress = $user->address;
        if(!$userAddress) {
            //增加
            $user->address()->save($dataArr);
        }else {
            //更新
            $user->address->save($dataArr);
        }
        return json(new SuccessMessage(),201);
    }
}