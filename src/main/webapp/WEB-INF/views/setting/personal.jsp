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
<link href="resources/plugins/cropper/cropper.min.css" rel="stylesheet">
<link href="resources/views/css/avatar.css" rel="stylesheet">
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
                                <label class="col-sm-3 control-label">头像：</label>
                                <div class="col-sm-3">
                                    <div class="avatar-view" title="更换头像">
										<img id="personalavator" src="resources/img/useravatar/defaultavator.jpg" alt="Avatar">
									</div>
									<span id="avatarsuccess" style="display:none;font-size:8px;margin-top:5px;margin-left:5px;color:red;">修改成功，下次登录生效！</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-3">
                                <input id="userid" name="userid" class="form-control" type="text" value="${hwuser.userId }" style="display:none;">
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
                                            <input checked="checked" type="checkbox" class="checkbox" id="agree" name="agree">
                                           	<span>我已经认真阅读并同意<a href="">《健康卫士使用协议》</a></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
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
    
    <div id="avatar-modal" class="modal fade" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form id="avatar-form" class="avatar-form" action="" enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="avatar-modal-label">Change Avatar</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<!-- Upload image and data -->
							<div class="avatar-upload">
								<input type="hidden" class="avatar-src" name="avatar_src" />
								<input type="hidden" class="avatar-data" name="avatar_data" />
								<label for="avatarInput">本地上传：</label>
								<input type="file" class="avatar-input" id="avatarInput" name="imgfile" />
							</div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper">
										<img id="avatarWrapper" src="" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg"></div>
									<div class="avatar-preview preview-md"></div>
									<div class="avatar-preview preview-sm"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white avatar-save" data-dismiss="modal">确定</button>
					</div>
				</form>
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
	<script src="resources/js/contabs.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/validate/messages_zh.min.js"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
    <script src="resources/plugins/cropper/tether.min.js"></script>
    <script src="resources/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
		$('.selecter').chosen();
		initform();
		initavatar();
    });
    
    function initform() {
    	$("#agree").on("click",function() {
			if($("#agree")[0].checked) {
				$("#submitbtn").attr("disabled",false);
			}else {
				$("#submitbtn").attr("disabled",true);
			}
    	});
    }

    function initavatar() {
    	$("#personalavator").click(function() {
    		$("#avatar-modal").modal('show');
    	});

		$('#avatar-modal').on('shown.bs.modal',function() {
// 			var imgurl=$("#personalavator").attr('src');
// 			startCropper(imgurl);
			$("#avatarWrapper").attr("src",'');
			$(".avatar-preview").html('');
			$("#avatarsuccess").hide();
		}).on('hidden.bs.modal',function() {
			stopCropper();
			var file=getImgFile();
			if(file!=null) {
				uploadavatar(file);
			}
		});

		$("#avatarInput").on('change',function() {
			var file=getImgFile();
			if(file!=null) {
				var imgurl=URL.createObjectURL(file);
				$("#avatarWrapper").attr("src",imgurl);
				$(".avatar-preview").html('<img src="'+imgurl+'">');
// 				startCropper(imgurl);
			}
		});
	}
	function startCropper(imgurl) {
		$("#avatarWrapper").cropper('destroy');
		$("#avatarWrapper").cropper({
			aspectRatio:1,
			preview:$(".avatar-preview").selector,
			crop:function(e) {
				var json=[
					'{"x":'+e.x,
					'"y":'+e.y,
					'"height":'+e.height,
					'"width":'+e.width,
					'"rotate":'+e.rotate+'}'
				].join();
				$(".avatar-data").val(json);
			}
		});
//		if(this.active) {
//			$("#avatarWrapper").cropper('replace',imgurl);
//		} else {
//			
//			this.active=true;
//		}
	}
	function stopCropper() {
		$(".avatar-preview").empty();
		$('#imgavator').cropper('destroy');
	}
	
	
	function uploadavatar(imgdata) {
// 		console.log($("#avatar-form"));
		var form=new FormData();
		form.append("imgfile",imgdata);
		try {
			var xhr=new XMLHttpRequest();
		    xhr.open("post",'./setting/uploadfile',true);
		    xhr.onload=function() {
				if(xhr.status==200) {
					var redata=xhr.response;
					// console.log(redata);
					$("#personalavator").attr("src","resources/img/useravatar/"+redata);
					updateavatar();
				}
		    };
		    xhr.send(form);
		}
		catch(err){
			alert("上传失败！");
			console.log(err);
		}
	}
	
	function updateavatar() {
		var imgurl=$("#personalavator").attr('src');
		$.ajax({
			type: 'post',
			url: './setting/updateavatar',
			data: {
				avatarfile:imgurl
			},
			success:function(redata) {
				if(redata=='success') {
					alert("头像更新成功，下次登录生效！");
				}
			},
			error:function(redata) {
				console.log(redata);
			}
		});	 
	}

	function getImgFile() {
		var files=$("#avatarInput").prop('files');
		if(files.length > 0) {
			var file=files[0];
			if(isImageFile(file)) {
				return file;
			}
		}
		return null;
	}
	function isImageFile(file) {
		if(file.type) {
			return /^image\/\w+$/.test(file.type);
		} else {
			return /\.(jpg|jpeg|png|gif)$/.test(file);
		}
	}
	</script>
</body>
</html>
