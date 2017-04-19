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
						<div class="col-xs-12 text-left">
							<span><big><big>温湿度</big></big></span>
						</div>
					</div>
					<div class="row">
						<div class="echarts" id="chart_wenshidu"></div>
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
	dowsdchart();
});

function dowsdchart() {
	$.ajax({
		cache: true,
		async: false,
		type: 'get',
		url: './indoor2/chart/wenshidu',
		success:function(redata) {
			var dx=[];
			var dw=[];
			var ds=[];
			$(redata).each(function(i) {
				dx.push(this.dtime);
				dw.push(this.wendu);
				ds.push(this.shidu);
			});
			setwsdchartdata(dx,dw,ds);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setwsdchartdata(dataxaxis,dataserieswen,dataseriesshi) {
	var wenshiduchart=echarts.init(document.getElementById("chart_wenshidu"));
	var wenshiduoption={
		tooltip:{trigger: 'axis'},
		legend:{data:['湿度','温度']},
		xAxis:[{type:'category',data:dataxaxis}],
		yAxis:[{
			name:'湿度',type:'value',
			min:0,max:120,interval:20,
			axisLabel:{formatter: '{value} ml'}
		},{
			name:'温度',type:'value',
			min:0,max:30,interval:5,
			axisLabel:{formatter: '{value} °C'}
		}],
		series: [
			{name:'温度',type:'line',yAxisIndex: 1,data:dataserieswen},
			{name:'湿度',type:'bar',data:dataseriesshi}
		]
	};
	wenshiduchart.setOption(wenshiduoption);
}

    </script>
</body>
</html>
