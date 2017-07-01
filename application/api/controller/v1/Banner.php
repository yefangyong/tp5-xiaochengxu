<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/28
 * Time: 20:44
 */

namespace app\api\controller\v1;


use app\api\model\Banner as BannerModel;
use app\api\validate\IsMustBePostiveInt;
use app\lib\exception\BannerMissException;

class Banner
{
    /**
     * 获取指定id的banner信息
     * @httpd Get
     * url
     * @param $id @banner的id号
     *
     */
    public function getBanner($id) {
        (new IsMustBePostiveInt())->goCheck();
        $banner = BannerModel::getBannerById($id);
        if(!$banner) {
            throw new BannerMissException([
                'msg' => '请求banner不存在',
                'errorCode' => 40000
            ]);
        }
        return $banner;
    }
}