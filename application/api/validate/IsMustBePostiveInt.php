<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/28
 * Time: 22:29
 */

namespace app\api\validate;


use think\Validate;

class IsMustBePostiveInt extends BaseValidate
{
    protected $rule = [
        'id'=>'require|isPostiveInt',
        'num'=>'in:1,2,3'
    ];

    //自定义函数
    protected function isPostiveInt($value,$rule = '',$data = '',$filed = '') {
        if(is_numeric($value) && is_int($value + 0) && is_int($value + 0) >0) {
            return true;
        }else{
            return $filed.'字段不是正整数';
        }

    }
}