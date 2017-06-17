<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/28
 * Time: 20:44
 */

namespace app\api\controller\v1;


use app\api\validate\IsMustBePostiveInt;
use app\lib\exception\BannerMissException;
use think\Exception;
use app\api\model\Banner as BannerModel;

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
        //隐藏字段
        $banner->hidden(['delete_time','update_time']);
        //显示字段
       // $banner->visible(['id']);
        if(!$banner) {
            throw new BannerMissException();
        }
        return $banner;
    }
}