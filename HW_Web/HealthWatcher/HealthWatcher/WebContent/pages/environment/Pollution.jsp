<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../../dist/css/skins/skin-blue.min.css">
   <title>健康卫士 </title>
  </head>
  
 
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
  <jsp:include page="../index/header.html" flush="true" />
  <jsp:include page="../index/sidebar.html" flush="true" />

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> 健康卫士
        <small>监控面板</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 健康卫士</a></li>
        <li class="active">主页</li>
      </ol>
    </section>
    
     <!-- Main content -->

      <section class="content"> 
      <!-- Small boxes (Stat box) -->
      
      <div class="row">
        <div class="col-md-2 " align="right">
          <p >请输入查询城市</p>
        </div>
        <div class="col-md-1">
          <input type="text" class="form-control" style="height: 22px" >
        </div>
          <div class="col-md-2" align="right">
          <p >请输入查询年份</p>
        </div>
        <div class="col-md-1">
          <input type="text" class="form-control" style="height: 22px" >
        </div>
        <form class="col-md-5" name="frm">
          <select name="s1" onChange="redirec(document.frm.s1.options.selectedIndex)">
            <option selected>请选择污染物种类</option>
            <option value="1">废污水排放量</option>
            <option value="2">工业废水中污染物排放量</option>
            <option value="3">生活污水中污染物排放量</option>
            <option value="4">水污染物排放总量</option>
            <option value="5">废气中污染物排放总量</option>
            <option value="13">工业废气及污染物排放量</option>
            <option value="6">生活及其他污染物排放量</option>
            <option value="7">城市生活垃圾</option>
            <option value="8">固体废物</option>
            <option value="9">危险废物</option>
            <option value="10">医疗废物</option>
            <option value="11">能耗</option>
            <option value="12">温室气体</option>
          </select>
          <select name="s2">
            <option value="请选择" selected>请选择</option>
          </select>
        </form>
        <button style="height:22px">确定</button>
      </div>
      <div class="col-lg-3 col-xs-6"> 
        <!-- small box -->
        <div class="small-box bg-aqua">
          <div class="inner">
            <h3>开封</h3>
            <p>当前城市</p>
          </div>
          <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
          <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> </div>
      </div>
      <!-- ./col -->
      
      <div class="col-lg-3 col-xs-6"> 
        <!-- small box -->
        <div class="small-box bg-green">
          <div class="inner">
            <h3>数据源</h3>
            <p>公众环境研究中心</p>
          </div>
          <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
          <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> </div>
      </div>
      <div class="col-lg-3 col-xs-6"> 
        <!-- small box -->
        <div class="small-box bg-yellow">
          <div class="inner">
            <h3>二氧化硫</h3>
            <p>废气中污染物排放总量</p>
          </div>
          <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
          <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6"> 
        <!-- small box -->
        <div class="small-box bg-red">
          <div class="inner">
            <h3>107.4</h3>
            <p>万吨</p>
          </div>
          <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
          <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> </div>
      </div>
     

   
    </section>

    </div>
  <!-- /.content-wrapper -->
 <jsp:include page="../index/footer.html" flush="true" />
</div>


<!-- jQuery 2.2.0 -->
<script src="../../plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
</body>
</html>
