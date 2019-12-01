<?php 
require_once'../functions.php';

//判断用户是否登录，是否有session
xiu_get_current_user();

 ?>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Comments &laquo; Admin</title>
  <link rel="stylesheet" href="/static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="/static/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="/static/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="/static/assets/css/admin.css">
  <script src="/static/assets/vendors/nprogress/nprogress.js"></script>
  <style>
  /*loading动画的样式表*/
  .ball-pulse-sync {
    transform: scale(1);
  }
  
  .ball-pulse-sync > div:nth-child(1) {
    -webkit-animation: ball-pulse-sync 0.6s -0.14s infinite ease-in-out;
    animation: ball-pulse-sync 0.6s -0.14s infinite ease-in-out;
  }
  .ball-pulse-sync > div:nth-child(2) {
    -webkit-animation: ball-pulse-sync 0.6s -0.07s infinite ease-in-out;
    animation: ball-pulse-sync 0.6s -0.07s infinite ease-in-out;
  }
  .ball-pulse-sync > div:nth-child(3) {
    -webkit-animation: ball-pulse-sync 0.6s 0s infinite ease-in-out;
    animation: ball-pulse-sync 0.6s 0s infinite ease-in-out;
  }
  .ball-pulse-sync > div {
    background-color: #fff;
    width: 15px;
    height: 15px;
    border-radius: 100%;
    margin: 2px;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    display: inline-block;
  }
  
  @keyframes ball-pulse-sync {
    33% {
    -webkit-transform: translateY(10px);
    transform: translateY(10px);
    }
    66% {
      -webkit-transform: translateY(-10px);
      transform: translateY(-10px);
    }
    100% {
      -webkit-transform: translateY(0);
      transform: translateY(0);
    }
  }

    /*这个是最外头的那个盒子*/
    /*.ball-pulse-sync{*/
    #loading{
      /*先默认让其不显示*/
     display: flex;       /*使用flex布局*/
      align-items: center;    /*居中*/
      justify-content: center;  /*居中*/
      position: fixed;      /*固定于浏览器*/
      z-index: 1001;        /*设定层级*/
      background: rgba(0,0,0,.7); /*背景色*/
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
    }

  </style>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <?php include 'inc/navbar.php' ;?>
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有评论</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong> 发生XXX错误
      </div> -->
      <div class="page-action">
        <!-- show when multiple checked -->
        <a class="btn btn-danger btn-sm" href="post-delete.php?items=" style="display: none">批量删除</a>
        <ul class="pagination pagination-sm pull-right">
          <!-- <li><a href="#">上一页</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">下一页</a></li> -->
        </ul>
      </div>
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th class="text-center" width="40"><input type="checkbox"></th>
            <th>作者</th>
            <th>评论</th>
            <th>评论在</th>
            <th>提交于</th>
            <th>状态</th>
            <th class="text-center" width="150">操作</th>
          </tr>
        </thead>
        <tbody>
         <!--  <tr class="danger">
            <td class="text-center"><input type="checkbox"></td>
            <td>大大</td>
            <td>楼主好人，顶一个</td>
            <td>《Hello world》</td>
            <td>2016/10/07</td>
            <td>未批准</td>
            <td class="text-center">
              <a href="post-add.php" class="btn btn-info btn-xs">批准</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
          </tr> -->
        </tbody>
      </table>
    </div>
  </div>

  <!--loading动画-->
  <!-- loading这个盒子自己加 -->
<div id="loading" style="display: none">
  <div class="ball-pulse-sync">
    <div></div>
    <div></div>
    <div></div>
  </div>
</div>


  <?php $current_page = 'comments'; ?>
  <?php include 'inc/sidebar.php' ;?>    

  <script src="/static/assets/vendors/jquery/jquery.js"></script>
  <script src="/static/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script src="/static/assets/vendors/jsrender/jsrender.js"></script>
  <script src="/static/assets/vendors/twbs-pagination/jquery.twbsPagination.js"></script>



