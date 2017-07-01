<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/21
 * Time: 21:46
 */

namespace app\api\model;


class Theme extends BaseModel
{
    protected $hidden = [
        'delete_time','update_time','topic_img_id','head_img_id'
    ];
    public function topicImg() {
        return $this->belongsTo('Image','topic_img_id','id');
    }

    public function headImg() {
        return $this->belongsTo('Image','head_img_id','id');
    }

    public function product() {
        return $this->belongsToMany('Product','theme_product','product_id','theme_id');
    }

    /**
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     * 获取某个主题下面的所有商品信息
     */
    public static function getThemeWithProducts($id) {
        $theme = self::with('product,headImg,topicImg')->find($id);
        return $theme;
    }
}