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

class Banner extends Model
{
    public static function getBannerById($id) {
        //find 一维数组，只有一条数据，select 二维数组，多条数据
       $result =  Db::table('banner_item')->where('id='.$id)->find();
       return $result;

    }
}