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
						${str }
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
</body>
</html>