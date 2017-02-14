function createteam(){
	if(!$("#teamform").valid()){
		return;
	}
	var teamName = $("#teamName").val();
	var description = $("#description").val();
	var userId = $("#userId").val();
	$("#createteambutton").attr("disabled",true);//动态添加属性
	var urlStr = './team/addteam';
 	$.ajax({
		type : 'post',
		url  : urlStr,
		data : {
			teamName : teamName,
			description : description,
			userId : userId
			},
		success : function(redata) {
			$("#createteambutton").attr("disabled",false);
			if(redata == "index"){
				alert('请重新登录!');
			}else if (redata=="copy"){
				alert('团队名称重复，请重新输入');
			}else if (redata=="error"){
				alert('团队公司代码获取失败');
			}else if (redata != null) {
				$("#createnewteam").modal("show");
				$("#successteamName").html(teamName);
				$("#successdescription").html(description);
			} else {
				alert('失败提示', '操作失败!');
			}
		}
	});	 
}

function cancelinfo(){
	$("#teamName").val("");//清空
	$("#description").val("");
}