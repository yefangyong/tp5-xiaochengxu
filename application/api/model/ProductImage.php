<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/29
 * Time: 15:50
 */

namespace app\api\model;


class ProductImage extends BaseModel
{

    protected $hidden = [
        'delete_time','product_id'
    ];

    public function imgUrl() {
        return $this->belongsTo('Image','img_id','id');
    }
}