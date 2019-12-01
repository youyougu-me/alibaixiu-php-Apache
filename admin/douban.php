<?php 
require_once'../functions.php';

//判断用户是否登录，是否有session
xiu_get_current_user();


 ?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>jQuery不同源请求</title>
  <link rel="stylesheet" href="/static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="/static/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="/static/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="/static/assets/css/admin.css">
  <script src="/static/assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <?php include 'inc/navbar.php'; ?>
    <div class="container-fluid">
      <div class="page-title">
        <h1>最新电影榜单</h1>  
      </div>
      <ul id="movies"></ul>

    </div>
  </div>

  <!-- 这个是用于侧边栏检测是否该高亮 -->
  <?php $current_page = 'douban'; ?>
  <?php include 'inc/sidebar.php' ;?>

  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script src="/static/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>
   //XMLHttpRequest不能发送对于不同源地址的请求
   //因为这是跨域请求，得服务端配合，AJAX不支持跨域请求
    // $.get('http://localhost/doubanAPI.php',{},function(res){
    //   console.log(res)
    // })

  //   function foo(res){
  //     console.log(res)
  //   }
  // </script>
  // <!-- script可以对不同源地址请求 -->
  // <script src="http://localhost/doubanAPI.php?callback=foo">
  // <!-- //用jsonP的方式，那边返回js脚本(foo的调用)） -->
  </script> 


<!-- ====================================== -->
  <!-- 用jQuery发不同源请求 -->
  <script>

  $.ajax({
  //jQuery的AJAX请求，不用加那个callback函数，内部自动帮我们
  url:'http://localhost/doubanAPI.php',
  dataType:'jsonp',
  success:function(res){
  //console.log(res) 索引数组套关联数组
  $(res).each(function(i,item){
    //JS也有模板字符串，类似于PHP的双引号字符串
    $('#movies').append(`<li><img src="${item.avatar}" alt="" />${item.name}</li>`)

  })


  }//不同源请求回调完

})//jsono不同源请求完

    

  </script>

  <script>NProgress.done()</script>
</body>
</html>