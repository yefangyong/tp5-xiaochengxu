<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/29
 * Time: 13:30
 */

namespace app\api\model;



use think\Db;
use think\Exception;
use think\Model;
use app\api\model\BannerItem;

class Banner extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];
    public function items() {
        return $this->hasMany('BannerItem','banner_id','id');
    }
    public static function getBannerById($id) {
        $banner = self::with(['items','items.img'])->find($id);
        return $banner;

    }
}