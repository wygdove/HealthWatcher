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
<!-- refresh this page every hour -->
<meta http-equiv="refresh" content="3600">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>健康卫士</title>
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
                            <span><big><big>实时天气</big></big></span>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span><small><small>发布时间：
                            	<c:out value="${weatherlivevo.wlUpdateTime }" default="暂无数据"></c:out>
                            </small></small></span>
                        </div>
                    </div>
                    <div>
						<div class="p-m">
							<div class="col-sm-4">当前：
								<c:out value="${weatherlivevo.wlPhenomena }" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4">体感温度：
								<c:out value="${weatherlivevo.wlFeelst }" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4"></div>
						</div>
						<div class="p-m">
							<div class="col-sm-4">气温(℃)：
								<c:out value="${weatherlivevo.wlTemperature }" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4">气压(hPa)：
								<c:out value="${weatherlivevo.wlAirPressure }" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4">相对湿度(%)：
								<c:out value="${weatherlivevo.wlHumidity }" default="暂无数据"></c:out>
							</div>
						</div>
						<div class="p-m">
							<div class="col-sm-4">风向：
								<c:out value="${weatherlivevo.wlWindDirect}" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4">风力：
								<c:out value="${weatherlivevo.wlWindPower}" default="暂无数据"></c:out>
							</div>
							<div class="col-sm-4">降雨量(mm)：
								<c:out value="${weatherlivevo.wlRain}" default="暂无数据"></c:out>
							</div>
						</div>
                    </div>
                </div>
                <div class="widget white-bg no-padding">
                    <div class="p-m">
                        <span><big><big>未来天气变化</big></big></span>
                    </div>
					<div class="row">
						<table class="table text-center" frame="void">
							<tr>
								<c:forEach items="${weatherforecastvos }" var="wflist">
					    			<td>
					    				<c:out value="${wflist.wfDayWeek }" default="暂无数据"></c:out>
					    				<br />
					    				<c:out value="${wflist.wfDay }" default="暂无数据"></c:out>
				    				</td>
					    		</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${weatherforecastvos }" var="wflist">
					    			<td>
					    				<img src='resources/img/weather/<c:out value="${wflist.wfCondDImg }" default="default.png"></c:out>' />
					    				<br />
					    				<c:out value="${wflist.wfCondD }" default="暂无数据"></c:out>
				    				</td>
					    		</c:forEach>
							</tr>
							<tr>
								<td colspan=7><div class="echarts" id="chart_weatherforecast"></div></td>
							</tr>
							<tr>
								<c:forEach items="${weatherforecastvos }" var="wflist">
					    			<td>
					    				<img src='resources/img/weather/<c:out value="${wflist.wfCondNImg }" default="default.png"></c:out>' />
					    				<br />
					    				<c:out value="${wflist.wfCondN }" default="暂无数据"></c:out>
				    				</td>
					    		</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${weatherforecastvos }" var="wflist">
					    			<td>
					    				<c:out value="${wflist.wfWindDir }" default="暂无数据"></c:out>
					    				<br />
					    				<c:out value="${wflist.wfWindPower }" default="暂无数据"></c:out>
				    				</td>
					    		</c:forEach>
							</tr>
						</table>
					</div>
                    
                </div>
            </div>
            <div class="col-sm-4">
                <div class="widget white-bg no-padding">
                    <div class="p-m">
						<div class="p-m">
							<span><big><big>生活指数</big></big></span>
						</div>
                        <div class="p-m">
							舒适度指数：<c:out value="${weatherforecastlifevo.wflComfBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflComfTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							穿衣指数：<c:out value="${weatherforecastlifevo.wflDrsBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflDrsTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							感冒指数：<c:out value="${weatherforecastlifevo.wflFluBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflFluTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							空气质量指数：<c:out value="${weatherforecastlifevo.wflAirBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflAirTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							紫外线指数：<c:out value="${weatherforecastlifevo.wflUvBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflUvTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							运动指数：<c:out value="${weatherforecastlifevo.wflSportBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflSportTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							旅游指数：<c:out value="${weatherforecastlifevo.wflTravBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflTravTxt }" default="暂无数据"></c:out>
						</div>
                        <div class="p-m">
							洗车指数：<c:out value="${weatherforecastlifevo.wflCwBrf }" default="暂无数据"></c:out><br />
							<c:out value="${weatherforecastlifevo.wflCwTxt }" default="暂无数据"></c:out>
						</div>
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
    <script src="resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	<script src="resources/js/plugins/echarts/echarts.min.js"></script>
<script>
$(document).ready(function() {
	dowfchart();
});

function dowfchart() {
	$.ajax({
		cache: true,
		async: false,
		type: 'get',
		url: './environment/chart/weatherforecast',
		success:function(redata) {
			var dw=[];
			var da=[];
			var di=[];
			$(redata).each(function(i) {
				dw.push(this.wfDayWeek);
				da.push(this.wfTmpMax);
				di.push(this.wfTmpMin);
			});
			setchartdata(dw,da,di);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setchartdata(dataxaxis,dataseriesmax,dataseriesmin) {
	var wfchart=echarts.init(document.getElementById("chart_weatherforecast"));
	wfchart.setOption({
		grid:{left:'6%',right:'6%'},
		xAxis:{show:false,type:'category',boundaryGap:false,data:dataxaxis},
		yAxis: {show: false,type: 'value',},
		series: [{
			name:'最高气温',
			type:'line',
			itemStyle:{normal:{label:{show: true,formatter:'{c} °C'},color:'#EE9A00'}},
			data:dataseriesmax
		},{
			name:'最低气温',
			type:'line',
			itemStyle:{normal:{label:{show: true,position: 'bottom',formatter:'{c} °C'},color:'#00BFFF'}},
			data:dataseriesmin
		}]
	});
}

</script>
</body>
</html>
