<?php
/**
 * Created by PhpStorm.
 * User: yefy
 * Date: 2017/8/6
 * Time: 19:28
 */

namespace app\api\model;


class ThirdApp extends BaseModel
{
    public static function check($ac,$se) {
        $app = self::where('app_id','=',$ac)->where('app_secret','=',$se)->find();
        if($app) {
            return $app;
        }else {
            return '';
        }
    }
}