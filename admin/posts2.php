<?php 
require_once'../functions.php';
//判断用户是否登录，是否有session
xiu_get_current_user();



//处理分页参数，靠客户端点击页码的时候传参数过来==============================
//没有传参数过来就默认第一页
$page=empty($_GET['page'])?1:(int)$_GET['page'];
$size=20;
//计算出越过多少条
$offset=($page-1)*$size;


//查询全部的文章数据============================================================
//这种关联查询可以减少查询
//拿到的一样的是表，是索引数组里面的关联数组
$posts=xiu_fetch_all("select
posts.id,
posts.title,
users.nickname as user_name,
categories.name as category_name,
posts.created,
posts.status
from posts
inner join categories on posts.category_id=categories.id
inner join users on posts.user_id=users.id
order by posts.created desc
limit {$offset},{$size}
");
//var_dump($posts); 

//处理分页页码==========================================

//最大的页数$total_pages=ceil($total_count/$size)
//因为查出来只可能是一条数据，所以应该用fetch_one来查
$total_count=(int)xiu_fetch_one('select
count(1) as num
from posts
inner join categories on posts.category_id=categories.id
inner join users on posts.user_id=users.id')['num'];
$total_pages=(int)ceil($total_count/$size);
//echo $total_pages;


//计算页码开始
//核心就是求出开始和结束，剩下的就是保证这两个数合理
$visiables=5;
$region=($visiables-1)/2;
$begin=$page-$region;
$end=$begin+$visiables;
//可能出现$begin和$end的不合理情况
//$begin必须>0
//确保begin最小为1
if($begin<1){
  $begin=1;
  //begin 修改意味着必须改end
  $end=$begin + $visiables; //end代表结束页码加1，遍历的时候是小于end
}
//$end必须<=最大页数
if($end>$total_pages+1){
  //end超出范围
  $end=$total_pages+1;
  //end修改，意味着得改begin
  $begin=$end-$visiables;
  if($begin<1){
  $begin=1;
  //begin 修改意味着必须改end
  $end=$begin + $visiables; //end代表结束页码加1，遍历的时候是小于end
}

}




















//处理数据格式转换逻辑（状态）

/**
 * 转换状态显示
 */
function convert_status($status){
  $dict=array(
    'published'=>'已发布',
    'drafted'=>'草稿',
    'trashed'=>'回收站'
    );
  return isset($dict[$status])?$dict[$status]:'未知';
}


//转化时间格式
function convert_date($created){
  //=>'2017-07-01 08:08:00'
  //好像是先转化为时间戳
  $timestamp=strtotime($created);
  //这个函数除了格式以外其他的都会原封不动的输出
  //想用真实的r必须转义一下，因为r很特殊
  return date('Y年m月d日<b\r>H:i:s',$timestamp);

}

// function get_category($category_id){
//   //这个函数得到的是一个关联数组
//   return xiu_fetch_one("select name from categories where id={$category_id}")['name'];

// }

// function get_user($user_id){
//   //这个函数得到的是一个关联数组
//   return xiu_fetch_one("select nickname from users where id={$user_id}")['nickname'];

// }




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

    <!-- 从下面开始包裹正文   -->
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有文章</h1>
        <a href="post-add.php" class="btn btn-primary btn-xs">写文章</a>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong> 发生XXX错误
      </div> -->
      <div class="page-action">
        <!-- show when multiple checked -->
        <a class="btn btn-danger btn-sm" href="post-delete.php?items=" style="display: none">批量删除</a>

        <!-- 筛选那一排那三个 -->
        <form class="form-inline">
          <select name="" class="form-control input-sm">
            <option value="">所有分类</option>
            <option value="">未分类</option>
          </select>
          <select name="" class="form-control input-sm">
            <option value="">所有状态</option>
            <option value="">草稿</option>
            <option value="">已发布</option>
          </select>
          <button class="btn btn-default btn-sm">筛选</button>
        </form>
        <!-- 下面是页数那一排 -->
        <ul class="pagination pagination-sm pull-right">
          <li><a href="#">上一页</a></li>
          <?php for($i=$begin;$i<$end;$i++): ?>
          <!-- <?php //var_dump($i); ?> -->
          <li <?php echo $i===$page?'class="active"':''; ?>><a href="?page=<?php echo $i ?>"><?php echo $i ?></a></li>
          <?php endfor ?>
          <li><a href="#">下一页</a></li>
        </ul>
    <!-- 所有文章下面那一排完 -->
      </div>

      <!-- 下面就代表表格了哦 -->
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th class="text-center" width="40"><input type="checkbox"></th>
            <th>标题</th>
            <th>作者</th>
            <th>分类</th>
            <th class="text-center">发表时间</th>
            <th class="text-center">状态</th>
            <th class="text-center" width="100">操作</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach($posts as $item): ?>
          <tr>
            <td class="text-center"><input type="checkbox"></td>
            <td><?php echo $item['title']; ?></td>
            <td><?php echo $item['user_name']; ?></td>
            <td><?php echo $item['category_name']; ?></td>
            <td><?php echo convert_date($item['created']); ?></td>
            <!-- 一旦输出的判断或者转换逻辑过于复杂，不建议直接写在混编位置 -->
            <td><?php echo convert_status($item['status']); ?></td>
            <td class="text-center">
              <a href="post-add.php" class="btn btn-default btn-xs">编辑</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
          </tr>
         <?php endforeach ?>
        </tbody>
      </table>
    </div>
  </div>

  <?php $current_page = 'posts'; ?>
  <?php include 'inc/sidebar.php' ;?>

  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script src="/static/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>NProgress.done()</script>
</body>
</html>
