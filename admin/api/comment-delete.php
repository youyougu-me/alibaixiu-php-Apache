<?php 

//根据客户端传过来的ID删除对应数据
//不管是批量删除还是单独删除都适用

require_once '../../functions.php';

if(empty($_GET['id'])) {

	exit('缺少必要参数');
}

//加个Int,接受到的只能是数字
$id=(int)$_GET['id'];
//=>1 or 1=1
//sql注入

//返回的是受影响的行数
$rows=xiu_execute('delete from comments where id in ('.$id.')');

header('Content-Type:application/json');

//序列化，Http协议只支持字符串传递，客户端那边需要反序列化
echo json_encode($rows>0);
//true false
//因为我这次是AJAX请求，所以不需要跳转页面

