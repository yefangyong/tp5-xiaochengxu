<?php
/**
 * Created by PhpStorm.
 * User: yefy
 * Date: 2017/8/7
 * Time: 15:09
 */

namespace app\api\behavior;


class CROS
{
    public function appInit() {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: token,Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: POST,GET');
        if(request()->isOptions()) {
            exit();
        }
    }
}