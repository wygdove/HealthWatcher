function serviceproedit(){
	
		var serviceid = $("#serviceid").val();
		var servicename = $("#servicename").val();
		var servicenameold = $("#servicenameold").val();
		var servicedescript = $("#servicedescript").val();
		var teamid = $("#teamid").val();
		var hostid = $("#hostid").val();
		var hostip = $("#hostip").val();
		var proname = $("#proname").val();
		var oldproname = $("#proname").attr("oldproname");
		var alerttime = $("#alerttime").val();
		var alerttitle = $("#alerttitle").val();
		var teamname = $("#teaminfo option:selected").text();
		var appname = $("#appname option:selected").text();

	 
		
		var ifchangename = 'y';
		var ifchangeproname = 'y';
		//改名字为y  不改为n
       if(servicenameold==servicename){
    	   ifchangename = 'n';
       } 
       //改端口为y  不改为n
       if(proname==oldproname){
    	   ifchangeproname = 'n';
       } 
		
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './servicepro/serviceproedit',
			data : {
				serviceid:serviceid,
				servicename :servicename,
				teamid:teamid,
				hostid:hostid,
				hostip:hostip,
				teamname:teamname,
				appname:appname,
				proname:proname,
				alerttime:alerttime,
				alerttitle:alerttitle,
				servicedescript:servicedescript,
				ifchangename:ifchangename,
				ifchangeproname:ifchangeproname
				},
			success : function(redata) {
				if (redata == "OK") {
//					alert("修改成功！");
					$("#updatepro").modal("show");
					$("#successservicename").html(servicename);
					$("#successdescription").html(servicedescript);
					$("#successteam").html(teamname);
					$("#successapp").html(appname);
					$("#successhostip").html(hostip);
					$("#successproname").html(proname);
					$("#successalerttime").html(alerttime+"分钟");
					$("#successalerttitle").html(alerttitle);
					$("#servicenameold").val(servicename);
					$("#proname").attr("oldproname",proname);
					 
	 			}  else if(redata=='already'){
					 alert("服务名称已存在！");
				} else  if(redata=='ifcopy'){ 
					 alert("此端口已被监控！");
				} else if(redata=='nodata'){ 
					 alert("此主机未被监控！");
				} else if(redata=='nonum'){ 
					 alert("端口输入不正确！");
				} else {
					 alert("操作失误");
				}
				 
			},
			error:function(redata)
			 {
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}



function serviceitemdelete(){
	
	var serviceid = $("#serviceid").val();
	alert(serviceid+":serviceid");
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './servicepro/serviceitemdelete',
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
		