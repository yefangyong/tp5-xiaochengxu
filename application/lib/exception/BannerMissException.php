<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/29
 * Time: 16:15
 */

namespace app\lib\exception;


class BannerMissException extends BaseException
{
    //http状态码
    public $code = 400;

    //错误信息
    public $msg = 'banner数据不存在';

    //错误码
    public $errorCode = 40000;
}