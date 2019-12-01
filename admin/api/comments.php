<?php
//此接口功能接收客户端的AJAX请求 返回评论的数据

//载入封装的所有函数
require_once '../../functions.php';

//接收客户端传过来的page
$page=empty($_GET['page'])?1:intval($_GET['page']);

// 定义查询参数
$length=4;
$offset=($page-1)*$length;
//查询点击那一页要显示的评论
$sql=sprintf('select
comments.*,
posts.title as post_title
from comments
inner join posts on comments.post_id=posts.id
order by comments.id
limit %d,%d;',$offset,$length);
$comments=xiu_fetch_all($sql);

//查询评论总条数
//fetch_one得到的是一个关联数组
$total_count=xiu_fetch_one('select count(1) as count
	from comments
	inner join posts on comments.post_id=posts.id')['count'];
//算出评论总页数
//虽然这里得到的是float型，但是json序列化的时候会把它转化成number
$total_Pages=ceil($total_count/$length);

//因为http协议只支持字符串传输
//所以我们先将数据转化为字符串（序列化）
$json=json_encode(array(
	'total_Pages'=>$total_Pages,
	'comments'=>$comments
	));

//设置响应的响应体的类型为JSON
header('Content-Type:application/json');

//响应给客户端
echo $json;