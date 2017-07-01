<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/21
 * Time: 21:47
 */

namespace app\api\model;


class Product extends BaseModel
{
    protected $hidden = ['delete_time','create_time','update_time','pivot','img_id','from','category_id'];

    /**
     * @param $value
     * @param $data
     * @return string
     * 转化图片路径
     */
    public function getMainImgUrlAttr($value,$data) {
        return $this->prefixImgUrl($value,$data);
    }
    /**
     * @return \think\model\relation\HasMany
     * 关联商品图片表
     */
    public function imgs() {
        return $this->hasMany('ProductImage','product_id','id');
    }

    /**
     * @return \think\model\relation\HasMany
     * 关联商品详情表
     */
    public function properties() {
        return $this->hasMany('ProductProperty','product_id','id');
    }

    /**
     * @param int $count
     * @return false|\PDOStatement|string|\think\Collection
     * 获取最近新品数据
     */
    public static function getMostRecent($count = 12) {
        return self::limit($count)->order('create_time','desc')->select();
    }

    /**
     * @param $id
     * @return false|\PDOStatement|string|\think\Collection
     * 通过分类查找所有的商品数据
     */
    public static function getAllProductByCategoryID($id) {
        return self::where('category_id','=',$id)->select();
    }

    /**
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     * 获取某个商品的详细信息
     */
    public static function getProductDetail($id) {
        return self::with([
            'imgs'=>function($query) {
                $query->with(['imgUrl'])->order('order','asc');
            }
        ])->with(['properties'])->find($id);
    }
}