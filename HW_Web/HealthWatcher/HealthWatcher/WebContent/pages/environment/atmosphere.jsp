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
        <li><a href="#"><i class="fa fa-dashboard"></i>外部环境监控</a></li>
        <li class="active">大气环境</li>
      </ol>
    </section>
    
     <!-- Main content -->

      <section class="content"> 
      <!-- Small boxes (Stat box) -->
      
   
     
          <div class="row">
          <div class="col-lg-3" align="right">     
 				 <p >请输入查询城市</p>  </div>  
                  <div class="col-lg-1">     
                <input type="text" class="form-control" style="height: 22px" >
                </div>
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
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            <!-- ./col -->
            
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>1993.3.3<sup style="font-size: 20px">*C</sup></h3>
                  <p>发布时间</p>
                </div>
                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> 
                </div>
          </div> 
       
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>颗粒物(PM10)</h3>
                   <p> 首要污染物</p>
                </div>
               <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            
               <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>23</h3>
                   <p>空气质量指数实时值</p>
                </div>
               <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            
                <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>23</h3>
                  <p>PM2.5指标实时值</p>
                </div>
            <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            <!-- ./col -->
            
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>193.3<sup style="font-size: 20px">*C</sup></h3>
                  <p>PM2.5指标24小时均值

</p>
                </div>
                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> 
                </div>
          </div> 
       
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>12)</h3>
                   <p> PM10指标实时值

</p>
                </div>
               <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            
               <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>12)</h3>
                   <p>PM10指标24小时均值</p>
                </div>
               <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div> <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>22</h3>
                  <p>一氧化碳指标实时值</p>
                </div>
            <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
          
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>1.3<sup style="font-size: 20px">*C</sup></h3>
                  <p>一氧化碳指标24小时均值

</p>
                </div>
                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> 
                </div>
          </div> 
       
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>132</h3>
                   <p> 二氧化硫指标实时值

</p>
                </div>
               <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            
               <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>123</h3>
                   <p>二氧化硫指标24小时均值

</p>
                </div>
               <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div> <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>412</h3>
                  <p>二氧化氮指标实时值</p>
                </div>
            <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            <!-- ./col -->
            
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>13<sup style="font-size: 20px">*C</sup></h3>
                  <p>二氧化氮指标24小时均值</p>
                </div>
                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> 
                </div>
          </div> 
       
            <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>2</h3>
                   <p> 臭氧指标实时值</p>
                </div>
               <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            
               <div class="col-lg-3 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>442</h3>
                   <p>臭氧指标24小时均值

</p>
                </div>
               <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
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
