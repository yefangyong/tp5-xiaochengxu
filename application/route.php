<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
//动态注入

//Route::rule('路由表达式','路由地址','请求类型','路由参数[数组]','变量规则[数组]');

//banner
Route::get('api/:version/banner/:id','api/:version.banner/getBanner');

//theme
Route::get('api/:version/theme/:id','api/:version.theme/getComplexOne');
Route::get('api/:version/theme','api/:version.theme/getSimpleList');

//Route::get('api/:version/product/by_category','api/:version.product/getAllProductByCategoryID');
//Route::get('api/:version/product/:id','api/:version.product/getOne',[],['id'=>'\d+']);
//Route::get('api/:version/product/recent','api/:version.product/getRecent');

//product
Route::group('api/:version/product',function(){
    Route::get('/by_category','api/:version.product/getAllProductByCategoryID');
    Route::get('/:id','api/:version.product/getOne',[],['id'=>'\d+']);
    Route::get('/recent','api/:version.product/getRecent');
});

//category
Route::get('api/:version/category/all','api/:version.category/getAllCategorys');

//token
Route::post('api/:version/token/user','api/:version.token/getToken');
Route::post('api/:version/token/verify','api/:version.token/verifyToken');
Route::post('api/:version/token/app','api/:version.token/getAppToken');

//Address
Route::get('api/:version/address/ems','api/:version.address/getEmsData');
Route::get('api/:version/address/sendCode','api/:version.address/sendCode');
Route::post('api/:version/address','api/:version.address/createOrUpdateAddress');
Route::get('api/:version/address','api/:version.address/getAddress');
Route::post('api/:version/address/getAccess','api/:version.address/getAccess');

//Order
Route::post('api/:version/order','api/:version.order/placeOrder');
Route::post('api/:version/order/:id','api/:version.order/getOrderDetailById',[],['id'=>'\d+']);
Route::get('api/:version/order/by_user','api/:version.order/getSummaryByUser');
Route::get('api/:version/order/paginate','api/:version.order/getSummary');

//pay
Route::post('api/:version/pay/pre_order','api/:version.pay/getPreOrder');
Route::post('api/:version/pay/notify','api/:version.pay/receiveNotify');