<!-- =================================================================================================================== -->
 


  <!-- 要用模板引擎得先写一个模板 -->
  <script id="comments_tmpl" type="text/x-jsrender">
    {{for comments}}
    <!-- <tr><td>{{:#index}}</td><td>{{:content}}</td></tr> -->
      <tr {{if status=='held'}}class="warning" {{else status=="rejected" }}class="danger"{{/if}} data-id="{{:id}}">
            <td class="text-center"><input type="checkbox"></td>
            <td>{{:author}}</td>
            <td>{{:content}}</td>
            <td>{{:post_title}}</td>
            <td>{{:created}}</td>
            <td>{{:status}}</td>
            <td class="text-center">  
              {{if status=='held'}}
              <a href="post-add.php" class="btn btn-info btn-xs">批准</a>
              <a href="javascript:;" class="btn btn-warning btn-xs">拒绝</a>
              {{/if}}
              <a href="javascript:;" class="btn btn-danger btn-xs btn-delete">删除</a>

            </td>
        </tr>
    {{/for}}
  </script>

  <script>
  //加载页面的时候我已经放了进度条 
  //现在我给发AJAX请求也加一个进度条 
  $(document).ajaxStart(function(){
    NProgress.start()
    //显示loading
    //faseIn的方式显示是display:block和none,这样特效不能居中
    $('#loading').fadeIn()
    //$('#loading').css('display','flex')

  })
  .ajaxStop(function(){
    NProgress.done()
    $('#loading').fadeOut()
    // $('#loading').css('display','none')
  })

    //发送ajax请求，获取列表所需数据
    //$.getJSON('/admin/api/comments.php',{page:3},function(res){
      //请求得到相应之后自动执行
      //jquery拿到相应之后，会自动把那边传过来的字符串转化为数据
      //转化的前提是，接口那边必须申明自己响应体是什么格式
      //或者直接用getJSON,它忽略服务端
      //console.log(res)

      //准备一个给模板使用的数据
      //var data={}
      //res={{content:哈哈,age:18,name:gg},{},{}}
      //data.comments=res

      //将数据渲染到页面上
      //render后面要传一个对象，这里我写字面量
      //var html=$('#comments_tmpl').render({comments:res})
      //$('tbody').html(html)
    //})


    //在外面定义，用来接受页码事件里面产生的页码，需要全局才
    //方面后面删除的时候返回当前页面
    var currentPage=1

    //页码点击功能======================================================
    //调用这个函数一次，就会发一次请求,并调用模板函数渲染界面
    function loadPageData(page){

         $('tbody').fadeOut()

         //AJAX回来的有展示的评论和总页数
         $.getJSON('/admin/api/comments.php',{page:page},function(data){
          
          //在这里应该先把上一次的destroy一下，不然不会重新，初始化，
          //总页数就不会变

          //AJAX回来的时候，总页数已经拿到了，可以重新渲染
          //有个缺点就是重新初始化后默认焦点在第一页上面
          //但是呢，因为你点击的4所以数据还是取的第4页
          //毁掉上一个页面

          //若删除的最后一页6页的最后条数据，按理说应该泵到第5页
          //但是这边删除后传过去的依然是第6页，那我这边就要去拿
          //第6页的数据，而startpage还是第6页，应该判断
          if(page>data.total_Pages){

            loadPageData(data.total_Pages)


            //如果这样，就不要往下执行了，不然又会报错
            return false
          }

          //在新的页码生成值之前，应该将以前的页码干掉，因为有可能AJAX
          //回来的总页数会变，那么页码就需要更新
          $('.pagination').twbsPagination('destroy')


          //调用分页事件
           $('.pagination').twbsPagination({
            first:'<<',
            last:'>>',
            prev:'<',
            next:'>',
            //显示在哪一页上
            startPage:page,
           totalPages:data.total_Pages,
           visiablePages:5,

        //阻止第一次初始化触发
        initiateStartPageClick:false,

           //第一次初始化就会触发一次，打印一个page=1
           //默认初始第一页
           onPageClick:function(e,page){
          loadPageData(page)
        }
      }) //分页事件完

      //console.log(data)
      //data=>{total_pages:7,comments:[]}传回个对象
      //开始渲染页面
      // 模板引擎的数据源也得是个对象，我这里传字面量
      var html=$('#comments_tmpl').render({comments:data.comments})
      $('tbody').html(html).fadeIn()
      //页面加载好的时候把页码拿到
      currentPage=page

    })//大函数内大AJAX请求完

    }//大函数完

    //这相当于是一个函数入口
    //loadPageData(1)

    //这是独立的分页函数
    //我先初始化一个页码组件，并把总页数设置为一个很大的值

    //我没这么写之前，当我把第6页的数据删除完
    //还是停留在第6页，没有跳转回第5页
    //而且，当我点击第5页时，第6页空的却依然还在
    //AJAX这时返回的total页数却是5页
    //这是因为分页组件在第一次初始化之后不会再重新初始化
    //所以它的总页数不会变，只负责切换页码
    //那我就，在即将下一次页码生成前把上一次的毁坏了
     $('.pagination').twbsPagination({
            first:'<<',
            last:'>>',
            prev:'<',
            next:'>',
           totalPages:100,
           visiablePages:5,
        //initiateStartPageClick:false,
           onPageClick:function(e,page){
          //上面那个函数的入口,第一次会自动page=1
          loadPageData(page)
        }
      }) 



    //删除功能==========================================================
    //console.log($('.btn-delete'))
    //$('.btn-delete').on('click',function(){
     //请注意按钮点击删除事件的注册时机，这时候注册是行不通的
     //因为页面（包括删除按钮）是通过AJAX异步渲染，有可能页面都还没
     //没渲染好，就来注册事件了就注册不了
     //console.log("aa")
     //})


    //这里采用事件委托，给这些按钮的父元素注册点击事件，在点击事件触发的时候判断
    //一下这个事件的触发源是不是删除按钮

    //这里委托的核心就是事件冒泡，我们采用的是jquery提供的方法，其实
    //原生JS也可以做，借助冒泡，判断target是不是我们这个删除按钮
    //委托就注册了一个事件，还可以节省资源
    //tbody是之前页面上就存在的，所以不用担心AJAX
    $('tbody').on('click','.btn-delete',function(){
      //删除单条数据的时机（在tr生成的时候给它加一个自定义属性）
      //1.拿到需要删除的数据ID
      //记住，添加自定义属性用data-id,固定格式


      var $tr=$(this).parent().parent()
      var id=$tr.data('id')
      //2.发送一个AJAX请求 告诉服务端要删除哪一条具体的数据
      //如果不刷新的话，页面是不会变的，虽然说数据已经删除掉了
      $.get('/admin/api/comment-delete.php',{id:id},function(res){
        //console.log(typeof res)
        //如果服务端那边不设置返回的Content-Type，则jQuery就会把
        //接受到的res当做一个字符串处理,就不会帮我们反序列化
        //res=>布尔，返回的是布尔

      //3.根据服务端返回的删除是否成功决定是否在界面上移除这个元素
        if(!res) return 
        //否则就是删除成功,界面上移除tr
        //这里用this 指向是有问题的，不是指被点击的删除按钮了
        //指的是代理对象  
        //$(this).parent().parent().remove()

         //$tr.remove()    

        //其实这里的$tr是在一个闭包里面，当你点击删除按钮，按理说，
        //click事件那个函数应该立即执行完，然后$tr应该被立即销毁，
        //但是呢，因为大click事件里面的AJAX请求事件用到了那个变量
        //所以不会立马释放。我们要确定的是：因为AJAX异步，所以大函
        //函数很早就执行完了，而小函数还可以访问到变量就是因为闭包

        //我们一般做法是不会让10条变9条，而是重新载入当前这一页的数据，补满10行
      //4.从新再载入这一页的数据，这一页被删除的让后面补上来
        //当你在上面点击一下的时候就知道page是多少页了
        loadPageData(currentPage)

      })//AJAX请求完，与删除相关的事件都必须在这里面做，因为异步
    })//按钮删除事件完

 
  </script>
  <script>NProgress.done()</script>
</body>
</html>

<!-- 为什么AJAX删除掉之后页面上10条可以变9条呢？
我的理解是，客户端的东西可以立马刷新，而服务端却不能够？

如果我发送AJAX请求后，收到接口删除成功的信息，而不做后续的页面tr移除，而我看不到
被删除的效果，需要刷新才可以看到。因为我只是把服务端数据库的数据删除了，而客户端没有改变。

AJAX删除掉数据后，当场10条变9条，但是当再次刷新，依然10条，因为刷新重新发请求就又去按服务端接口逻辑取数据了
 -->