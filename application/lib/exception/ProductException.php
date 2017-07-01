<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/23
 * Time: 20:48
 */

namespace app\lib\exception;


class ProductException extends BaseException
{
    public $msg = '请求的产品不存在';
    public $errorCode = '30000';
    public $code = '400';
}