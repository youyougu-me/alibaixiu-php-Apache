<?php 
//var_dump($_FILES['avatar']);

//接收文件
//保存文件
//返回这个文件的访问URL

if(empty($_FILES['avatar'])){
	exit('必须上传文件');
}

$avatar=$_FILES['avatar'];

if($avatar['error']!=UPLOAD_ERR_OK){
	exit('上传失败');
}

//校验类型，大小

//makedrr好像这个方法可以创建一个目录
//移动文件到网站范围之内

//先拿到上传的那个文件的扩展名
$ext=pathinfo($avatar['name'],PATHINFO_EXTENSION);
$target='../../static/uploads/img-'.uniqid().'.'.$ext;

if(!move_uploaded_file($avatar['tmp_name'], $target)){
	exit('上传失败');
}

//上传成功
// 把路径返回，但是应该是绝对路径
echo substr($target, 5);

