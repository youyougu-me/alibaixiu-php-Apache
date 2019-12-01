<?php 

//根据客户端传过来的ID删除对应数据
//不管是批量删除还是单独删除都适用

require_once '../functions.php';

if(empty($_GET['id'])) {

	exit('缺少必要参数');
}

//加个Int,接受到的只能是数字
$id=(int)$_GET['id'];
//=>1 or 1=1
//sql注入


$rows=xiu_execute('delete from posts where id in ('.$id.');');

//跳转回页面应该用绝对路径
//header('Location:/admin/posts.php');

// 跳转回删除前的来源
//http中的referer用来标识当前请求的来源
header('Location:'.$_SERVER['HTTP_REFERER']);
