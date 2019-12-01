<?php 

//这是一个数据接口，根据用户邮箱获取用户头像
// email=>image

require_once '../../config.php';
//1.接收传递过来的邮箱

//为什么校验呢？因为客户端那边可以看到你的JS代码且可以编辑
if(empty($_GET['email'])){
	exit('缺少必要参数');
}
$email=$_GET['email'];

//2.查询对应的头像地址
$conn=mysqli_connect(XIU_DB_HOST,XIU_DB_USER,XIU_DB_PASS,XIU_DB_NAME);
if(!$conn){
	exit('连接数据库失败');
}

//这是个结果集，需要自己去拿。没有那个限制1的话就会从头找到尾，
$res=mysqli_query($conn,"select avatar from users where email
	='{$email}' limit 1;");

if(!$res){
	exit('查询失败');
}

//自己去拿结果集,拿到的结果集是关联数组
$row=mysqli_fetch_assoc($res);

//3.echo
//这边输出的东西就是那边AJAX拿到的响应
echo $row['avatar'];



