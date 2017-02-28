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
	<script src="resources/js/plugins/echartsmap/geo/citygeo.js"></script>
<script>
$(document).ready(function() {
	//domapchart();
	docahchart();
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
		type: 'post',
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
	var chinacityairchart=echarts.init(document.getElementById("chart_chinacityair"));
	var geodata=[
		{name: "海门", value: 9},
		{name: "鄂尔多斯", value: 12},
		{name: "招远", value: 12},
		{name: "舟山", value: 12},
		{name: "齐齐哈尔", value: 14},
		{name: "盐城", value: 15},
		{name: "赤峰", value: 16},
		{name: "青岛", value: 18},
		{name: "乳山", value: 18},
		{name: "金昌", value: 19},
		{name: "泉州", value: 21},
		{name: "莱西", value: 21},
		{name: "日照", value: 21},
		{name: "胶南", value: 22},
		{name: "南通", value: 23},
		{name: "拉萨", value: 24},
		{name: "云浮", value: 24},
		{name: "梅州", value: 25},
		{name: "文登", value: 25},
		{name: "上海", value: 25},
		{name: "攀枝花", value: 25},
		{name: "威海", value: 25},
		{name: "承德", value: 25},
		{name: "厦门", value: 26},
		{name: "汕尾", value: 26},
		{name: "潮州", value: 26},
		{name: "丹东", value: 27},
		{name: "太仓", value: 27},
		{name: "曲靖", value: 27},
		{name: "烟台", value: 28},
		{name: "福州", value: 29},
		{name: "瓦房店", value: 30},
		{name: "即墨", value: 30},
		{name: "抚顺", value: 31},
		{name: "玉溪", value: 31},
		{name: "张家口", value: 31},
		{name: "阳泉", value: 31},
		{name: "莱州", value: 32},
		{name: "湖州", value: 32},
		{name: "汕头", value: 32},
		{name: "昆山", value: 33},
		{name: "宁波", value: 33},
		{name: "湛江", value: 33},
		{name: "揭阳", value: 34},
		{name: "荣成", value: 34},
		{name: "连云港", value: 35},
		{name: "葫芦岛", value: 35},
		{name: "常熟", value: 36},
		{name: "东莞", value: 36},
		{name: "河源", value: 36},
		{name: "淮安", value: 36},
		{name: "泰州", value: 36},
		{name: "南宁", value: 37},
		{name: "营口", value: 37},
		{name: "惠州", value: 37},
		{name: "江阴", value: 37},
		{name: "蓬莱", value: 37},
		{name: "韶关", value: 38},
		{name: "嘉峪关", value: 38},
		{name: "广州", value: 38},
		{name: "延安", value: 38},
		{name: "太原", value: 39},
		{name: "清远", value: 39},
		{name: "中山", value: 39},
		{name: "昆明", value: 39},
		{name: "寿光", value: 40},
		{name: "盘锦", value: 40},
		{name: "长治", value: 41},
		{name: "深圳", value: 41},
		{name: "珠海", value: 42},
		{name: "宿迁", value: 43},
		{name: "咸阳", value: 43},
		{name: "铜川", value: 44},
		{name: "平度", value: 44},
		{name: "佛山", value: 44},
		{name: "海口", value: 44},
		{name: "江门", value: 45},
		{name: "章丘", value: 45},
		{name: "肇庆", value: 46},
		{name: "大连", value: 47},
		{name: "临汾", value: 47},
		{name: "吴江", value: 47},
		{name: "石嘴山", value: 49},
		{name: "沈阳", value: 50},
		{name: "苏州", value: 50},
		{name: "茂名", value: 50},
		{name: "嘉兴", value: 51},
		{name: "长春", value: 51},
		{name: "胶州", value: 52},
		{name: "银川", value: 52},
		{name: "张家港", value: 52},
		{name: "三门峡", value: 53},
		{name: "锦州", value: 54},
		{name: "南昌", value: 54},
		{name: "柳州", value: 54},
		{name: "三亚", value: 54},
		{name: "自贡", value: 56},
		{name: "吉林", value: 56},
		{name: "阳江", value: 57},
		{name: "泸州", value: 57},
		{name: "西宁", value: 57},
		{name: "宜宾", value: 58},
		{name: "呼和浩特", value: 58},
		{name: "成都", value: 58},
		{name: "大同", value: 58},
		{name: "镇江", value: 59},
		{name: "桂林", value: 59},
		{name: "张家界", value: 59},
		{name: "宜兴", value: 59},
		{name: "北海", value: 60},
		{name: "西安", value: 61},
		{name: "金坛", value: 62},
		{name: "东营", value: 62},
		{name: "牡丹江", value: 63},
		{name: "遵义", value: 63},
		{name: "绍兴", value: 63},
		{name: "扬州", value: 64},
		{name: "常州", value: 64},
		{name: "潍坊", value: 65},
		{name: "重庆", value: 66},
		{name: "台州", value: 67},
		{name: "南京", value: 67},
		{name: "滨州", value: 70},
		{name: "贵阳", value: 71},
		{name: "无锡", value: 71},
		{name: "本溪", value: 71},
		{name: "克拉玛依", value: 72},
		{name: "渭南", value: 72},
		{name: "马鞍山", value: 72},
		{name: "宝鸡", value: 72},
		{name: "焦作", value: 75},
		{name: "句容", value: 75},
		{name: "北京", value: 79},
		{name: "徐州", value: 79},
		{name: "衡水", value: 80},
		{name: "包头", value: 80},
		{name: "绵阳", value: 80},
		{name: "乌鲁木齐", value: 84},
		{name: "枣庄", value: 84},
		{name: "杭州", value: 84},
		{name: "淄博", value: 85},
		{name: "鞍山", value: 86},
		{name: "溧阳", value: 86},
		{name: "库尔勒", value: 86},
		{name: "安阳", value: 90},
		{name: "开封", value: 90},
		{name: "济南", value: 92},
		{name: "德阳", value: 93},
		{name: "温州", value: 95},
		{name: "九江", value: 96},
		{name: "邯郸", value: 98},
		{name: "临安", value: 99},
		{name: "兰州", value: 99},
		{name: "沧州", value: 100},
		{name: "临沂", value: 103},
		{name: "南充", value: 104},
		{name: "天津", value: 105},
		{name: "富阳", value: 106},
		{name: "泰安", value: 112},
		{name: "诸暨", value: 112},
		{name: "郑州", value: 113},
		{name: "哈尔滨", value: 114},
		{name: "聊城", value: 116},
		{name: "芜湖", value: 117},
		{name: "唐山", value: 119},
		{name: "平顶山", value: 119},
		{name: "邢台", value: 119},
		{name: "德州", value: 120},
		{name: "济宁", value: 120},
		{name: "荆州", value: 127},
		{name: "宜昌", value: 130},
		{name: "义乌", value: 132},
		{name: "丽水", value: 133},
		{name: "洛阳", value: 134},
		{name: "秦皇岛", value: 136},
		{name: "株洲", value: 143},
		{name: "石家庄", value: 147},
		{name: "莱芜", value: 148},
		{name: "常德", value: 152},
		{name: "保定", value: 153},
		{name: "湘潭", value: 154},
		{name: "金华", value: 157},
		{name: "岳阳", value: 169},
		{name: "长沙", value: 175},
		{name: "衢州", value: 177},
		{name: "廊坊", value: 193},
		{name: "菏泽", value: 194},
		{name: "合肥", value: 229},
		{name: "武汉", value: 273},
		{name: "大庆", value: 279}
	];
	var convertData=function (data) {
		var res=[];
		for(var i=0;i<data.length;i++) {
			var geoCoord=geoCoordMap[data[i].name];
			if(geoCoord) {
				res.push(geoCoord.concat(data[i].value));
			}
		}
		return res;
	};

	option={
		title: {
			text: '全国主要城市空气质量',
			subtext: 'data from PM25.in',
			sublink: 'http://www.pm25.in',
			left: 'center',
			textStyle: {
				color: '#fff'
			}
		},
		backgroundColor: '#404a59',
		visualMap: {
			min: 0,
			max: 500,
			splitNumber: 5,
			inRange: {
				color: ['#d94e5d','#eac736','#50a3ba'].reverse()
			},
			textStyle: {
				color: '#fff'
			}
		},
		geo: {
			map: 'china',
			label: {
				emphasis: {
					show: false
				}
			},
			roam: true,
			itemStyle: {
				normal: {
					areaColor: '#323c48',
					borderColor: '#111'
				},
				emphasis: {
					areaColor: '#2a333d'
				}
			}
		},
		series: [{
			name: 'AQI',
			type: 'heatmap',
			coordinateSystem: 'geo',
			data: convertData(geodata)
		}]
	};
	chinacityairchart.setOption(option);
}
</script>
</body>
</html>