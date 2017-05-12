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
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style>
.echarts{height:400px;}
</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
                <div class="widget white-bg">
					<div class="row">
						<div class="col-xs-12 text-left">
							<span><big><big>心电图</big></big></span>
						</div>
					</div>
					<div class="row">
						<div class="p-m">
							<%--
							已设定报警值：<label id="label_bo_alert"></label>
							--%>
						</div>
					</div>
					<div class="row">
						<div class="echarts" id="chart_ecg"></div>
					</div>
				</div>
			</div>
		</div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/iCheck/icheck.min.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/echarts/echarts.min.js"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
    <script>
$(document).ready(function(){
	doecgchart();
});

function doecgchart() {
	$.ajax({
		cache: true,
		async: false,
		type: 'post',
		url: './physical/chart/common',
		data: {
			sensertype:'electrocardiogram'
		},
		success:function(redata) {
			var dx=[];
			var ds=[];
			$(redata).each(function(i) {
				dx.push(this.phytime);
				ds.push(this.phyvalue);
			});
			setecgchartdata(dx,ds);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setecgchartdata(dataxaxis,dataseries) {
	var ecgchart=echarts.init(document.getElementById("chart_ecg"));
	ecgoption={
		backgroundColor:'#0f375f',
	    tooltip:{trigger:'axis'},
	    grid:{left:'6%',right:'10%'},
		xAxis:{
		    name:'hh:mm:ss.mmm',
			axisLine:{lineStyle:{color:'#ccc'}},
			data:dataxaxis
		},
		yAxis:{
		    name:'mV',
			splitLine:{show:false},
			axisLine:{lineStyle:{color:'#ccc'}}
		},
		series: [{
			type:'line',
			symbol:'none',
			lineStyle:{normal:{color:'#ccc'}},
			data:dataseries
		}]
	};
	ecgchart.setOption(ecgoption);
}

		
    </script>
</body>
</html>