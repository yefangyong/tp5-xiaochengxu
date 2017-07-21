<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/1
 * Time: 22:12
 */

namespace app\lib\exception;


class ForbidException extends BaseException
{
    public $code = 403;

    public $msg = '权限不够';

    public $errorCode = 10001;
}