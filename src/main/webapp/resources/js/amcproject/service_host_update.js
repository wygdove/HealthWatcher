function servicehostedit() {
	var serviceid=$("#serviceid").val();
	var servicename=$("#servicename").val();
	var servicenameold=$("#servicenameold").val();
	var servicedescript=$("#servicedescript").val();
	var teamid=$("#teamid").val();
	var teamname=$("#teaminfo option:selected").text();
	var appname=$("#appname option:selected").text();
	var hostid=$("#hostid").val();
	var hostip=$("#hostip").val();
	var ifchangename='y';
	// 改名字为y 不改为n
	if(servicenameold==servicename) {
		ifchangename='n';
	}
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./servicehost/servicehostedit',
		data:{
			serviceid:serviceid,
			servicename:servicename,
			teamid:teamid,
			teamname:teamname,
			appname:appname,
			hostid:hostid,
			hostip:hostip,
			servicedescript:servicedescript,
			ifchangename:ifchangename,
		},
		success:function(redata) {
			if(redata=="OK") {
				// alert("修改成功！");
				$("#updatehost").modal("show");
				$("#successservicename").html(servicename);
				$("#successdescription").html(servicedescript);
				$("#successteam").html(teamname);
				$("#successapp").html(appname);
				$("#successhostip").html(hostip);
				$("#servicenameold").val(servicename);
			} else if(redata=='already') {
				alert("服务名称已存在！");
			} else if(redata=='ifcopy') {
				alert("此主机已在监控中！");
			} else if(redata=='nodata') {
				alert("此主机未被监控！");
			} else {
				alert("操作失误");
			}
		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});

}

function serviceitemdelete() {
	var serviceid=$("#serviceid").val();
	alert(serviceid+":serviceid");
	$.ajax({
		cache:true,
		async:false,
		type:'post',
		url:'./servicemain/serviceitemdelete',
		data:{
			serviceid:serviceid
		},
		success:function(redata) {
			if(redata=="OK") {
				alert("删除成功");
			} else if(redata=="error") {
				alert('操作失败!');
			} else {
				alert('失败提示','操作失败!');
			}
		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});
}