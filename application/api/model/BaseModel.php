<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/21
 * Time: 20:45
 */

namespace app\api\model;


use think\Model;

class BaseModel extends Model
{
    //获取器，把一些参数的值转换一下
    public function prefixImgUrl($value,$data) {
        $finalUrl = $value;
        if($data['from'] == 1) {
            return Config('setting.img_prefix').$finalUrl;
        }else {
            return $finalUrl;
        }
    }
}