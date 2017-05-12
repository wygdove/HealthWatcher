<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="refresh" content="3600">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style>
.echarts {
	height: 450px;
}
</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
                <div class="widget white-bg">
					<div class="row">
                        <div class="col-xs-4 text-left">
                            <span><big><big>PM 2.5</big></big></span>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span><small><small></small></small></span>
                        </div>
                    </div>
					<div class="row">
						<div class="echarts" id="chart_pm25"></div>
					</div>
				</div>
			</div>
		</div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/echarts/echarts.min.js"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
    <script>
$(document).ready(function() {
	dopm25chart();
});

function dopm25chart() {
	$.ajax({
		cache: true,
		async: false,
		type: 'get',
		url: './indoor/chart/pmio',
		success:function(redata) {
			var dx=[];
			var di=[];
			var dot=[];
			$(redata).each(function(i) {
				dx.push(this.dtime);
				di.push(this.pmin);
				dot.push(this.pmout);
			});
			setpm25chartdata(dx,di,dot);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setpm25chartdata(dataxaxis,dataseriesin,dataseriesout) {
	var pm25chart=echarts.init(document.getElementById("chart_pm25"));
	pm25option={
		    tooltip:{trigger:'axis'},
		    legend:{data:['室内','室外']},
		    xAxis:{data:dataxaxis},
		    yAxis: {
		        splitLine:{show:false}
		    },
// 		    visualMap: {
// 		        top:10,right:10,
// 		        pieces:[
// 		            {gt:0,lte:50,color:'#096'},
// 		            {gt:50,lte:100,color:'#ffde33'},
// 		            {gt:100,lte:150,color:'#ff9933'},
// 		            {gt:150,lte:200,color:'#cc0033'},
// 		            {gt:200,lte:300,color:'#660099'},
// 		            {gt:300,color:'#7e0023'}
// 		        ],
// 		        outOfRange:{color:'#999'}
// 		    },
		    series: [{
		        name:'室内',
		        type:'line',
		        smooth:true,
		        data:dataseriesin,
		        markLine:{
		            silent:true,
		            data:[{yAxis:50},{yAxis:100},{yAxis:150},{yAxis:200},{yAxis:250},{yAxis:300}]
		        }
		    },{
		        name:'室外',
		        type:'line',
		        smooth:true,
		        data:dataseriesout,
		        markLine:{
		            silent:true,
		            data:[{yAxis:50},{yAxis:100},{yAxis:150},{yAxis:200},{yAxis:250},{yAxis:300}]
		        }}
		    ]
	};
	pm25chart.setOption(pm25option);
}
    </script>
</body>
</html>
