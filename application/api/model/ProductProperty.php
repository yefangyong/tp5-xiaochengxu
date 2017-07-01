<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/29
 * Time: 15:52
 */

namespace app\api\model;


class ProductProperty extends BaseModel
{
    protected $hidden = [
        'delete_time','product_id','id'
    ];
}