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
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="widget white-bg">
                    <div class="row">
                        <div class="col-xs-4 text-left">
                            <span><big><big>灾害预警</big></big></span>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span><small><small>中央气象台 2016-12-12_22:40:00</small></small></span>
                        </div>
                    </div>
					<div class="row">
						<div class="col-sm-2">
							<div class="p-m"><img src="resources/img/alertImages/s0005003.jpg" /></div>
						</div>
						<div class="col-sm-10">
							<div style="display:none">0发布1解除</div>
							<div class="p-m">
								北京市 通州区 大雾 黄色
								<br/>
								通州区气象台12日22时40分发布大雾黄色预警,预计当前至13日上午通州区有浓雾，能见度小于500米，局地能见度不足200米，请注意防范。				
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
		<div class="row">
			<div class="col-sm-12">
				<div class="widget white-bg">
                    <div class="row">
                        <div class="col-xs-4 text-left">
                            <span><big><big>气象灾害</big></big></span>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span><small><small></small></small></span>
                        </div>
                    </div>
					<div class="row">
						<div class="col-sm-12">
							<div class="p-m">暂无</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="widget white-bg">
                    <div class="row">
                        <div class="col-xs-4 text-left">
                            <span><big><big>地质灾害</big></big></span>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span><small><small></small></small></span>
                        </div>
                    </div>
					<div class="row">
						<table class="table text-center" frame="void">
							<tr>
								<th style="text-align:center;">时间</th>
								<th style="text-align:center;">震源坐标</th>
								<th style="text-align:center;">地点</th>
								<th style="text-align:center;">震级</th>
								<th style="text-align:center;">震源深度</th>
								<th style="text-align:center;">距离</th>
							</tr>
							<c:forEach items="${earthquakevos }" var="eqlist">
								<tr>
					    			<td><c:out value="${eqlist.eqTime }" default="暂无数据"></c:out></td>
					    			<td>
					    				[<c:out value="${eqlist.eqLatitude }" default="暂无数据"></c:out>,
					    				<c:out value="${eqlist.eqLongitude }" default="暂无数据"></c:out>]
					    			</td>
					    			<td><c:out value="${eqlist.eqPlace }" default="暂无数据"></c:out></td>
					    			<td><c:out value="${eqlist.eqMag }" default="暂无数据"></c:out></td>
					    			<td><c:out value="${eqlist.eqDepth }" default="暂无数据"></c:out></td>
					    			<td><c:out value="${eqlist.eqDistance }" default="暂无数据"></c:out></td>
					    		</tr>
				    		</c:forEach>
						</table>
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
</body>
</html>
