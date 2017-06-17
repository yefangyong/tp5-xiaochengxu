<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/17
 * Time: 17:24
 */

namespace app\api\model;


use think\Model;

class BannerItem extends Model
{
    public function img() {
        return $this->belongsTo('Image','img_id','id');
    }
}