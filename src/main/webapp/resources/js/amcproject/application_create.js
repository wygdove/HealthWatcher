$(document).ready(function() {
	$("#searchUser").keypress(function(e) {
		var key=e.which; //e.which是按键的值 
		if(key==13) {
			var teamid=$("#selectteam option:selected").val();
			var keyword=$("#searchUser").val();
			$.ajax({
				cache:true,
				async:false,
				type:'post',
				url:'./appli/addsubslist',
				data:{
					teamid:teamid,
					keyword:keyword
				},
				success:function(redata) {
					if(redata.length!=0) {
						$("#userList").empty();
						redata.forEach(function(user) {
							var radio='<label class="checkbox-inline">'
									+'<input type="radio" name = "user" class="i-checks" value="'
									+user.userId
									+'" loginAccount="'
									+user.loginAccount
									+'"> '
									+user.loginAccount
									+'</label>';
							$("#userList").append(radio);
						});
						$(".i-checks").iCheck({
							checkboxClass:"icheckbox_square-green",
							radioClass:"iradio_square-green",
						});
					} else {
						alert("该模糊查询下无员工!");
					}
		
				},
				error:function(redata) {
					alert("不明原因 失败了。。。。。");
				}
			});
		}
	});
});

function changeselectifclass(ifs) {
	if(ifs==null||ifs=='') {
		alert('不能为空');
	}
	else if(ifs=='yes') {
		$("#type0").css('display','none');
		$("#type00").css('display','block');
		$("#type11").css('display','block');
		$("#type12").css('display','block');
	}
	else if(ifs=='no') {
		$("#type0").css('display','block');
		$("#type00").css('display','block');
		$("#type11").css('display','none');
		$("#type12").css('display','none');
	}
}

function getapptype(teamid) {
	var teamid=teamid;
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./appli/getapptype',
		data:{
			teamid:teamid
		},
		success:function(redata) {
			if(redata[0]==0) {
				$("#type0").css('display','block');
				$("#type00").css('display','none');
				$("#type11").css('display','none');
				$("#type12").css('display','none');
			}
			if(redata[0]==1) {
				$("#type0").css('display','none');
				$("#type00").css('display','block');
				$("#type11").css('display','block');
				$("#type12").css('display','block');
				
				$("#selectifclass_chosen").css('width','200px');
				$("#selectclass_chosen").css('width','200px');
				$("#selectapp_chosen").css('width','200px');
				
//				$('#selectifclass').find("option[value='yes']").attr("selected",true);
				$("#selectifclass").children("option").remove();
				$("#selectifclass").append('<option value="yes">是</option>');
				$("#selectifclass").append('<option value="no">否</option>');
				$("#selectifclass").trigger("chosen:updated");
				
				$("#selectclass").children("option").remove();
				var classtypetext="";
				$(redata[1]).each(function(i) {
					classtypetext=classtypetext+'<option value="'+this+'">'+this+'</option>'
				});
				$("#selectclass").append(classtypetext);
				$("#selectclass").trigger("chosen:updated");
				
				$("#selectapp").children("option").remove();
				var addoption="";
				$(redata[2]).each(function(i) {
					addoption=addoption+'<option value="'+this.systemId+'">'+this.systemName+'</option>'
				});
				$("#selectapp").append(addoption);
				$("#selectapp").trigger("chosen:updated");
			}
		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});

}

