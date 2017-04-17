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
<link href="resources/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
                <div class="widget white-bg">
					<div class="row">
						<div class="col-xs-12 text-left">
							<span><big><big>更新个人信息</big></big></span>
						</div>
					</div>
					<div class="row">
						<form class="form-horizontal m-t" novalidate="novalidate" action="./setting/personalupdate" method="post" target="resiframe" >
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-3">
                                    <input id="username" name="username" class="form-control" type="text" value="${hwuser.loginAccount }" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">昵称：</label>
                                <div class="col-sm-3">
                                    <input id="usernickname" name="usernickname" class="form-control" type="text" value="${hwuser.displayName }" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-3">
                                    <input id="userpassword" name="userpassword" class="form-control" type="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码：</label>
                                <div class="col-sm-3">
                                    <input id="newpassword" name="newpassword" class="form-control" type="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">确认新密码：</label>
                                <div class="col-sm-3">
                                    <input id="confirmnewpassword" name="confirmnewpassword" class="form-control" type="password" />
                                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i>请再次输入您的密码</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">所在地区：</label>
								<div class="col-sm-9">
									<select class="selecter" id="select_province" name="select_province" style="width:120px;">
										<option value="beijing">北京市</option>
										<option value="tianjin">河北省</option>
										<option value="kaifeng">河南省</option>
									</select>
									<select class="selecter" id="select_city" name="select_city" style="width:130px;">
										<option value="${hwuser.cityCode }" selected="selected">${hwuser.cityName }</option>
										<option value="beijing">北京</option>
										<option value="tianjin">天津</option>
										<option value="kaifeng">开封</option>
									</select>
								</div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9 col-sm-offset-3">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="checkbox" id="agree" name="agree">
                                           	<span>我已经认真阅读并同意<a href="">《健康卫士使用协议》</a></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
                        <iframe name="resiframe" style="display:none"></iframe>
					</div>
				</div>
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
    <script src="resources/js/qq-tajs-stats.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
		$('.selecter').chosen();
    });
    </script>
</body>
</html>
