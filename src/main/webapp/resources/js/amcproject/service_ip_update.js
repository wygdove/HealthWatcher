function serviceipedit(){
		
		var serviceid = $("#serviceid").val();
		var servicename = $("#servicename").val();
		var servicenameold = $("#servicenameold").val();
		var servicedescript = $("#servicedescript").val();
		var teamid = $("#teamid").val();
		var startip = $("#startip").val();
		var endip = $("#endip").val();
		var alerttime = $("#alerttime").val();
		var alerttitle = $("#alerttitle").val();
		var teamname = $("#teaminfo option:selected").text();
		var appname = $("#appname option:selected").text();
		var oldip = $("#startip").attr("oldip");
		
		var ifchangename = 'y';
		var ifchangestartip = 'y';
		//改名字为y  不改为n
       if(servicenameold==servicename){
    	   ifchangename = 'n';
       } 
       //改端口为y  不改为n
       if(startip==oldip){
    	   ifchangestartip = 'n';
       } 
		
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './serviceip/serviceipedit',
			data : {
				serviceid:serviceid,
				servicename :servicename,
				servicedescript:servicedescript,
				teamid:teamid,
				startip:startip,
				endip:endip,
				teamname:teamname,
				appname:appname,
				alerttime:alerttime,
				alerttitle:alerttitle,
				ifchangename:ifchangename,
				ifchangestartip:ifchangestartip
				},
			success : function(redata) {
				if (redata == "OK") {
//					alert("修改成功！");
					$("#updateconn").modal("show");
					$("#successservicename").html(servicename);
					$("#successdescription").html(servicedescript);
					$("#successteam").html(teamname);
					$("#successapp").html(appname);
					$("#successstartip").html(startip);
					$("#successendip").html(endip);
					$("#successalerttime").html(alerttime+"分钟");
					$("#successalerttitle").html(alerttitle);
				} else if(redata=='nodata'){
					alert("主机未被监控")
				}else if(redata == 'already'){
					alert("服务名称已存在！");
				}else if(redata == 'ifcopy'){
					alert("此主机已被监控！");
				}
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}



function serviceipdelete(){
	
	var serviceid = $("#serviceid").val();
	alert(serviceid+":serviceid");
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './serviceip/serviceipdelete',
		data : {
			serviceid:serviceid
			},
		success : function(redata) {
			if (redata == "OK") {
                alert("删除成功");
 			}  else if (redata == "error") {
                alert('操作失败!');
 			}  else {
				alert('失败提示', '操作失败!');
			}
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
	
}

	