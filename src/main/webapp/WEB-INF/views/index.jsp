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
								<img alt="image" class="img-circle" src="resources/img/profile_small.jpg" />
							</span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
									<span class="block m-t-xs">
										<strong class="font-bold">
											<c:out value="${nt}" default="获取异常"></c:out>
										</strong>
										<b class="caret"></b>
									</span>
									<span class="text-muted text-xs block"> </span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="form_avatar.html">修改头像</a></li>
								<li><a class="J_menuItem" href="person/infolist">个人资料</a></li>
								<li class=" hidden-xs">
									<a class="J_menuItem" onclick="javascript:showsuggest(this)" 
										data-toggle="modal" data-target="#suggest">意见反馈</a>
									<div class="modal inmodal" id="suggest" tabindex="-1" role="dialog" aria-hidden="true">
										<form class="modal-dialog" id="suggestion">
											<div class="modal-content animated bounceInRight">
												<div class="modal-body" style="height: 100%">
													<div class="form-group">
														<textarea id="message" name="message" class="form-control"
															style="height: 230px; margin-top: 20px"></textarea>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
													<button type="button" class="btn btn-primary" onclick="addsuggestion()">确定</button>
												</div>
											</div>
										</form>
									</div>
								</li>
								<li class="divider"></li>
								<li><a href="loginout">安全退出</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">体能监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="#" data-index="0">
								<i class="fa fa-cube"></i>
								<span class="nav-label">体能数据一</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class="fa fa-cube"></i>
								<span class="nav-label">体能数据二</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class="fa fa-cube"></i>
								<span class="nav-label">体能数据三</span>
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
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">室内数据一</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">室内数据二</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">室内数据三</span>
							</a></li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">环境监测</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">环境数据一</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">环境数据二</span>
							</a></li>
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">环境数据三</span>
							</a></li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-sliders"></i>
							<span class="nav-label">测试</span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="#">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">test</span>
							</a></li>
							<li><a class="J_menuItem" href="testproject?str=123">
								<i class=" fa fa-cube"></i>
								<span class="nav-label">testproject</span>
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="modal inmodal" id="addmessage" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content animated bounceInRight">
						<div class="modal-body" style="height: 100%;">
							<form class="form-horizontal">
								<div class="form-group">
									<h2 style="text-align: center;">添加成功!</h2>
								</div>
								<div class="modal-footer" style="text-align: center;">
									<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0"
					src="testproject?str=123" data-id="index_v1.html" seamless></iframe>
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
	<script src="resources/js/amcproject/add_message.js"></script>
	<script src="resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#suggestion").validate({
				rules:{
					message:"required"
				},
				messages:{
					message:"反馈的意见不能为空！"
				}
			});
		});
		function showsuggest(obj) {
			$("#suggest").modal("show");
		}
	</script>
</body>
</html>
