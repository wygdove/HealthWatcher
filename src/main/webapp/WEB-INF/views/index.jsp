<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
		request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>健康卫士</title>
<link href="resources/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style>
.img-circle {
    border-radius: 50%;
    display: block;
    height: 80px;
    width: 80px;
    box-shadow: 0 0 5px rgba(0, 0, 0, .15);
    cursor: pointer;
    overflow: hidden;
}
</style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span>
								<img alt="image" class="img-circle" src="<c:out value="${hwuser.userAvatar }" default="resources/img/useravatar/defaultavator.jpg"></c:out>" />
							</span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
									<span class="block m-t-xs" style="margin-left:10px;">
										<strong class="font-bold">
											<c:out value="${hwuser.displayName }" default="获取异常"></c:out>
										</strong>
									</span>
								</span>
							</a>
						</div>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">体能监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="physical/bodytemperature">
								<i class="fa fa-cube"></i>
								<span class="nav-label">体温图</span>
							</a></li>
							<li><a class="J_menuItem" href="physical/pulse">
								<i class="fa fa-cube"></i>
								<span class="nav-label">脉搏图</span>
							</a></li>
							<li><a class="J_menuItem" href="physical/breathe">
								<i class="fa fa-cube"></i>
								<span class="nav-label">呼吸图</span>
							</a></li>
							<li><a class="J_menuItem" href="physical/bloodoxygen">
								<i class="fa fa-cube"></i>
								<span class="nav-label">血氧图</span>
							</a></li>
							<li><a class="J_menuItem" href="physical/electrocardiogram">
								<i class="fa fa-cube"></i>
								<span class="nav-label">心电图</span>
							</a></li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">室内监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="indoor/pmio">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">PM2.5</span>
							</a></li>
							<li><a class="J_menuItem" href="indoor/wenshidu">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">温湿度</span>
							</a></li>
							<%--
							<li><a class="J_menuItem" href="indoor/camera">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">实时监控</span>
							</a></li>
							--%>
						</ul>
					</li>
					<%--
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">室内监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="indoor/indoorbase">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">基础数据</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">人体感应</span>
							</a></li>
							<li><a class="J_menuItem" href="indoor/camera">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">实时监控</span>
							</a></li>
						</ul>
					</li>
					--%>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">环境监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="environment/weather">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">天气变化</span>
							</a></li>
							<li><a class="J_menuItem" href="environment/cityair">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">空气质量</span>
							</a></li>
							<%--
							<li><a class="J_menuItem" href="environment/pollution">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">环境污染</span>
							</a></li>
							--%>
							<li><a class="J_menuItem" href="environment/disaster">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">自然灾害</span>
							</a></li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">系统设置</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="setting/personal">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">个人资料</span>
							</a></li>
							<li><a class="J_menuItem" href="setting/device">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">设备管理</span>
							</a></li>
							<li><a class="J_menuItem"  href="setting/suggest">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">意见反馈</span>
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<ul class="nav navbar-top-links navbar-left">
						<li class="dropdown hidden-xs">
							<a class="right-sidebar-toggle" aria-expanded="false" style="padding: 22px 15px 10px 20px;">
								<span>当前城市：</span>
								<span id="hwusercityname" data-id="${hwuser.cityCode }">${hwuser.cityName }</span>
							</a>
						</li>
						<li class="dropdown hidden-xs">
							<a class="right-sidebar-toggle" aria-expanded="false" style="padding: 22px 12px 10px 12px;"> 
								<span>现在时间：</span>
								<span id="nowtime"></span> 
							</a>
						</li>
					</ul>
            		<ul class="nav navbar-top-links navbar-right">
            			<li class="dropdown hidden-xs">
            				<a href="logon/logout">安全退出</a>
            			</li>
            		</ul>
                </nav>
            </div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0"
					src="content" data-id="index" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">&copy; 卫艳鸽  毕业设计</div>
			</div>
		</div>
	</div>
	
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/hplus.min.js?v=4.1.0"></script>
	<script type="text/javascript" src="resources/js/contabs.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.selecter').chosen();
			$("#nowtime").html(formatDate((new Date()).getTime()).substr(0,16));
		});	
		setInterval(function() {
			$("#nowtime").html(formatDate((new Date()).getTime()).substr(0,16));
		}, 9988);
		
		function getcitylist() {
			$.ajax({
				cache:true,
				async:false,
				type:'post',
				url:'./cityinfo/citylist',
				data:{
					userid:userid
				},
				success:function(redata) {
					$("#select_city").children("option").remove();
					var addoption="";
					$(redata[1]).each(function(i) {
						addoption=addoption+'<option value='+this.citycode+'>'+this.cityname+'</option>';
					});
					$("#select_city").append(addoption);
					$("#select_city").trigger("chosen:updated");
				},
				error:function(redata) {
					console.log(redata);
				}
			});
		}
		
		function formatDate(timestamp) { 
			var date=new Date(parseInt(timestamp));
			var year=date.getFullYear();
			var month=date.getMonth()+1; 
			var day=date.getDate(); 
			var hour=date.getHours(); 
			var minute=date.getMinutes(); 
			var second=date.getSeconds();
			if(month.toString().length==1)month="0"+month;
			if(day.toString().length==1)day="0"+day;
			if(hour.toString().length==1)hour="0"+hour;
			if(minute.toString().length==1)minute="0"+minute;
			if(second.toString().length==1)second="0"+second;
			return year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second; 
		} 
	</script>
</body>
</html>
