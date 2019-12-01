<?php 
// 待会儿连接数据库，需要载入配置文件
require_once 'config.php';


//封装大家公用的函数

session_start();


//定义函数时一定要注意：函数名与内置函数冲突问题



//获取当前用户登录信息
//如果没有获取到则自动跳转到登录页面
function xiu_get_current_user(){
  if(empty($_SESSION['current_login_user'])){
  //没有当前登录用户信息，意味着没有登录
  header('Location:/admin/login.php');
  exit();//没有必要再执行之后的代码
}

//如果有session里面的东西的话，就把里面的那一行用户信息返还回去
return $_SESSION['current_login_user'];
}


//通过一个数据库查询获取多条数据
//=>索引数据 套 关联数组

function xiu_fetch_all($sql){
	$conn=mysqli_connect(XIU_DB_HOST,XIU_DB_USER,XIU_DB_PASS,XIU_DB_NAME);
	if(!$conn){
		exit('数据库连接失败');
	}

	$query=mysqli_query($conn,$sql);
	if(!$query){
		//查询失败
		return false;
	}

	// 先定义一个空数组，防止没查到数据的时候报错
	$result=array();
	while ($row=mysqli_fetch_assoc($query)){
		//这边是属于一行一行的拿
		$result[]=$row;
	}

	//如果自己没写关闭连接，则PHP也会自动帮我们关
	mysqli_free_result($query);
	mysqli_close($conn);


	return $result;


}//函数结束



//数据库查询获取单条数据
//=>关联数组
function xiu_fetch_one($sql){
	// $conn=mysqli_connect(XIU_DB_HOST,XIU_DB_USER,XIU_DB_PASS,XIU_DB_NAME);
	// if(!$conn){
	// 	exit('数据库连接失败');
	// }

	// $query=mysqli_query($conn,$sql);
	// if(!$query){  
	// 	//查询失败
	// 	return false;
	// }


	// // 因为这个只针对于查出来的只有一行数据
	// return mysqli_fetch_assoc($query);
	$res=xiu_fetch_all($sql);
	return isset($res[0])? $res[0]:null;


}//函数结束


//数据库曾删改语句
function xiu_execute($sql){
	$conn=mysqli_connect(XIU_DB_HOST,XIU_DB_USER,XIU_DB_PASS,XIU_DB_NAME);
	if(!$conn){
		exit('数据库连接失败');
	}

	$query=mysqli_query($conn,$sql);
	if(!$query){
		//查询失败
		return false;
	}

	//拿到受影响行数
	$affected_rows=mysqli_affected_rows($conn);

	//如果自己没写关闭连接，则PHP也会自动帮我们关
	
	mysqli_close($conn);

	return $affected_rows;

}




