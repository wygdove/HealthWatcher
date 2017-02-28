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
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-4">
				<div class="widget white-bg">
					<div class="row">
						<div class="col-xs-4 text-left">
							<span><big><big>空气实况</big></big></span>
						</div>
						<div class="col-xs-8 text-right">
							<span><small><small>发布时间：
								<c:out value="${cityairlivevo.calTime }" default="暂无数据"></c:out>
							</small></small></span>
						</div>
					</div>
					<div class="p-m">空气质量指数: 
						<c:out value="${cityairlivevo.calAqi }" default="暂无数据"></c:out>
					</div>
					<div class="p-m">首要污染物: 
						<c:out value="${cityairlivevo.calPrimary }" default="暂无数据"></c:out>
					</div>
					<div class="p-m">PM2.5浓度：
						<c:out value="${cityairlivevo.calPm25 }" default="暂无数据"></c:out>
					 μg/m<sup>3</sup></div>
					<div class="p-m">PM10浓度: 
						<c:out value="${cityairlivevo.calPm10 }" default="暂无数据"></c:out>
					 μg/m<sup>3</sup></div>
					<div class="p-m">臭氧浓度: 
						<c:out value="${cityairlivevo.calO3 }" default="暂无数据"></c:out>
					 μg/m<sup>3</sup></div>
					<div class="p-m">一氧化碳浓度：
						<c:out value="${cityairlivevo.calCo }" default="暂无数据"></c:out>
					 mg/m<sup>3</sup></div>
					<div class="p-m">二氧化硫浓度: 
						<c:out value="${cityairlivevo.calSo2 }" default="暂无数据"></c:out>
					 μg/m<sup>3</sup></div>
					<div class="p-m">二氧化氮浓度: 
						<c:out value="${cityairlivevo.calNo2 }" default="暂无数据"></c:out>
					 μg/m<sup>3</sup></div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="widget white-bg">
					<div class="row">
						<div class="col-xs-4 text-left">
							<span><big><big>24小时历史</big></big></span>
						</div>
						<div class="col-xs-8 text-right">
							<span><small><small></small></small></span>
						</div>
					</div>
					<table class="table text-center" frame="void" style="margin-top:20px;">
						<tr>
							<th>因子</th>
							<th>当前</th>
							<th>最大</th>
							<th>最小</th>
							<th>趋势</th>
						</tr>
						<c:forEach items="${cityairhistoryvos }" var="chlist">
							<tr>
				    			<td><c:out value="${chlist.cahItemName }" default="暂无数据"></c:out></td>
				    			<td><c:out value="${chlist.cahItemNow }" default="暂无数据"></c:out></td>
				    			<td><c:out value="${chlist.cahItemMax }" default="暂无数据"></c:out></td>
				    			<td><c:out value="${chlist.cahItemMin }" default="暂无数据"></c:out></td>
								<td><div id="chart_${chlist.cahItemName }" style="width:300px;height:50px;"></div></td>
							</tr>
			    		</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="row no-padding">
			<div class="col-sm-12">
				<div id="chart_chinacityair" style="height: 500px;"></div>
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
	<script src="resources/js/plugins/echartsmap/china.js"></script>
<script>
$(document).ready(function() {
	docahchart();
	domapchart();
});

