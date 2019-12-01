
<!-- $current_page只是一个信号，这个信号来自于引用这个页面的页面 -->
<!-- 我同可以用$_SERVER['PHP_SELF']来取引用它的那个页面的信息 -->
<?php 
//因为这个路径是针对于这个文件夹而言的，换一个就不对了
//这个sidebar.php是被index.php等文件载入执行，
//所以这里写路径就不该写相对于此文件，而应该写相对于载入此
//文件的文件，根治的办法，采用物理路径

require_once'../functions.php';

//采用物理路径

//未防止引入此页面的页面未定义
$current_page=isset($current_page)?$current_page:'';
//session_start();
//定义一个变量来取我存到箱子里面的信息
//$current_user=$_SESSION['current_login_user'];

//调用函数也可以取当前用户信息
// 调用这个主要是为了拿session里面的东西，当然，我也可以直接拿不调用
$current_user=xiu_get_current_user();
 // $_SESSION['current_login_user'];
// 如果有session里面的东西的话，就把里面的那一行用户信息返还回去


 ?>


<!-- 侧边栏展开和高亮的判断只在加载的时候判断一次，之后就可以自己动了 -->
<div class="aside">
  <div class="profile">
    <img class="avatar" src="<?php echo $current_user['avatar']; ?>">
    <h3 class="name"><?php echo $current_user['nickname']; ?></h3>
  </div>
  <ul class="nav">
    <li<?php echo $current_page == 'dashboard' ? ' class="active"' : ''; ?>>
      <a href="index.php"><i class="fa fa-dashboard"></i>仪表盘</a>
    </li>
    <!-- ====================================================================================================== -->
    <li<?php echo in_array($current_page, array('posts', 'post-add', 'categories')) ? ' class="active"' : ''; ?>>

              <!-- 这个判断负责展开 -->
      <a href="#menu-posts"<?php echo in_array($current_page, array('posts', 'post-add', 'categories')) ? '' : ' class="collapsed"'; ?> data-toggle="collapse">
        <i class="fa fa-thumb-tack"></i>文章<i class="fa fa-angle-right"></i>
      </a>
      <ul id="menu-posts" class="collapse<?php echo in_array($current_page, array('posts', 'post-add', 'categories')) ? ' in' : ''; ?>">
        <li<?php echo $current_page == 'posts' ? ' class="active"' : ''; ?>><a href="posts.php">所有文章</a></li>
        <li<?php echo $current_page == 'post-add' ? ' class="active"' : ''; ?>><a href="post-add.php">写文章</a></li>
        <li<?php echo $current_page == 'categories' ? ' class="active"' : ''; ?>><a href="categories.php">分类目录</a></li>
      </ul>
    </li>
    <!-- ======================================================================================================= -->
    <li<?php echo $current_page == 'comments' ? ' class="active"' : ''; ?>>
      <a href="comments.php"><i class="fa fa-comments"></i>评论</a>
    </li>
    <li<?php echo $current_page == 'users' ? ' class="active"' : ''; ?>>
      <a href="users.php"><i class="fa fa-users"></i>用户</a>
    </li>
    <li<?php echo in_array($current_page, array('nav-menus', 'slides', 'settings')) ? ' class="active"' : ''; ?>>
      <a href="#menu-settings"<?php echo in_array($current_page, array('nav-menus', 'slides', 'settings')) ? '' : ' class="collapsed"'; ?> data-toggle="collapse">
        <i class="fa fa-cogs"></i>设置<i class="fa fa-angle-right"></i>
      </a>
      <ul id="menu-settings" class="collapse<?php echo in_array($current_page, array('nav-menus', 'slides', 'settings')) ? ' in' : ''; ?>">
        <li<?php echo $current_page == 'nav-menus' ? ' class="active"' : ''; ?>><a href="nav-menus.php">导航菜单</a></li>
        <li<?php echo $current_page == 'slides' ? ' class="active"' : ''; ?>><a href="slides.php">图片轮播</a></li>
        <li<?php echo $current_page == 'settings' ? ' class="active"' : ''; ?>><a href="settings.php">网站设置</a></li>
      </ul>
      <li<?php echo $current_page == 'douban' ? ' class="active"' : ''; ?>><a href="douban.php"><i class="fa fa-list-alt"></i>电影榜单</a></li>
    </li>
  </ul>
</div>
