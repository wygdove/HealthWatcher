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
        <div class="col-lg-6">
         <div class="row">
         
          <div class="row">
          <div class="col-lg-3"  >
 				 <p align="right">请输入查询城市</p>
                 </div>
                 <div class="col-lg-5">
                <input type="text" class="form-control" style="height: 22px" >
                  </div>
                <div class="col-lg-2">
                <button style="height:22px">确定</button>
              </div> 
               </div>
         
          </div>
          <div class="row">
            <div class="col-lg-6 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>开封</h3>
                  <p>当前城市</p>
                </div>
                <div class="icon"> <i class="ion ion-bag"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-6 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>53<sup style="font-size: 20px">*C</sup></h3>
                  <p>实时温度</p>
                </div>
                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
          </div>
          
          <!-- ./col -->
          
          <div class="row">
            <div class="col-lg-6 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>12：00</h3>
                  <p>当前时间</p>
                </div>
                <div class="icon"> <i class="ion ion-person-add"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a> 
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-6 col-xs-6"> 
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>2016.4.1</h3>
                  <p>当前日期</p>
                </div>
                <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
                <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                 </div>
              <!-- ./col --> 
              
              <!-- /.box-body --> 
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">气温预报</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="areaChart" style="height:250px"></canvas>
              </div>
            </div>
            <!-- /.box-body --> 
          </div>
        </div>
        
        <!--    <section class="col-lg-3 connectedSortable"> </section> --> 
        
      </div>
      
      <!-- Main row --> 
      
    </section>
   <!-- ****************************************-->
    <section class="content-header">
      <h1> 五日预报 </h1>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua"> <span class="info-box-text">星期一 </span> 
          <span class="info-box-number"> 20℃ </span> <span class="info-box-number"> 0℃</span> 
          <span class="info-box-number"> 无持续风向 </span> <span class="info-box-number"> 微风级 </span> 
          <span class="info-box-number">霾 </span> <span class="progress-description"> 2015-12-07 </span> 
          </div>
        </div>
        
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua"> <span class="info-box-text">星期一 </span> 
          <span class="info-box-number"> 20℃ </span> <span class="info-box-number"> 0℃</span> 
          <span class="info-box-number"> 无持续风向 </span> <span class="info-box-number"> 微风级 </span> 
          <span class="info-box-number">霾 </span> <span class="progress-description"> 2015-12-07 </span> 
          </div>
        </div>
        
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua"> <span class="info-box-text">星期一 </span> 
          <span class="info-box-number"> 20℃ </span> <span class="info-box-number"> 0℃</span> 
          <span class="info-box-number"> 无持续风向 </span> <span class="info-box-number"> 微风级 </span> 
          <span class="info-box-number">霾 </span> <span class="progress-description"> 2015-12-07 </span> 
          </div>
        </div>
        
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua"> <span class="info-box-text">星期一 </span> 
          <span class="info-box-number"> 20℃ </span> <span class="info-box-number"> 0℃</span> 
          <span class="info-box-number"> 无持续风向 </span> <span class="info-box-number"> 微风级 </span> 
          <span class="info-box-number">霾 </span> <span class="progress-description"> 2015-12-07 </span> 
          </div>
        </div>
        
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua"> <span class="info-box-text">星期一 </span> 
          <span class="info-box-number"> 20℃ </span> <span class="info-box-number"> 0℃</span> 
          <span class="info-box-number"> 无持续风向 </span> <span class="info-box-number"> 微风级 </span> 
          <span class="info-box-number">霾 </span> <span class="progress-description"> 2015-12-07 </span> 
          </div>
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

<!-- InstanceBeginEditable name="script" --> 
<!-- ChartJS 1.0.1 --> 
<script src="../../plugins/chartjs/Chart.min.js"></script> 
<!-- FastClick --> 
<script src="../../plugins/fastclick/fastclick.js"></script> 

<!-- AdminLTE for demo purposes --> 
<script src="../../dist/js/demo.js"></script> 

<!-- page script --> 
<script>
  $(function () {
	  
    //--------------
    //- AREA CHART -
    //--------------
	
    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
    var areaChart = new Chart(areaChartCanvas);

    var areaChartData = {
      labels: ["今天", "明天", "后天", "大后天", "大大后天", "大大大后天", "大大大大后天"],
      datasets: [
        {
          label: "Electronics",
          fillColor: "rgba(210, 214, 222, 1)",
          strokeColor: "rgba(210, 214, 222, 1)",
          pointColor: "rgba(210, 214, 222, 1)",
          pointStrokeColor: "#c1c7d1",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
          label: "Digital Goods",
          fillColor: "rgba(60,141,188,0.9)",
          strokeColor: "rgba(60,141,188,0.8)",
          pointColor: "#3b8bba",
          pointStrokeColor: "rgba(60,141,188,1)",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(60,141,188,1)",
          data: [28, 48, 40, 19, 86, 27, 90]
        }
      ]
    };

    var areaChartOptions = {
      //Boolean - If we should show the scale at all
      showScale: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: false,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - Whether the line is curved between points
      bezierCurve: true,
      //Number - Tension of the bezier curve between points
      bezierCurveTension: 0.3,
      //Boolean - Whether to show a dot for each point
      pointDot: false,
      //Number - Radius of each point dot in pixels
      pointDotRadius: 4,
      //Number - Pixel width of point dot stroke
      pointDotStrokeWidth: 1,
      //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
      pointHitDetectionRadius: 20,
      //Boolean - Whether to show a stroke for datasets
      datasetStroke: true,
      //Number - Pixel width of dataset stroke
      datasetStrokeWidth: 2,
      //Boolean - Whether to fill the dataset with a color
      datasetFill: true,
      //String - A legend template
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true
    };

    //Create the line chart
    areaChart.Line(areaChartData, areaChartOptions);

   
  });</script> 
</body>
</html>
