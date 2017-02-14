function addsuggestion(){
	if(!$("#suggestion").valid()){
		return ;
	}
	var message = $("#message").val();
	var urlStr = './suggestion/sinfo';
	$("#suggest").modal("hide");
	$.ajax({
		type : 'post',
		url  : urlStr,
		data : {
			message : message
		},
		success : function(redata) {
			if(redata == "index"){
				alert('请重新登录!');
			}else if(redata=="copy"){
				alert('反馈意见重复，请重新输入！');
			}else if (redata != null) {
				$("#addmessage").modal("show");
			} else {
				alert('失败提示', '操作失败!');
			}
		}
	});	 
}