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
<link href="resources/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeIn">
		<div class="row">
			<div class="col-md-12">
				<div class="tabs-container">
					<div class="panel-body">
						<h2>服务信息查询_端口
							<a href="javascript:history.go(-1)">
								<button class="btn btn-primary" style="float: right; margin-right: 15px;" type="button">返回</button>
							</a>
							<c:if test="${owner == true}">
								<a href="serviceip/serviceipupdate?serviceid=${serviceip.serviceid }">
									<button class="btn btn-primary" style="float: right; margin-right: 10px;" type="button">修改</button>
								</a>
							</c:if>
						</h2>
						<hr />
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">服务名称：</label>
								<label class="col-sm-9 control-label" style="text-align: left">
									${serviceip.servicename}
								</label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">服务描述：</label>
								<label class="col-sm-9 control-label" style="text-align: left">
									${serviceip.servicedescript}
								</label>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">类型：</label>
								<label class="col-sm-9 control-label" style="text-align: left">
									<c:if test="${serviceip.servicetype == '0'}">WEB</c:if>
									<c:if test="${serviceip.servicetype == '1'}">进程</c:if>
									<c:if test="${serviceip.servicetype == '2'}">端口</c:if>
									<c:if test="${serviceip.servicetype == '3'}">连通性</c:if>
								</label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">故障持续告警时间：</label>
								<label class="col-sm-9 control-label" style="text-align: left">
									${serviceip.alerttime}分钟
									<span style="color: red">（备注：此选项为所设置分钟数内连续发现错误则会告警）</span>
								</label>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	<script src="resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/validate/messages_zh.min.js"></script>
</body>
</html>
