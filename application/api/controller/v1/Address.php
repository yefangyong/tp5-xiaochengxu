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