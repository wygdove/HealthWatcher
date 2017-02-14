function serviceedit(){
	
		var serviceid = $("#serviceid").val();
		var servicename = $("#servicename").val();
		var servicenameold = $("#servicenameold").val();
		var teamid = $("#teamid").val();
		var teamname = $("#teaminfo option:selected").text();
		var appname = $("#appinfo option:selected").text();
		var appid = $("#appinfo option:selected").val();
		var surl = $("#surl").val();
		var urltype = $("input[type='radio']:checked").attr("id");
		var rightcode = $("#rightcode").val();
		var alerttime = $("#alerttime").val();
		var alerttitle = $("#alerttitle").val();
		var servicedescript = $("#servicedescript").val();
		var dependid = "";
		var dependtext = "";
		var ztris = "";
		$("#dependinfo button[type='button']").each(function(){
			dependid=dependid+$(this).val()+"、";
			dependtext=dependtext+$(this).attr("tname")+"、";
			ztris=ztris+$(this).attr("ztri")+"、";
		});
		
		
		
		var ifchangename = 'y';
 		//改名字为y  不改为n
        if(servicenameold==servicename){
    	   ifchangename = 'n';
       }  
        
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './serviceweb/serviceedit',
			data : {
				serviceid:serviceid,
				servicename :servicename,
				teamname:teamname,
				appname:appname,
				surl:surl,
				urltype:urltype,
				rightcode:rightcode,
				alerttime:alerttime,
				alerttitle:alerttitle,
				servicedescript:servicedescript,
				ifchangename:ifchangename,
				appid:appid,
				dependids:dependid,
				ztris:ztris
				},
			success : function(redata) {
				if(redata==null) {
					alert('失败提示', '操作失败!');
				} else if (redata=='OK') {
					$("#updateservice").modal("show");
					$("#successservicename").html(servicename);
					$("#successdescription").html(servicedescript);
					$("#successteam").html(teamname);
					$("#successapp").html(appname);
					$("#successurl").html(surl);
					$("#successurltype").html(urltype);
					$("#successcode").html(rightcode);
					$("#successalerttime").html(alerttime+"分钟");
					$("#successalerttitle").html(alerttitle);
	 			} else if(redata=='already'){
					 alert("服务名称已存在！");
				} else if(redata=='wrong'){
					 alert("数据填写不规范！");
				} else{
					alert('失败提示', redata);
				}
			},
			error:function(redata) {
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}



function servicewebdelete(){
	
	var serviceid = $("#serviceid").val();
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './serviceweb/servicewebdelete',
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


function showAddDependent(){
	$("#adddependent").modal("show");
}

function delDepend(obj){
	var tid = $(obj).val();
 	$(obj).parent().remove();
}


function addDependent(){
	var appName = $("#appName").val();
	var dependval = $('input:radio[name=depend]:checked').val();
	//var teamId = $("#selectteam option:selected").val();
	var dependtext = $('input:radio[name=depend]:checked').attr("tname");
	var ztri = $('input:radio[name=depend]:checked').attr("ztri");
 	if(dependval==undefined){
		return;
	}
	var flag = true;	
	$("#dependinfo").find("button").each(function(){
		if(dependval==$(this).val()){
			alert("该依赖已存在");
			$("#adddependent").modal("hide");
			 flag = false;
			 return;
		}
	});
	if(!flag){
		return;
	}
	$("#adddependent").modal("hide");
	var div = '<div class="alert alert-success yy-col-md-2 col-md-2">'+
	
	'<button class="close" type="button" value="'+dependval+'" onclick="delDepend(this)"  tname="'+dependtext+'"  ztri="'+ztri+'" >×</button>'+dependtext
	'</div>';
	$("#dependinfo").append(div);
}
	