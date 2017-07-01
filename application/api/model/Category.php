<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/24
 * Time: 12:15
 */

namespace app\api\model;


class Category extends BaseModel
{

    protected $hidden = [
        'delete_time','update_time','description'
    ];
    public function img() {
        return $this->belongsTo('Image','topic_img_id','id');
    }
}