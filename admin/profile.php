<?php 
require_once'../functions.php';

//判断用户是否登录，是否有session
xiu_get_current_user();


 ?>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Dashboard &laquo; Admin</title>
  <link rel="stylesheet" href="/static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="/static/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="/static/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="/static/assets/css/admin.css">
  <script src="/static/assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <?php include 'inc/navbar.php' ;?>
    <div class="container-fluid">
      <div class="page-title">
        <h1>我的个人资料</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong> 发生XXX错误
      </div> -->
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-3 control-label">头像</label>
          <div class="col-sm-6">
            <label class="form-image">
              <input id="avatar" type="file">
              <img src="/static/assets/img/default.png" alt="">
              <!-- 这个是隐藏文本框，用来接收文件的路径 -->
              <!-- 在AJAX把图片存储路径返回时接受 -->
              <!-- 那么在下面的表单提交的时候就可以一下子提交了 -->
              <input type="hidden" name="avatar">
              <i class="mask fa fa-upload"></i>
            </label>
          </div>
        </div>
        <div class="form-group">
          <label for="email" class="col-sm-3 control-label">邮箱</label>
          <div class="col-sm-6">
            <input id="email" class="form-control" name="email" type="type" value="w@zce.me" placeholder="邮箱" readonly>
            <p class="help-block">登录邮箱不允许修改</p>
          </div>
        </div>
        <div class="form-group">
          <label for="slug" class="col-sm-3 control-label">别名</label>
          <div class="col-sm-6">
            <input id="slug" class="form-control" name="slug" type="type" value="zce" placeholder="slug">
            <p class="help-block">https://zce.me/author/<strong>zce</strong></p>
          </div>
        </div>
        <div class="form-group">
          <label for="nickname" class="col-sm-3 control-label">昵称</label>
          <div class="col-sm-6">
            <input id="nickname" class="form-control" name="nickname" type="type" value="汪磊" placeholder="昵称">
            <p class="help-block">限制在 2-16 个字符</p>
          </div>
        </div>
        <div class="form-group">
          <label for="bio" class="col-sm-3 control-label">简介</label>
          <div class="col-sm-6">
            <textarea id="bio" class="form-control" placeholder="Bio" cols="30" rows="6">MAKE IT BETTER!</textarea>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-3 col-sm-6">
            <button type="submit" class="btn btn-primary">更新</button>
            <a class="btn btn-link" href="password-reset.php">修改密码</a>
          </div>
        </div>
      </form>
    </div>
  </div>

  <?php $current_page = 'profile'; ?>
  <?php include 'inc/sidebar.php' ;?>

  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script src="/static/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>
    //异步头像上传
     /*<div class="col-sm-6">
          <label class="form-image">
            <input id="avatar" type="file">
            <img src="/static/assets/img/default.png" alt="">
            <i class="mask fa fa-upload"></i>
          </label>
      </div>*/
      //当文件选择状态发生变化会执行这个事件处理函数
      //但是当我点击确定上传或者是取消都会打印
      $('#avatar').on('change',function(){

        //这里的this是指input标签
        //那么这个$this就是jQuery对象
        var $this=$(this);

        //判断是否选中了文件
        var files=$(this).prop('files')
        if (!files.length) return
        //拿到我们要上传的文件
        var file=files[0]


        //这里拿到后，客户端这边可以做校验
        //客户端这么做了，服务端依然得做

        //文件要传递必须以二进制的方式传递
        //FormData是HTML5中新增的一个成员，专门配合AJAX操作，用于在客户端和
        //服务端之间传递二进制数据

        //定义POST请求需要传递的东西，因为这个里涉及到文件上传了
        //所以比较特别，不是简单的ID啊什么用?传递的了
        //文件，二进制就必须用（formdata）,AJAX文件上传必须用这个
        var data=new FormData()
        //前面是name，后面是文件信息对
        data.append('avatar',file)

        //用这种方式也不需要设置content-type了

        var xhr=new XMLHttpRequest()
        xhr.open ('POST','/admin/api/upload.php')
        xhr.send(data)//借助于formdata传递文件
        
        //这个就相当于兼容写法的第4个状态，readystate=4
        xhr.onload=function(){
          //console.log(this.responseText)
          $this.siblings('img').attr('src',this.responseText)
          $this.siblings('input').val(this.responseText)
        }
      
      })//文件状态改变事件完

  </script>
  <script>NProgress.done()</script>
</body>
</html>
