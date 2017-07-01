<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/23
 * Time: 20:27
 */

namespace app\api\controller\v1;


use app\api\validate\Count;
use app\api\validate\IsMustBePostiveInt;
use app\lib\exception\ProductException;
use think\model\Collection;

class Product
{
    /**
     * @param int $count
     * @return false|\PDOStatement|string|\think\Collection
     * @throws ProductException
     * @url /product/recent?count=12
     * 获取最新的商品数据
     */
    public function getRecent($count = 12) {
        (new Count())->goCheck();
        $result = \app\api\model\Product::getMostRecent($count);
        $result->hidden(['summary']);
        if($result->isEmpty()) {
            $e = new ProductException();
            throw $e;
        }
        return $result;
    }

    /**
     * @param $id
     * @return false|\PDOStatement|string|\think\Collection
     * @throws ProductException
     * @url /product/by_category?id=1
     * 获取某个分类下面的商品数据
     */
    public function getAllProductByCategoryID($id) {
        (new IsMustBePostiveInt())->goCheck();
        $products = \app\api\model\Product::getAllProductByCategoryID($id);
        if($products->isEmpty()) {
            throw new ProductException([
                'msg'=>'该分类下没有商品，请检查参数'
            ]);
        }
        return $products;
    }

    /**
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws ProductException
     * 获取某个商品的详细信息
     */
    public function getOne($id) {
        (new IsMustBePostiveInt())->goCheck();
        $product = \app\api\model\Product::getProductDetail($id);
        if(!$product) {
            throw new ProductException();
        }
        return $product;
    }
}