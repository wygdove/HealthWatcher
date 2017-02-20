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
                            <span><small><small>发布时间：13:05</small></small></span>
                        </div>
                    </div>
                    <div>
						<div class="p-m">
							<div class="col-sm-4">气温(℃)：5.0</div>
							<div class="col-sm-4">气压(hPa)：1027.0</div>
							<div class="col-sm-4">相对湿度(%)：10.0</div>
						</div>
						<div class="p-m">
							<div class="col-sm-4">风向：西南风</div>
							<div class="col-sm-4">风力：微风</div>
							<div class="col-sm-4">降雨量(mm)：0.0</div>
						</div>
                    </div>
                </div>
                <div class="widget white-bg no-padding">
                    <div class="p-m">
                        <span><big><big>未来一周气温变化</big></big></span>
                    </div>
					<div class="row">
						<table class="table text-center" frame=void>
							<tr>
								<td>周五<br/>02/17</td>
								<td>周六<br/>02/18</td>
								<td>周日<br/>02/19</td>
								<td>周一<br/>02/20</td>
								<td>周二<br/>02/21</td>
								<td>周三<br/>02/22</td>
								<td>周四<br/>02/23</td>
							</tr>
							<tr>
								<td><img src="resources/img/weather/qing.png" /><br/>多云</td>
								<td><img src="resources/img/weather/duoyun.png" /><br/>晴</td>
								<td><img src="resources/img/weather/duoyun.png" /><br/>多云</td>
								<td><img src="resources/img/weather/yin.png" /><br/>阴</td>
								<td><img src="resources/img/weather/qing.png" /><br/>晴</td>
								<td><img src="resources/img/weather/yin.png" /><br/>阴</td>
								<td><img src="resources/img/weather/qing.png" /><br/>晴</td>
							</tr>
							<tr>
								<td colspan=7><div class="echarts" id="chart_weatherforecast"></div></td>
							</tr>
							<tr>
								<td><img src="resources/img/weather/qing_night.png" /><br/>晴</td>
								<td><img src="resources/img/weather/qing_night.png" /><br/>晴</td>
								<td><img src="resources/img/weather/yin.png" /><br/>阴</td>
								<td><img src="resources/img/weather/qing.png" /><br/>晴</td>
								<td><img src="resources/img/weather/duoyun_night.png" /><br/>多云</td>
								<td><img src="resources/img/weather/yin.png" /><br/>阴</td>
								<td><img src="resources/img/weather/qing.png" /><br/>晴</td>
							</tr>
							<tr>
								<td>北风<br/>4~5级</td>
								<td>南风<br/>微风</td>
								<td>南风<br/>微风</td>
								<td>西北风<br/>4~5级</td>
								<td>北风<br/>3~4级</td>
								<td>南风<br/>微风</td>
								<td>南风<br/>微风</td>
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
							舒适度指数：较舒适<br />
							白天虽然天气晴好，但早晚会感觉偏凉，午后舒适、宜人。
						</div>
                        <div class="p-m">
							穿衣指数：较冷<br />
							建议着厚外套加毛衣等服装。年老体弱者宜着大衣、呢外套加羊毛衫。
						</div>
                        <div class="p-m">
							感冒指数：较易发<br />
							昼夜温差较大，较易发生感冒，请适当增减衣服。体质较弱的朋友请注意防护。
						</div>
                        <div class="p-m">
							空气质量指数：很差<br />
							气象条件不利于空气污染物稀释、扩散和清除，请尽量避免在室外长时间活动。
						</div>
                        <div class="p-m">
							紫外线指数：中等<br />
							属中等强度紫外线辐射天气，外出时建议涂擦SPF高于15、PA+的防晒护肤品，戴帽子、太阳镜。
						</div>
                        <div class="p-m">
							运动指数：较适宜<br />
							天气较好，但考虑气温较低，推荐您进行室内运动，若户外适当增减衣物并注意防晒。
						</div>
                        <div class="p-m">
							旅游指数：适宜<br />
							天气较好，气温稍低，会感觉稍微有点凉，不过也是个好天气哦。适宜旅游，可不要错过机会呦！
						</div>
                        <div class="p-m">
							洗车指数：较适宜<br />
							较适宜洗车，未来一天无雨，风力较小，擦洗一新的汽车至少能保持一天。
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
	var wfchart=echarts.init(document.getElementById("chart_weatherforecast"));
	option = {
		tooltip: {trigger: 'axis'},
		grid: {
			left: '6%',
			right: '6%'
		},
		xAxis:  {
			show: false,
			type: 'category',
			boundaryGap: false,
			data: ['周五','周六','周日','周一','周二','周三','周四']
		},
		yAxis: {
			show: false,
			type: 'value',
		},
		series: [
			{
				name:'最高气温',
				type:'line',
				itemStyle:{
					normal:{
						label:{
							show: true,
							formatter:'{c} °C'
						},
						color:'#EE9A00'
					}
				},
				data:[6, 7, 12, 8, 3, 4, 8]
			},
			{
				name:'最低气温',
				type:'line',
				itemStyle:{
					normal:{
						label:{
							show: true,
							position: 'bottom',
							formatter:'{c} °C'
						},
						color:'#00BFFF'
					}
				},
				data:[-4, -2, 1, -2, -3, -3, -3]
			}
		]
	};
	wfchart.setOption(option);
});
function formatDate(timestamp) { 
	var date=new Date(parseInt(timestamp));
	var year=date.getFullYear();
	var month=date.getMonth()+1; 
	var day=date.getDate(); 
	var hour=date.getHours(); 
	var minute=date.getMinutes(); 
	var second=date.getSeconds(); 
	return year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second; 
} 
</script>
</body>
</html>
