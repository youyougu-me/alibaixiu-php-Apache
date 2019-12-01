<?php 
require_once'../functions.php';

//判断用户是否登录，是否有session
xiu_get_current_user();


//判断是否需要返回被编辑的数据
if(!empty($_GET['id'])){
  //客户通过URL传递了一个ID
  //=>客户是要来拿一个修改数据的表单
  //=>需要拿到用户想要修改的数据

  //这个返回的是一行数据
  $current_edit_category=xiu_fetch_one('select * from categories where id='.$_GET['id']);
}
//把这个写在前面会导致，修改请求提交后会次刷新页面，这时这里拿到的是修改前的数据。虽然在这之后将数据库的数据修改了，
// 但是我后面的页面呈现还是呈现的原来的数据。所以永远拿到的是上一条数据

//所以我在下面做了这个数据的更新222222222222



function add_category(){
  //相同的别名会导致添加失败
  if(empty($_POST['name']) || empty($_POST['slug'])){
    $GLOBALS['success']=false;
    $GLOBALS['message']='请完整填写表单！';
    return;
  }
//接收并保存
  $name=$_POST['name'];
  $slug=$_POST['slug'];

  // INSERT into categories values(null,'slug','name');
  $rows=xiu_execute("INSERT into categories values(null,'{$slug}','{$name}');");

$GLOBALS['success']=$rows>0;
$GLOBALS['message']=$rows<=0?'添加失败':'添加成功';
 
}  //add函数完

function edit_category(){

  //不是JS，函数里面想用全局变量必须得global申明一下
  //这样我还可以用原有的值
  global $current_edit_category;

  //只有在编辑时并点击保存才会执行
  //相同的别名会导致添加失败
  // if(empty($_POST['name']) || empty($_POST['slug'])){
  //   $GLOBALS['success']=false;
  //   $GLOBALS['message']='请完整填写表单！';
  //   return;
  // }

  //我这里可以不加上面的判断，因为如果我没填写的话
  //我就用它原有的数据，提交了我就用提交的值
//接收并保存,根据编辑时传过来的id得到的
  $id=$current_edit_category['id'];
  $name=empty($_POST['name'])? $current_edit_category['name']:$_POST['name'];
  //2222222222这样做是为了同步更新
  $current_edit_category['name']=$name;

  $slug=empty($_POST['slug'])? $current_edit_category['slug']:$_POST['slug'];
  $current_edit_category['slug']=$slug;


  // INSERT into categories values(null,'slug','name');
  $rows=xiu_execute("update categories set slug='{$slug}',name='{$name}' where id={$id}");

$GLOBALS['success']=$rows>0;
$GLOBALS['message']=$rows<=0?'更新失败':'更新成功';


}  //edit函数完



//如果修改操作与查询操作在一起，一定是先做修改（数据库），再查询
//当我修改之后，点击POST请求，重新以此页面提交，先执行修改代码再查询
//这样我当场就可以看到修改后的结果
//因为提交到的是本页面，所以接受到提交后，我就立马处理
if ($_SERVER['REQUEST_METHOD']==='POST'){
  //一旦表单提交请求并且没有通过URL提交ID，就意味着要添加数据。
  if(empty($_GET['id']))
  add_category();
  else {
    edit_category();
  }
}

//肯定是修改或则新增之后再查询生成数据撒，这样才能得到最新的。 删除依然如此，删除完了会跳回这个界面
//因为新增和修改之后，会提交，提交就会重新执行这个界面。
// 重要是区分三者的不同，修改的话不仅是POST，而且刚进来时会以get方式带来需要修改的ID。但是新增就不一样
//查询全部的分类数据
$categories=xiu_fetch_all('select * from categories;');
//var_dump($categories[0]["slug"]);


