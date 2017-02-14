function updatedetail(tid){
	var teamName = $("#teamName").val();
	var teamNameold = $("#teamName").attr("oldname");
	var description = $("#description").val();
	var ifchangename = 'y';
	//改名字为y  不改为n
    if(teamName==teamNameold){
 	   ifchangename = 'n';
    }
    
	$("#updateteambutton").attr("disabled",true);
	var urlStr = './team/editteam';
 	$.ajax({
		type : 'post',
		url  : urlStr,
		data : {
			teamName : teamName,
			description : description,
			tid : tid,
			ifchangename:ifchangename
			},
		success : function(redata) {
			$("#updateteambutton").attr("disabled",false);
			$("#teamName").attr("oldname",teamName);
			if (redata == "OK") {
				 $("#updateteam").modal("show");
				 $("#teamName").val = teamName;
				 $("#description").val = description;
			} else if(redata == "already"){
				alert('团队名字重复！');
			} else {
				alert('操作失误！');
			}
		}
	});	 
}
$(document).ready(function(){
	$("#searchUser").keypress(function(e){
		var key = e.which; //e.which是按键的值 
		if (key == 13) { 
			var username = $("#searchUser").val();
//			$.post("user/search", {
//				keyword: username, 
//				},function(data){
//					if(data.length!=0){
//						$("#userList").empty();
//						data.forEach(function(user){
//							var radio = '<label class="checkbox-inline">'+
//							'<input type="radio" class="i-checks" name="user" value="'+user.userId+'" loginAccount="'+user.loginAccount+'"> '+ user.loginAccount + '</label>';			
//							$("#userList").append(radio);
//						});		
//						$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
//					}else{
//						alert("该模糊查询下无员工!");
//					}
//					
//					
//			},"json");
			$.ajax({
				cache:true,
				type:'post',
				url:'./user/search',
				data:{
					keyword: username,
				},
				success:function(data){
					if(data.length!=0){
						$("#userList").empty();
						data.forEach(function(user){
							var radio = '<label class="checkbox-inline">'+
							'<input type="radio" class="i-checks" name="user" value="'+user.userId+'" loginAccount="'+user.loginAccount+'"> '+ user.loginAccount + '</label>';			
							$("#userList").append(radio);
						});		
						$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
					}else{
						alert("该模糊查询下无员工!");
					}
				},
				error:function(data){
					alert("不明原因失败了！");
				}
			});
		} 
	});
});



function showAddMemberModal(obj){
	$("#addmember").modal("show").attr("data-teamId",$(obj).attr("data-teamId"));
}

function addMember(obj){
	var userId = $('input:radio[name=user]:checked').val();
	var loginAccount = $('input:radio[name=user]:checked').attr("loginAccount");
	var teamId = $("#addmember").attr("data-teamId");
	var mtype = $(obj).attr('mtype');
	if(loginAccount==undefined){
		return;
	}
	$("#addmember").modal("hide");
	$.post("team/authz/add", {
		userId: userId, 
		teamId: teamId,
		mtype: mtype
		},function(data){
			if(data.code!='0'){
				alert(data.msg);
				if(mtype=='a'){
					var div = '<div class="alert alert-success yy-col-md-2 col-md-2">'+
					'<button  class="close" type="button" data-teamId="'+teamId+'" data-userId="'+userId+'" onclick="delDUser(this)" >×</button>'+loginAccount
					'</div>';
					$("#adminmember").append(div);
				}else {
					var div = '<div class="alert alert-success yy-col-md-2 col-md-2">'+
					'<button  class="close" type="button" data-teamId="'+teamId+'" data-userId="'+userId+'" onclick="delDUser(this)" >×</button>'+loginAccount
					'</div>';
					$("#member").append(div);		
				}	
			}else{
				alert(data.msg);
				return;
			}
				
		},"json");
}

function delDUser(obj){
	var teamId = $(obj).attr("data-teamId");
	var userId = $(obj).attr("data-userId");
	var loginAccount = $(obj).attr("data-loginAccount");
	$(obj).parent().remove();
//	$.post("team/authz/del",{
//		teamId : teamId,
//		userId :userId
//	},"json");
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./team/authz/del',
		
		data:{
			teamId : teamId,
			userId :userId
		},
		success:function(data){
			if(data!=null){
				alert("删除成功！");
			}
		},
		error:function(data){
			alert("不明原因失败了！");
		}
	});
}


