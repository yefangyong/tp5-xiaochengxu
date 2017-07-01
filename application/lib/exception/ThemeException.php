<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/6/22
 * Time: 21:10
 */

namespace app\lib\exception;


class ThemeException extends BaseException
{
    public $msg = '请求的主题不存在';
    public $errorCode = '30000';
    public $code = '400';
}