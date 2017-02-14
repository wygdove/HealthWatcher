function getapplist(teamid){
	
	var teamid = teamid;

	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './appli/getapplist',
		data : {
			teamid:teamid
			},
		success : function(redata) {
			if (redata != null) { 
			  if(redata==0){
				    $("#appinfo").children("option").remove();
				    $("#appinfo").append("");
				    $("#appinfo").trigger("chosen:updated");
				    alert('该团队没有应用，请先创建应用或选择其他团队!');
			    }else{
			    	$("#appinfo").children("option").remove();
					var addoption = "";
					$(redata[1]).each(function (i) {
						addoption = addoption+'<option value='+this.appId+'>'+this.appName+'</option>'
					});
					$("#appinfo").append(addoption);
					$("#appinfo").trigger("chosen:updated");
			    }
 			} else {
				alert('失败提示', '操作失败!');
			}
			 
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
}

function getuserlist(teamid){
	
	var teamid = teamid;
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './appli/getuserlist',
		data : {
			teamid:teamid
			},
		success : function(redata) {
			if (redata != null) { 
		    	$("#userinfo").children("option").remove();
				var addoption = "";
				$(redata[1]).each(function (i) {
					addoption = addoption+'<option value='+this.userId+'>'+this.loginAccount+'</option>'
				});
				$("#userinfo").append(addoption);
				$("#userinfo").trigger("chosen:updated");
 			} else {
				alert('失败提示', '操作失败!');
			}
			 
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
}

function getuser(teamid){
	var teamid = teamid;
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './appli/getuser',
		data : {
			teamid:teamid
			},
		success : function(redata) {
			if (redata != null) { 
				  
		    	$("#user").html('');
				var addoption = "";
				$(redata[1]).each(function (i) {
					addoption = this.loginAccount
				});
				$("#user").append(addoption);
				$("#user").trigger("chosen:updated");
				   
	 		} else {
				alert('失败提示', '操作失败!');
			}
			 
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
}

function updateapplist(){
	var teamId = $("#teaminfo").val();
	var appId = $("#appinfo option:selected").val();
	var userId = $("#userinfo option:selected").val();
	$("#updateapplistbutton").attr("disabled",true);
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url : './appli/appconnection',
		data:{
			teamId : teamId,
			appId : appId,
			userId : userId,
		},
		success:function(redata){
			$("#updateapplistbutton").attr("disabled",false);
			if(redata!=null){
				$("#applihandover").modal("show");
			} else{
				alert('操作失败');
			}
		},
		error:function(redata){
			alert("不明原因 失败了。。。。。");
		}
	});
	
}
