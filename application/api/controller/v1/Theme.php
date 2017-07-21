<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/21
 * Time: 21:46
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\validate\IDCollection;
use app\api\validate\IsMustBePostiveInt;
use app\lib\exception\ThemeException;

class Theme extends BaseController
{
    /**
     * @url /theme?ids=1,2,3
     * @return 一组theme数据
     */
    public function getSimpleList($ids='') {
        (new IDCollection())->goCheck();
        $ids = explode(',',$ids);
        $result = \app\api\model\Theme::with('topicImg,headImg')->select($ids);
       if($result->isEmpty()) {
           $e = new ThemeException([
               'msg'=>'请求的主题不存在',
               'errorCode'=>'30000'
           ]);
           throw $e;
       }
       return $result;

    }

    /**
     * @url /theme/1
     * 获取某个主题下面的所有商品
     */
    public function getComplexOne($id) {
        (new IsMustBePostiveInt())->goCheck();
       $result = \app\api\model\Theme::getThemeWithProducts($id);
       if(!$result) {
           $e = new ThemeException([
               'msg'=>'请求的主题信息不存在'
           ]);
           throw $e;
       }
       return $result;
    }
}