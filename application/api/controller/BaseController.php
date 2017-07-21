<?php
/**
 * Created by PhpStorm.
 * User: 12810
 * Date: 2017/7/2
 * Time: 9:29
 */

namespace app\api\controller;


use app\api\service\Token;
use think\Controller;

class BaseController extends Controller
{
    protected static function checkPrimaryScope() {
        Token::needPrimaryScope();
    }

    protected static function checkExclusiveScope() {
        Token::needExclusiveScope();
    }
}