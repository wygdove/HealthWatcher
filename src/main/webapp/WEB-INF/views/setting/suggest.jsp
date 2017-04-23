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
							<span><big><big>意见反馈</big></big></span>
						</div>
					</div>
					<div class="row">
						<form id="suggestform" class="form-horizontal m-t" action="./setting/addsuggest" method="post" target="resiframe" >
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名：</label>
                                <div class="col-sm-3">
                                    <input id="username" name="username" class="form-control" type="text" value="${hwuser.loginAccount }" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">意见/建议：</label>
                                <div class="col-sm-9">
                                    <textarea id="message" name="message" class="form-control" style="height:230px;margin-top:20px;resize:none"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button id="submitbtn" class="btn btn-primary" type="submit">提交</button>
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
    <script src="resources/js/qq-tajs-stats.js"></script>
    <script src="resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#suggestform").validate({
			rules:{message:"required"},
			messages:{message:"反馈的意见不能为空！"}
		});
	});
	</script>
</body>
</html>
