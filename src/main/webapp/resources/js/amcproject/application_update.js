$(document).ready(function(){
	$("#searchUser").keypress(function(e){
		var key = e.which; //e.which是按键的值 
		if (key == 13) { 
			var teamid = $("#teamid").val();
			var keyword = $("#searchUser").val();
			 
			$.ajax({
				cache : true,
				async : false,
				type : 'post',
				url  : './appli/addsubslist',
				data : {
					teamid:teamid,
					keyword :keyword
					},
				success : function(redata) {
					if (redata.length != 0) {
						$("#userList").empty();
						redata.forEach(function(user){
                            var radio  =  '<label class="checkbox-inline">'
                                        + '<input type="radio" name = "user" class="i-checks" value="'
                                        + user.userId
                                        + '" loginAccount="'
                                        + user.loginAccount
                                        + '"> '
                                        + user.loginAccount 
                                        + '</label>';            
                            $("#userList").append(radio);
                        });
						$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
		 			} else {
						alert('该模糊查询下无员工!');
					}
					 
				},
				error:function(redata)
				 {
					alert("不明原因 失败了。。。。。");
				 }
			});
		} 
	});
		
});


function updateappbase(){
	var appid = $("#appid").val();
	var appname = $("#appname").val();
	var sysid = $("#selectapp option:selected").val();
	var classid = $("#selectclass option:selected").val();
	var selectclass = $("#selectclass option:selected").text();
	var sysname = $("#selectapp option:selected").text();
	var teamid = $("#teamid").val();
	var decript = $("#decript").val();
	var appnameold = $("#appname").attr("oldname");
	var ifchangename = 'y';
	//改名字为y  不改为n
    if(appname==appnameold){
 	   ifchangename = 'n';
    }
	$("#updateapplibutton").attr("disabled",true);
	var urlStr = './appli/appupdatebase';
	$.ajax({
		type : 'post',
		url : urlStr,
		data : {
			appid : appid,
			appname : appname,
			sysid : sysid,
			classid : classid,
			sysname : sysname,
			selectclass : selectclass,
			teamid : teamid,
			decript : decript,
			ifchangename:ifchangename
		},
		success : function(data){
			$("#updateapplibutton").attr("disabled",false);
			$("#appname").attr("oldname",appname);
			if(data == "OK"){
				$("#updateapplication").modal("show");
			}else if(data == "already"){
				alert("应用名称重复");
			}else if(data == "error"){
				alert("操作失败");
			}
		},
		error:function(data)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
}

function getapplist(classname){

 	
	var classname = classname;
	var teamid = $("#teamid").val();
 	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './appli/getsysnamelist',
		data : {
			classname:classname,
			teamid:teamid
			},
		success : function(redata) {
			   
			    $("#selectapp").children("option").remove();
				var addoption = "";
				$(redata).each(function (i) {
					addoption = addoption+'<option value='+this.systemId+'>'+this.systemName+'</option>'
				});
				$("#selectapp").append(addoption);
				$("#selectapp").trigger("chosen:updated");
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
	
}

function addUser(obj){
	 var userId = $('input:radio[name=user]:checked').val();
	 var loginAccount = $('input:radio[name=user]:checked').attr("loginAccount");

	 var appid = $("#appid").val();
	 $.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './appli/addsubsman',
			data : {
				appid:appid,
				userid :userId
				},
			success : function(redata) {				
				if (redata == "OK") {  
                     var adddiv  =  '<div class="alert alert-success yy-col-md-2  col-md-2"><button aria-hidden="true" class="close" userid="'
                        	           +userId+'" type="button" on click="javascript:deletemainlist(this)">×</button>'+loginAccount+'</div>';            
				     $("#subslist").append(adddiv);
					 $("#addmember").modal("hide");
	 			}   else if(redata == "copy"){
					alert('该成员已经在加收列表里！');
				}   else if(redata == "owner"){
					alert('该成员是创建者不需要指定！');
				}   else{
					alert('失败提示', '操作失败!');
				};
				
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});

}


function updateappmain(obj){
	 
	 var mainid = $("#mainid").val();
	 var start = $("#start").val();
	 var end = $("#end").val();

	 $.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './appli/updatemaintime',
			data : {
				mid:mainid,
				start :start,
				end : end
				},
			success : function(redata) {
				if (redata == "OK") {  
					alert('修改成功！');
	 			}   else if(redata == "no"){
					alert('没有权限 请重新登录！');
				}   else {
					alert('失败提示', '操作失败!');
				};
				
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
}


function deleteappmain(obj){
	 
	 var mainid = $("#mainid").val();	
	 
	 $.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './appli/deletemaintime',
			data : {
				mid:mainid
				},
			success : function(redata) {
				if (redata == "OK") {  
					 var buttontype  =  ' <button class="btn btn-primary" type="button" onclick="javascript:addappmain()">提交维护时间</button>';
					 $("#buttontype").html(buttontype);
					 $("#start").val("");
					 $("#end").val("");
					alert('删除成功！');
	 			}   else if(redata == "no"){
					alert('没有权限 请重新登录！');
				}   else {
					alert('失败提示', '操作失败!');
				};
				
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
}
function deletemainlist(obj){
	 
	 var userid = $(obj).attr("userid");
	 var appid = $("#appid").val();
	 $.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './appli/delsubsman',
			data : {
				userid:userid,
				appid:appid
				},
			success : function(redata) {
				if (redata == "OK") {  
					$(obj).parent().remove();
					alert('删除成功！');
	 			}   else if(redata == "no"){
					alert('没有权限 请重新登录！');
				}   else {
					alert('失败提示', '操作失败!');
				};
			
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
}

function addappmain(obj){
	if(!$("#appliupdate").valid()){
		return ;
	}
	 var appid = $("#appid").val();
	 var start = $("#start").val();
	 var end = $("#end").val();


	 $.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './appli/addmaintime',
			data : {
				appid:appid,
				start:start,
				end:end
				},
			success : function(redata) {
				if (redata[0] == "OK") {  
					 var buttontype  =  ' <button class="btn btn-primary" type="button" onclick="javascript:updateappmain()">修改维护时间</button>'
                                     +  ' <button class="btn btn-primary" type="button" onclick="javascript:deleteappmain()">删除维护时间</button>'; 
					 $("#mainid").val(redata[1]);
					 
                     $("#buttontype").html(buttontype);
					alert('添加成功！');
	 			}   else if(redata[0] == "no"){
					alert('没有权限 请重新登录！');
				}   else {
					alert('失败提示', '操作失败!');
				};
				
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
}

