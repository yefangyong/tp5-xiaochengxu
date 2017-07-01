<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/24
 * Time: 12:21
 */

namespace app\lib\exception;


class CategoryException extends BaseException
{
    public $msg = '请求的分类不存在，请检查参数';
    public $errorCode = '50000';
    public $code = '400';
}