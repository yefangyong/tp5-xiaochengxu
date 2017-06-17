<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/29
 * Time: 9:03
 */

namespace app\api\validate;


use app\lib\exception\ParameterException;
use think\Exception;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck() {
        //获取实例接口
        $request = Request::instance();
        //获取所有参数
        $param = $request->param();
         $result = $this->batch()->check($param);
        if(!$result) {
            $e = new ParameterException([
                'msg'=>$this->error
            ]);
//            $e->msg = $this->error;
            throw $e;
//            $error = $this->error;
//            throw new Exception($error);
        }else {
            return true;
        }
    }
}