//修改逻辑
//编辑之后保存，需要把此时编辑的数据ID提交到服务端，因为这样服务端才知道编辑的哪一条，而新增不需要
//而新增时，直接添加进去，不用管ID，数据库那边自动加上ID







 ?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Categories &laquo; Admin</title>
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
        <h1>分类目录</h1>
      </div>
      <!-- 有错误信息时展示 -->
    <?php if(isset($message)): ?>
        <?php if($success): ?>
           <div class="alert alert-success">
          <strong>成功！</strong><?php echo $message; ?>
           </div>

        <?php else: ?>
           <div class="alert alert-danger">
           <strong>错误！</strong><?php echo $message; ?>
           </div>


        <?php endif ?>
       
    <?php endif ?>

      <!-- 分类目录下面的两块大的   总起-->
      <div class="row">   
      <!-- ===================================================== -->
        <div class="col-md-4">
        <!-- 因为添加新数据和修改数据的表单张一样，只是呢修改数据的表单
        里面会有数据，所以我用if else分两种情况来呈现from -->
        <!-- 存在这个说明是要编辑 -->
        <?php if (isset($current_edit_category)): ?> <!-- if if -->
          <!-- 编辑完了需要提交ID，这样服务端才知道提交的哪一条 -->
          <!-- 这个数组指的是当前编辑ID对应的那个数组，ID由客户端传过来 -->
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>?id=<?php echo $current_edit_category['id'] ?>" 
            method="post">
            <h2>编辑《<?php echo $current_edit_category['name'];  ?>》</h2>
            <div class="form-group">
              <label for="name">名称</label> <!-- 因为是编辑所以得给默认值了 -->
              <input id="name" class="form-control" name="name" type="text" placeholder="分类名称" value="<?php echo $current_edit_category['name'];  ?>">
            </div>
            <div class="form-group">
              <label for="slug">别名</label>
              <input id="slug" class="form-control" name="slug" type="text" placeholder="slug" value="<?php echo $current_edit_category['slug'];?>">
              <!-- <p class="help-block">https://zce.me/category/<strong>slug</strong></p> -->
            </div>
            <div class="form-group">
              <button class="btn btn-primary" type="submit">保存</button>
            </div>
          </form>

        <?php else:?>   <!-- 新增 -->


            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" 
            method="post">
            <h2>添加新分类目录</h2>
            <div class="form-group">
              <label for="name">名称</label>
              <input id="name" class="form-control" name="name" type="text" placeholder="分类名称">
            </div>
            <div class="form-group">
              <label for="slug">别名</label>
              <input id="slug" class="form-control" name="slug" type="text" placeholder="slug">
              <!-- <p class="help-block">https://zce.me/category/<strong>slug</strong></p> -->
            </div>
            <div class="form-group">
              <button class="btn btn-primary" type="submit">添加</button>
            </div>
          </form>


        <?php   endif ?><!--  -->

        </div>
        <!-- ========================================================= -->
        <div class="col-md-8">
          <div class="page-action">
            <!-- show when multiple checked -->
            <a id="btn_delete"     class="btn btn-danger btn-sm" href="/admin/categories-delete.php" style="display: none">批量删除</a>
          </div>
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width="40"><input type="checkbox"></th>
                <th>名称</th>
                <th>Slug</th>
                <th class="text-center" width="100">操作</th>
              </tr>
            </thead>
            <tbody>

              <?php foreach($categories as $item): ?>
                 <tr>
                 <!-- 我要给它添加一个自定义ID，按标准以data-开头 -->
                <td class="text-center"><input type="checkbox" data-id="<?php echo $item['id'] ?> "></td>
                <td><?php echo $item['name'] ?></td>
                <td><?php echo $item['slug'] ?></td>
                <td class="text-center">
                  <a href="/admin/categories.php?id=<?php echo $item['id']; ?>" class="btn btn-info btn-xs">编辑</a>

                  <!-- 删除的话可以用一个链接就发送请求了，不用POST -->
                  <!-- 这个a后面的id也代表了它是第几条数据，在创建这个页面时动态生成 -->
                  <a href="/admin/categories-delete.php?id=<?php echo $item['id']; ?>" class="btn btn-danger btn-xs">删除</a>

                  <!-- 删除是把参数带到其他页面，而编辑是把参数带到本页面，正常请求本页面没有参数，所以编辑可以做了吧 -->
            <!--                   左表单，右table
                  纵观此页面：有查询逻辑，不带参数，把数据库数据呈现在页面右边
                            ：有添加逻辑，POST请求，有有一个执行方程。添加与查询的关系是，先添加再查询
                            :还有编辑逻辑，get请求，带参数。返回的是带有数据的左表单

                            增删改全都要刷新页面，所以查放在最后 -->
                </td>
              </tr>
              <?php endforeach ?>
    
            </tbody>
          </table>
        </div>
        <!-- ========================================================== -->
      </div>
      <!-- 上面↑代表分类目录下面的两块大的   总终-->
    </div>
  </div>

  <?php $current_page = 'categories'; ?>
  <?php include 'inc/sidebar.php' ;?>

  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script src="/static/assets/vendors/bootstrap/js/bootstrap.js"></script>

  <!-- 多选的特效 -->
  <!-- 分类这个表只有这里有JS代码 -->
  <script>
  //1.不要重复使用无意义的选择操作，应该采用变量去本地化
  $(function($){
    //选一个合适的时机做一件合适的事情
    //在表格中的任意一个 checkbox选中状态变化时
    var $tbodyCheckboxs=$('tbody input')
    var $btnDelete =$('#btn_delete')

    
    //## version 2  版本2==============================================
    var allCheckds=[]
    $tbodyCheckboxs.on('change',function(){
        //下面这个是我加的自定义属性
        //console.log($(this).attr('data-id'))

        //DOM的方式访问自定义属性，这个属性没写标签上，dir出来的
        //this.dataset['id']

        //jquery的另外一种方式，data可以获取自定义属性
        //console.log($(this).data('id'))

        //当前被点的这个元素的自定义ID
        var id=$(this).data('id')
        //如果被点击这个检测到是选中的则加进去，负责就是没选中，移除
        //当然这个状态指被点击改变之后的状态
        if($(this).prop('checked')){
          allCheckds.push(id)
        }else{
          allCheckds.splice(allCheckds.indexOf(id),1)
        }
        //console.log(allCheckds)
        allCheckds.length?$btnDelete.fadeIn():$btnDelete.fadeOut()

        //设置批量删除的a链接地址，方便更新批量删除操作，所以就写到了
        //写到了复选框选中状态改变的事件里面
        //参数后面跟被选中的id，也就是存在数组里面的东西

        // 这个属性是用来设置问号后面的东西,直接跟数组拼接可以得到数组里面的元素
        $btnDelete.prop('search','?id='+allCheckds)








    })//按钮选中状态改变事件结束





    //## version 1  版本1==============================================
    // $tbodyCheckboxs.on('change',function(){
    //   //有任意一个checkbox选中就显示，反之隐藏
    //   var flag=false
    //   $tbodyCheckboxs.each(function(i,item){
    //     //attr 和 prop的区别
    //     //attr访问的是元素属性
    //     //prop访问的是元素对应DOM对象的属性
    //     //console.log($(item).prop('checked'))
    //     if($(item).prop('checked')){
    //       flag=true
    //     }

    //   }) //遍历每一个按钮事件结束

    //   //有任意checked被选中，批量删除都应该显示出来
    //   //但是这样选择批量删除按钮不是很好，因为选择状态事件触发一次
    //   //这个就会选择一次，最好是在事件外头就把这个按钮的选择赋值给一个变量
    //   //这样就只会选择一次了
    //   flag?$('#btn_delete').fadeIn():$('#btn_delete').fadeOut()
      

    // })//按钮选中状态改变事件


  })//页面加载事件结束

    




  </script>
  <script>NProgress.done()</script>
</body>
</html>
