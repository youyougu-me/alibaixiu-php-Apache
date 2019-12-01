<?php 
require_once'../functions.php';
//判断用户是否登录，是否有session
xiu_get_current_user();



//处理分页参数，靠客户端点击页码的时候传参数过来==============================
//没有传参数过来就默认第一页
$size=5;
//计算出越过多少条

$page=empty($_GET['page'])?1:(int)$_GET['page'];
$offset=($page-1)*$size;


//写这个1=1是为了保证后面那个post查询语句肯定有值
$where ='1=1';
$search='';

//分类筛选
if(isset($_GET['category'])&&$_GET['category']!='all'){
  //拼接一个查询
$where=$where .' and posts.category_id='.$_GET['category'];
$search.='&category='.$_GET['category'];
}
//状态筛选
if(isset($_GET['status'])&&$_GET['status']!='all'){
  //拼接一个查询
$where=$where ." and posts.status='{$_GET['status']}'";
$search.='&status='.$_GET['status'];
}

//上面的取数据和这里的查数据应该用同一个sql语句，
//因为保证数量的一致。上面那个是严格查询，会少一些数据。
//照下面这样算出来的页码可能会多，最后一页严格查出来，就查不到数据
//因每一页都严格查询，会跳过很多，$posts会为空

//页数最大值是在这里决定的，但是最后又加了分类条件，最大值会变
$total_count=(int)xiu_fetch_one("select count(1) as count
  from posts inner join categories on posts.category_id=categories.id
inner join users on posts.user_id=users.id where {$where};")['count'];
$total_pages=(int)ceil($total_count/$size);

//两个where条件合并起来查询有可能不存在，page就会绝对大于总页数0，就会跳转，然后跳转也不存在，就第一页
var_dump($total_pages);
//exit($total_pages);

if($page<1){
  //不可能
  header('Location:/admin/posts.php?page=1'.$search);

}
if($page>$total_pages){
  //不可能
  header('Location:/admin/posts.php?page='.$total_pages.$search);

}

//接收筛选参数
//==============================================================

// //写这个1=1是为了保证后面那个post查询语句肯定有值
// $where ='1=1';
// $search='';

// //分类筛选
// if(isset($_GET['category'])&&$_GET['category']!='all'){
//   //拼接一个查询
// $where=$where .' and posts.category_id='.$_GET['category'];
// $search.='&category='.$_GET['category'];
// }
// //状态筛选
// if(isset($_GET['status'])&&$_GET['status']!='all'){
//   //拼接一个查询
// $where=$where ." and posts.status='{$_GET['status']}'";
// $search.='&status='.$_GET['status'];
// }
// //$where=> "1=1 and posts.category_id=1 and posts.status='published'"
// //$search=> "&category=1&status=published"



//查询全部的文章数据============================================================
//这种关联查询可以减少查询
//拿到的一样的是表，是索引数组里面的关联数组
//这一下面的东西决定了后面posts展现在页面上的遍历

//越过多少条查多少条查哪些数据
//还要加一个分类限制条件
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
where {$where}
order by posts.id 
limit {$offset},{$size}
");
//order by posts.created desc
//var_dump($posts); 

//查询全部的分类数据
$categories=xiu_fetch_all('select * from categories;');
//var_dump($categories[0]["slug"]);













//处理分页页码==========================================
//只要是处理分页功能一定会用到最大的页码数
//$total_pages=ceil($total_count/$size)

//可见的

$visiables=5;

//计算最大和最小展示的页码
$begin=$page-($visiables-1)/2;
$end=$begin+$visiables-1;
//重点考虑合理性的问题
//begin>0 end<=total_pages
$begin=$begin<1?1:$begin;//确保了begin不会小于1
$end=$begin+$visiables-1;//因为50行可能导致begin变化，这里同步两者关系
$end=$end>$total_pages?$total_pages:$end;//确保end不会大于总页数
$begin=$end-($visiables-1);//因为52行可能改变了end,也就有可能打破了begin和end的关系，
//防止最后一页不能显示5条数据，得补满
$begin=$begin<1?1:$begin;//确保不能小于1
//做这个最大最小总的来说注意三点：
//1.先根据客户端传过来的page,稳住table里面展示的数据，有page就可以算出越过多少条展示多少条
//2.拿到Page之后，设置i=page的为高亮，i就代表页码
//3.确定页码的显示，最小页，最大页，保证他们的合理性
//4.因为i就代表页码，随page的请求而变化(最大好多，最小好多)，所以只要i=page，就可以按一个a标签高亮






















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
        <form class="form-inline" action="<?php echo $_SERVER['PHP_SELF']; ?>">
          <select name="category" class="form-control input-sm">
            <option value="all">所有分类</option>
            <?php foreach($categories as $item): ?>
              <?php $is_current=isset($_GET['category'])&&
              $_GET['category']===$item['id']; ?>
            <option value="<?php echo $item['id']; ?>"
            <?php echo $is_current?' selected':'' ?>>
            <?php echo $item['name']; ?>
            </option>
            <?php endforeach ?>
          </select>

          <!-- 状态可以直接写死 -->
          <select name="status" class="form-control input-sm">
            <option value="all">所有状态</option>
            <option value="drafted"<?php echo isset($_GET['status'])&&$_GET['status']==='drafted'?' selected':'' ?>>草稿</option>
            <option value="published"<?php echo isset($_GET['status'])&&$_GET['status']==='published'?' selected':'' ?>>已发布</option>
            <option value="trashed"<?php echo isset($_GET['status'])&&$_GET['status']==='trashed'?' selectded':'' ?>>回收站</option>
          </select>
          <button class="btn btn-default btn-sm">筛选</button>
        </form>
        <!-- 下面是页数那一排 -->
        <ul class="pagination pagination-sm pull-right">
          <li><a href="#">上一页</a></li>
         <?php for($i=$begin;$i<=$end;$i++): ?>

          <!-- 选了分类就会提交上分类，没选就没有 用search -->
          <li <?php echo $i===$page?'class="active"':''; ?>><a href="?page=<?php echo 
          $i.$search; ?>"><?php echo $i; ?></a></li>
          <!-- $search=> "&category=1&status=published" -->
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
              <!-- 不管你怎么查每条数据都有独一无二的id，就看筛选来决定显示 -->
              <a href="/admin/post-delete.php?id=<?php echo $item['id']; ?>" class="btn btn-danger btn-xs">删除</a>
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

<!-- 
只要表单（分类）  页码（a链接）  被选上。

表单可以提交，这边提交始终都是第一页 page=1&category=3&status=drafted

点击页码就是通过链接提交，而且也会加上分类和状态的参数
怎么加上的？

一个代表页码，一个代表分类参数
<a href="?page=<?php //echo $i.$search; ?>"><?php //echo $i; ?></a>

既然这是个标签，则在生成页面之后就有这些参数了，为下一次点击做准备

每一次生成页面都是由上一次提交产生，除了第一次

第一次生成：默认第一页
$page=empty($_GET['page'])?1:(int)$_GET['page'];
默认无分类和状态，因为我加了判断语句。
if(isset($_GET['category'])&&$_GET['category']!='all'){



第二次生成：
$where ='1=1'; 存查询条件  
$search='';    存点击页数那里的a链接发送的请求
显然，这两个是同步的，查询时用where，则查询完了在页面上显示的则是search

如果在第一次默认生成状态之后，
你只选择了分类和状态，未选择页数，则是点击筛选提交。页面得到筛选条件where，默认第一页
查出POSTS，然后渲染页面

如果选了分类状态，点击页数提交，
a标签的链接是提前生成，页数都好说，生成页面的时候，根据Page每个a都会有一个
页数链接，
状态和分类：两种情况
第一种：继续这页面的分类和状态，则沿用上一次的search。
最最最初where search都为空，当第二次使用，
第一种情况：直接点第二页，点的是a链接，没有分类和刷选啊
第二种情况：先点击筛选，则会刷新页面，这时，a标签中search里面就带有分类和状态参数了
然后。。。。。。。

总之：靠where   存每次提交后的查询
      靠search   分类和状态是在点击筛选时加的，页数是根据page生成

      点击页数永远不能改变分类状态，因为会遗传生成，带着上一次的状态提交
      只有点击筛选可以改变 -->



