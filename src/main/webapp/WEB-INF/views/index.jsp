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
											<c:out value="${hwuser.displayName }" default="获取异常"></c:out>
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
															style="height: 230px; margin-top: 20px;resize: none"></textarea>
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
								<li><a href="logon/logout">安全退出</a></li>
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
							<li><a class="J_menuItem" href="test">
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
			<div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<ul class="nav navbar-top-links navbar-left">
					  <li class="dropdown hidden-xs">
						<a class="right-sidebar-toggle" aria-expanded="false" style="padding:12px 12px 10px 12px;">
							<select class="selecter" id="select_city" style="width:100px;">
							  <c:if test="${!empty hwuser.cityCode }">
							  	<option value="${hwuser.cityCode }" selected="selected">${hwuser.cityName }</option>
							  </c:if>
							  <option value="beijing">北京</option>
							  <option value="tianjin">天津</option>
							  <option value="kaifeng">开封</option>
							</select>
						  </a>
					  </li>
					</ul>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false"><i class="fa fa-tasks"></i>主题</a>
                        </li>
                    </ul>
                </nav>
            </div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0"
					src="testproject?str=123" data-id="index" seamless></iframe>
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
	<script src="resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.selecter').chosen();
			$("#suggestion").validate({
				rules:{
					message:"required"
				},
				messages:{
					message:"反馈的意见不能为空！"
				}
			});
		});	
		
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
		function showsuggest(obj) {
			$("#suggest").modal("show");
		}
		function addsuggestion(){
			if(!$("#suggestion").valid()){
				return ;
			}
			var message = $("#message").val();
			$("#suggest").modal("hide");
			$.ajax({
				type : 'post',
				url  : './suggestion/sinfo',
				data : {
					message:message,
					userid:userid
				},
				success:function(redata) {
					console.log(redata);
				},
				error:function(redata) {
					console.log(redata);
				}
			});	 
		}
	</script>
</body>
</html>