function createapp() {
	if(!$("#applicationForm").valid()) {
		return;
	}
	var appName=$("#appName").val();
	var classname=$("#selectclass").val();
	var sysid=$("#selectapp").val();
	var sysname=$("#selectapp option:selected").text();
	var loginAccount=$("#loginAccount").val();
	var description=$("#description").val();
	var teamId=$("#selectteam option:selected").val();
	var teamname=$("#selectteam option:selected").text();
	var selectifclass=$("#selectifclass option:selected").val();
	$("#createappbutton").attr("disabled",true);

	var userlistid="";
	var usernt="";
	$("#userinfo button[type='button']").each(function() {
		userlistid=userlistid+$(this).attr("userid")+"、";
		usernt=usernt+$(this).attr("loginAccount")+"、";
	});
	var urlStr='./appli/newappcreate';
	$.ajax({
		type:'post',
		url:urlStr,
		data:{
			appName:appName,
			description:description,
			teamId:teamId,
			userlistid:userlistid,
			classname:classname,
			sysname:sysname,
			sysid:sysid,
			selectifclass:selectifclass
		},
		success:function(data) {
			$("#createappbutton").attr("disabled",false);
			if(data=="index") {
				alert('请重新登录!');
			} else if(data=="copy") {
				alert('应用名称重复，请重新输入！');
			} else if(data!=null) {
				$("#successpad").modal("show");
//				$("#successappliname").html(appName);
//				$("#successsystemname").html(sysname);
//				$("#successclassname").html(classname);
				$("#successowner").html(loginAccount);
				$("#successdecrpite").html(description);
				$("#successteamname").html(teamname);
				$("#successalertlist").html(usernt);
			} else {
				alert("操作失败");
			}
		},
		error:function(redata) {
			$("#createappbutton").attr("disabled",false);
			alert("不明原因 失败了。。。。。");
		}
	});
}

function cleanappinfo() {
	$("#appName").val("");
	$("#description").val("");
//     $("#selectteam").trigger("chosen:updated");
	$("#selectteam option:first").prop("selected",'selected');
	$("#userinfo").children("div:gt(0)").remove();

}



function showAddMemberModal() {
	$("#addmember").modal("show");
}

function getapplist(classname) {
	var classname=classname;
	var teamid=$("#selectteam").val();
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./appli/getsysnamelist',
		data:{
			classname:classname,
			teamid:teamid
		},
		success:function(redata) {
			$('.aa').chosen();
			$("#selectapp").children("option").remove();
			var addoption="";
			$(redata).each(function(i) {
				addoption=addoption+'<option value='+this.systemId+'>'+this.systemName+'</option>'
			});
			$("#selectapp").append(addoption);

			$("#selectapp").trigger("chosen:updated");
		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});

}

function addUser() {
	var appName=$("#appName").val();
	var userId=$('input:radio[name=user]:checked').val();
	var teamId=$("#selectteam option:selected").val();
	var loginAccount=$('input:radio[name=user]:checked').attr("loginAccount");
	if(loginAccount==undefined) {
		return;
	}
	var flag=true;
	$("#userinfo").find("button").each(function() {
		if(userId==$(this).attr("userid")) {
			alert("该成员已存在");
			$("#addmember").modal("hide");
			flag=false;
			return;
		}
	});
	if(!flag) {
		return;
	}
	$("#addmember").modal("hide");
	var div='<div class="alert alert-success yy-col-md-2 col-md-2">'
			+'<button class="close" type="button"  userid="'+userId
			+'" loginAccount="'+loginAccount
			+'" onclick="delDUser(this)" >×</button>'+loginAccount
			+'</div>';
	$("#userinfo").append(div);
}

function delDUser(obj) {
	var userId=$(obj).attr("data-userId");
	var loginAccount=$(obj).attr("data-loginAccount");
	$(obj).parent().remove();
	//	$.post("application/authz/del",{
	//		userId :userId
	//	},"json");
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./appli/authz/del',
		data:{
			userId:userId,
			loginAccount:loginAccount
		},
		success:function(redata) {
			if(redata=="OK") {
				alert("删除成功！");
			}
		},
		error:function(redata) {
			alert("不明原因失败了！");
		}
	});
}

function getuserlist(teamid) {
	var teamid=teamid;
	var userid=$("#userid").val();
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./appli/getcuserlist',
		data:{
			teamid:teamid,
			userid:userid
		},
		success:function(redata) {
			if(redata!=null) {
				$("#userinfo").children("div:gt(0)").remove();
				var addoption="";
				$(redata[1]).each(function(i) {
					var div='<div class="alert alert-success yy-col-md-2 col-md-2">'
							+'<button class="close" type="button"  userid="'
							+userId
							+'" onclick="delDUser(this)" >×</button>'
							+loginAccount
							+'</div>';
					addoption=addoption+div
				});
				$("#userinfo").append(addoption);
				$("#userinfo").trigger("chosen:updated");

			} else {
				alert('失败提示','操作失败!');
			}

		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});
}
