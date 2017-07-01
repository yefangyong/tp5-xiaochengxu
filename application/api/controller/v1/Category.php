<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/24
 * Time: 12:14
 */

namespace app\api\controller\v1;


use app\lib\exception\CategoryException;

class Category
{
    public function getAllCategorys() {
        $categorys = \app\api\model\Category::all([],'img');
        if($categorys->isEmpty()) {
            throw new CategoryException();
        }
        return $categorys;
    }
}