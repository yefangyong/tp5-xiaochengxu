<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/2
 * Time: 17:12
 */

namespace app\lib\exception;


class OrderException extends BaseException
{
    public $code = 404;

    public $msg = '商品不存在';

    public $errorCode = 60001;
}