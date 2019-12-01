<?php 

//载入配置文件
require_once '../config.php';

//登录必须要防止伪造，采用session的方案，箱子是放在服务端的
//给用户找一个箱子（如果你之前有，就用以前的没有就给个新的）
session_start();

function login(){
  //1.接受并校验
  //2.持久化
  //3.响应
  if(empty($_POST['email'])){
    $GLOBALS['message']='请填写邮箱';
    return;
  }

  if(empty($_POST['password'])){
    $GLOBALS['message']='请填写密码';
    return;
  }

  $email=$_POST['email'];
  $password=$_POST['password'];
//上面是属于表单的校验，下面是属于业务的校验

//当客户端提交过来的完整的表单信息就应该对其进行数据校验
//   if($email!='admin@sample.com'){
//     $GLOBALS['message']='邮箱与密码不匹配';
//     return;
//   }
// if($password!='admin'){
//     $GLOBALS['message']='邮箱与密码不匹配';
//     return;
//   }

//数据库的校验
  $conn=mysqli_connect(XIU_DB_HOST,XIU_DB_USER,XIU_DB_PASS,XIU_DB_NAME);
  if(!$conn){
    exit('<h1>数据库连接失败</h1>');
  }

 // 因为在数据库里面Email是唯一的，我这样写找到第一条就不会再往下找了
  $query=mysqli_query($conn,"select * from users where email='{$email}' limit 1;");

  if(!$query){
    //不可能有两个错误消息，因为前面有错就直接return掉了
     $GLOBALS['message']='登录失败，请重试！';
     return;
  }

  //拿到了结果集，就应该登着三蹦子去取，但是每次只能取一条数据哦
  //只可能拿到一条，所以说可以不遍历
  $user=mysqli_fetch_assoc($query);

  //有可能没拿到
  if(!$user){
    //其实是用户名不存在
     $GLOBALS['message']='邮箱和密码不匹配！';
     return;
  }
  if($user['password']!=$password){
    //密码不正确
     $GLOBALS['message']='邮箱和密码不匹配！';
     return;
  }

  //你只有这些都通过了我才会给你开箱子存东西，并且把钥匙给你

  //在跳转之前应该在session里面放东西，并且钥匙给了客户端
  //在箱子里面存，采用键值的方式
  //存一个登录标识，下次就可以在要访问的页面取那个标识
  //$_SESSION['is_login_in']=true;
  // 我可以直接存当前是哪个用户登录
  //为了后续可以直接获取当前登录用户的信息，这里直接将用户信息放到session中
  //而且session的作用域是整个根目录都有，只要在会话范围内都可以访问到
 //存进去的user是那一行的信息
  $_SESSION['current_login_user']=$user;
  //为防止用户登录之后修改信息，我放ID进去，随时好查改
  //因为这样做没必须，谁会直接去改数据库呢
  //$_SESSION['current_login_user_id']=$user['id'];


  //一切OK，可以跳转
  header('Location:/admin/index0.php');
} //函数结束

if($_SERVER['REQUEST_METHOD']==='POST'){
  login();
}


if($_SERVER['REQUEST_METHOD']==='GET'&&isset($_GET['action'])&&$_GET['action']==='logout'){
  //删除掉session里面的那个键
  unset($_SESSION['current_login_user']);
}



 ?>



<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Sign in &laquo; Admin</title>
  <link rel="stylesheet" href="/static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="/static/assets/css/admin.css">
  <link rel="stylesheet" href="/static/assets/vendors/animate/animate.css">
</head>
<body>
  <div class="login">
    <!-- novalidate取消浏览器自带的校验发、功能 -->
    <!-- autocomplete='off'关闭客户端自动完成功能 -->
    <!-- 刷新一次页面也会晃一次 -->
    <form class="login-wrap<?php echo isset($message)?' shake animated':''  ?>" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" novalidate autocomplete="off">
      <img class="avatar" src="/static/assets/img/default.png">
      <!-- 作为一个优秀的页面开发人员，必须考虑一个页面的不同状态下展示的内容不一样的状况 -->
      <!-- 有错误信息时展示 -->
     <?php if (isset($message)): ?>
       <div class="alert alert-danger">
        <strong>错误！</strong><?php echo $message; ?>
      </div>
      <?php endif ?>
      <div class="form-group">
        <label for="email" class="sr-only">邮箱</label>
        <input id="email" name="email" type="email" class="form-control" placeholder="邮箱" autofocus value="<?php echo empty($_POST['email'])?'':$_POST['email'] ?>">
        <!-- 上面：提交一次就会更新一次，就会保持 -->
      </div>
      <div class="form-group">
        <label for="password" class="sr-only">密码</label>
        <input id="password" name="password" type="password" class="form-control" placeholder="密码">
      </div>
      <button class="btn btn-primary btn-block" href="index.php">登 录</button>
    </form>
  </div>
  <!-- 要写JS代码去判断什么时候发送请求去拿代码 -->
  <!-- 客户端代码要诀：在一个合适的时机做一件合适的事情 -->
  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script>
  $(function($){
    //1.单独作用域
    //2.确保页面加载之后执行

    //目标：在用户输入自己的邮箱之后，页面上展示这个邮箱对应的头像
    //实现：
    //-时机：邮箱文本框失去焦点,并且里面填写的是邮箱时
    //事情：获取这个文本框中填写的邮箱对应的邮箱地址，显示到上面的img元素上

    var emailFormat=/^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/
    $('#email').on('blur',function(){
      //JS的话就算这个文本框为空，拿不到这个值也不会报错，PHP会
      var value=$(this).val()
      //忽略掉文本框为空，或者不是一个邮箱
      if(!value|| !emailFormat.test(value)) return

      //到这里用户输入了一个合理的邮箱地址，展示到上面的img元素上
      //获取这个邮箱对应的头像地址，展示到上面的img元素上
      //因为客户端的JS无法直接操作数据库，应该通过JS发送
      //AJAX请求，告诉服务端的某个接口
      //让这个接口帮助客户端获取头像地址

      $.get('/admin/api/avatar.php',{email:value},
      function(res){
          //希望res=>这个邮箱对应的头像地址
          if(!res) return
          //展示到上面的img元素上
        // $('.avatar').attr('src',res)
        //像这么写是不行的,s上一个还没隐藏完下一个就出来了
        //$('.avatar').fadeOut().attr('src',res).fadeIn()
        $('.avatar').fadeOut(function(){
          $(this).on('load',function(){
            $(this).fadeIn()

          }).attr('src',res)//.前面注册图片完全加载成功事件,先注册

          //为什么这样，因为得到的路径是AJAX的响应，会等半天，突然出来突兀

        })//等到淡出完成再执行里面的东西

      })//AJAX发送请求结束


    })//失去焦点事件结尾
  })//函数结束
    
  </script>
</body>
</html>
