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
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-8">
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
			<div class="col-sm-4">
                <div class="widget white-bg">
                    <div class="row">
                        <div class="col-xs-12 text-left">
                            <span><big><big>光照</big></big></span>
                        </div>
                    </div>
					<div class="row">
						<div class="echarts" id="chart_guangzhao"></div>
					</div>
				</div>
			</div>
		</div>
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
    <script src="resources/js/plugins/iCheck/icheck.min.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/echarts/echarts.min.js"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
    <script>
		// pm25
		var pm25chart=echarts.init(document.getElementById("chart_pm25"));
		pm25option={
			tooltip:{trigger: 'axis'},
			legend:{data:['室内','室外']},
			xAxis:{type: 'category',boundaryGap: false,data:[]},
			yAxis:{type:'value'},
			series:[
				{name:'室内',type:'line',data:[]},
				{name:'室外',type:'line',data:[]}
			]
		};
		// guangzhao
		var guangzhaochart=echarts.init(document.getElementById("chart_guangzhao"));
		guangzhaooption={
			tooltip:{formatter:"{b} : {c}"},
			series:[{
				type:'gauge',radius:'90%',
				data:[{value:0}]
			}]
		};
		// wenshidu
		var wenshiduchart=echarts.init(document.getElementById("chart_wenshidu"));
		var wenshiduoption={
			tooltip:{trigger: 'axis'},
			legend:{data:['湿度','温度']},
			xAxis:[{type:'category',data:[]}],
			yAxis:[{
				name:'湿度',type:'value',
				min:0,max:250,interval:50,
				axisLabel:{formatter: '{value} ml'}
			},{
				name:'温度',type:'value',
				min:0,max:25,interval:5,
				axisLabel:{formatter: '{value} °C'}
			}],
			series: [
				{name:'温度',type:'line',yAxisIndex: 1,data:[]},
				{name:'湿度',type:'bar',data:[]}
			]
		};
		
		$(document).ready(function(){
			// pm25
			pm25option.xAxis.data=["00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"];
			pm25option.series[0].data=[120,132,101,134,90,230,120,132,101,134,90,230,120,132,101,134,90,230,120,132,101,134,90,230];
			pm25option.series[1].data=[220,182,191,234,290,330,220,182,191,234,290,330,220,182,191,234,290,330,220,182,191,234,290,330];
			pm25chart.setOption(pm25option);
			// guangzhao
			guangzhaooption.series[0].data[0].value=(Math.random()*100).toFixed(2)-0;
			guangzhaochart.setOption(guangzhaooption,true);
			// wenshidu
			for(var i=0;i<20;i++) {
				wenshiduoption.xAxis[0].data.push(getNowTime());
				wenshiduoption.series[0].data.push(Math.random()*20);
				wenshiduoption.series[1].data.push(Math.random()*200);
			}
			wenshiduchart.setOption(wenshiduoption);
		});
		setInterval(function (){
			// pm25
			var pm25tdata=pm25option.xAxis.data;
			var inddata=pm25option.series[0].data;
			var outddata=pm25option.series[1].data;
			pm25tdata.shift();
			pm25tdata.push(getNowTime());
			inddata.shift();
			inddata.push(Math.random()*100);
			outddata.shift();
			outddata.push(Math.random()*300);
			pm25chart.setOption(pm25option);
			// guangzhao
			guangzhaooption.series[0].data[0].value=(Math.random()*100).toFixed(2)-0;
			guangzhaochart.setOption(guangzhaooption,true);
			// wenshidu
			var wsdtdata=wenshiduoption.xAxis[0].data;
			var wendudata=wenshiduoption.series[0].data;
			var shidudata=wenshiduoption.series[1].data;
			wsdtdata.shift();
			wsdtdata.push(getNowTime());
			wendudata.shift();
			wendudata.push(Math.random()*20);
			shidudata.shift();
			shidudata.push(Math.random()*200);
			wenshiduchart.setOption(wenshiduoption);
		},5000);

		function getNowTime() { 
			var date=new Date();
			var hour=date.getHours(); 
			var minute=date.getMinutes(); 
			var second=date.getSeconds();
			hour=(""+hour).length==1?"0"+hour:hour;
			minute=(""+minute).length==1?"0"+minute:minute;
			second=(""+second).length==1?"0"+second:second;
			return hour+":"+minute+":"+second; 
		} 
    </script>
</body>
</html>
