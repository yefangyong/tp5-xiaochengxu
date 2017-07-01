<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/17
 * Time: 18:03
 */

namespace app\api\model;


use think\Model;

class Image extends BaseModel
{
    protected $hidden = ['delete_time','update_time','id','from',];

    //获取器，在获取数据的字段值后自动进行处理，例如，我们需要对状态值进行转换
    public function getUrlAttr($value,$data) {
        return $this->prefixImgUrl($value,$data);
    }

}