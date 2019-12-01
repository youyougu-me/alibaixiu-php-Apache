<?php 
require_once'../functions.php';

//判断用户是否登录，是否有session
xiu_get_current_user();

//======================================================================
if(empty($_GET['id'])){  //空get

  //空1 直接跳过去查数据

  //空2 如下，添加数据
  if($_SERVER['REQUEST_METHOD']==='POST'){
    add_category();
  }

}else{                   //不空get

  //不空1 查将编辑数据去渲染
  $current_edit_category=xiu_fetch_one('select * from categories where id='.$_GET['id']);

  //不空2 编辑数据   当然不空2建立在不空1基础上
  if($_SERVER['REQUEST_METHOD']==='POST'){
    edit_category();
  }

}
//====================================================================

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
          //或运算，前面为真就不往后面执行了
          //防止全选和单选选中同一个
          //allCheckds.indexOf(id)===-1 || allCheckds.push(id)
          allCheckds.includes(id) || allCheckds.push(id)


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


    //找一个合适的时机做一件合适的事情
    //全选和全不选
    $('thead input').on('change',function(){
        //1.获取这个全选按钮的状态
        var checked=$(this).prop('checked')
        //2.设置给表体中的每一个
        //由于这里体中的checkbox被选中并不能触发上面的checkbox选中状态改变事件
        //所以我这里得手动触发，直接在后面添加事件
        //$tbodyCheckboxs.prop('checked',checked).change()

        //这个函数专门触发指定事件
        $tbodyCheckboxs.prop('checked',checked).trigger('change')


    })//全选按钮状态改变事件结束





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