function docahchart() {
	var caitems=[
		{name:"AQI",color:"#EFBA2E",sub:"μg/m<sup>3</sup>"},
		{name:"PM25",color:"#F1706B",sub:"μg/m<sup>3</sup>"},
		{name:"PM10",color:"#4BC169",sub:"μg/m<sup>3</sup>"},
		{name:"o3",color:"#71ABF1",sub:"μg/m<sup>3</sup>"},
		{name:"CO",color:"#EFBA2E",sub:"mg/m<sup>3</sup>"},
		{name:"SO2",color:"#7071EF",sub:"μg/m<sup>3</sup>"},
		{name:"NO2",color:"#1BB4F0",sub:"μg/m<sup>3</sup>"}
	];
	$.ajax({
		cache: true,
		async: false,
		type: 'get',
		url: './environment/chart/cityairhistory',
		success:function(redata) {
			var dt=[];
			var daqi=[];
			var dpm25=[];
			var dpm10=[];
			var do3=[];
			var dco=[];
			var dso2=[];
			var dno2=[];
			$(redata).each(function(i) {
				dt.push(this.stime);
				daqi.push(this.aqi);
				dpm25.push(this.pm25);
				dpm10.push(this.pm10);
				do3.push(this.o3);
				dco.push(this.co);
				dso2.push(this.so2);
				dno2.push(this.no2);
			});
			setcachartdata(caitems[0],dt,daqi);
			setcachartdata(caitems[1],dt,dpm25);
			setcachartdata(caitems[2],dt,dpm10);
			setcachartdata(caitems[3],dt,do3);
			setcachartdata(caitems[4],dt,dco);
			setcachartdata(caitems[5],dt,dso2);
			setcachartdata(caitems[6],dt,dno2);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setcachartdata(caitem,dataxaxis,dataseries) {
	var cachart=echarts.init(document.getElementById("chart_"+caitem.name));
	cachart.setOption({
		color: [caitem.color],
		tooltip: {
			trigger:'axis',
			formatter:'{c} '+caitem.sub,
			axisPointer:{type:'shadow'}
		},
		grid: {
			left:'1%',right:'1%',bottom:'1%',top:'1%',
			containLabel:true
		},
		xAxis: [{show:false,type:'category',data:dataxaxis}],
		yAxis: [{show:false,type:'value'}],
		series: [{type:'bar',data:dataseries}]
	});
}

function domapchart() {
	$.ajax({
		cache: true,
		async: false,
		type: 'get',
		url: './environment/chart/allcityair',
		success:function(redata) {
			var dataseries=[];
			var geoCoordMap={};
			$(redata).each(function(i) {
				dataseries.push({name:this.cityname,value:this.cityaqi});
				geoCoordMap[this.cityname]=[this.longtitude,this.latitude];
			});
			setmapdata(geoCoordMap,dataseries);
		},
		error:function(redata) {
			console.log(redata);
		}
	});
}

function setmapdata(geoCoordMap,dataseries) {
	var chinacityairchart=echarts.init(document.getElementById("chart_chinacityair"));
	var convertData=function(data) {
	    var res=[];
	    for(var i=0;i<data.length;i++) {
	        var geoCoord=geoCoordMap[data[i].name];
	        if(geoCoord) {
	            res.push({
	                name: data[i].name,
	                value: geoCoord.concat(data[i].value)
	            });
	        }
	    }
	    return res;
	};
	chinacityairchart.setOption({
	    backgroundColor:'#404a59',
	    title: {
	        text:'全国主要城市空气质量',
	        x:'center',
	        textStyle:{color:'#fff'}
	    },
	    tooltip: {
	        trigger:'item',
	        formatter:function(params) {
	            return params.name+' : '+params.value[2];
	        }
	    },
	    legend: {
	        orient:'vertical',
	        x:'right',y:'bottom',
	        data:['AQI'],
	        textStyle:{color:'#fff'}
	    },
	    visualMap: {
	        calculable:true,
	        inRange:{color:['#50a3ba','#eac736','#d94e5d']},
	        textStyle:{color:'#fff'}
	    },
	    geo: {
	        map:'china',
	        label:{emphasis:{show:false}},
	        itemStyle:{
	            normal:{areaColor:'#323c48',borderColor:'#111'},
	            emphasis:{areaColor:'#2a333d'}
	        }
	    },
	    series: [{
	        name: 'AQI',
	        type: 'scatter',
	        coordinateSystem: 'geo',
	        data: convertData(dataseries),
	        symbolSize:10,
	        label:{normal:{show:false},emphasis:{show:false}},
	        itemStyle:{emphasis:{borderColor:'#fff',borderWidth:1}}
	    }]
	});
}
</script>
</body>
</html>