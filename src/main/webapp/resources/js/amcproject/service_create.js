function getapplist(teamid){
	
		var teamid = teamid;
		var userid = $("#userid").val();
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './servicemain/getapplist',
			data : {
				teamid:teamid,
				userid:userid
				},
			success : function(redata) {
				if (redata != null) { 
				  if(redata[0]==0){//该team下应用的个数
					    $("#appinfo").children("option").remove();
					    $("#appinfo").append("");
					    $("#appinfo").trigger("chosen:updated");//
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

function showAddDependent(){
	$("#adddependent").modal("show");
}

function createservice(obj){
	 $("#createappbutton").attr("disabled",true);
	var servicename = $("#servicename").val().trim();
	var servicedescript = $("#servicedescript").val().trim();
	var appinfo = $("#appinfo").val().trim();
	var typeinfo = $("#typeinfo").val().trim();
	var timeinfo = $("#timeinfo").val().trim();
	var alarmtitle = $("#alarmtitle").val().trim();
	var teamname = $("#teaminfo option:selected").text();
	var appname = $("#appinfo option:selected").text();
	
	if(typeinfo==0){
		var surl = $("#surl").val().trim();
		var urltype = $("input[type='radio']:checked").attr("id");
		var rightcode = $("#rightcode").val().trim();
		urlservice(typeinfo,servicename,servicedescript,surl,urltype,appinfo,rightcode,timeinfo,alarmtitle,teamname,appname);
	}else if(typeinfo==2){
		var sip = $("#sip").val().trim();
		var sport = $("#sport").val().trim();
		portservice(typeinfo,servicename,servicedescript,sip,appinfo,sport,timeinfo,alarmtitle,teamname,appname);
	}else if(typeinfo==1){
		var sip = $("#sipp").val().trim();
		var sprocess = $("#sprocess").val().trim();
		processservice(typeinfo,servicename,servicedescript,sip,appinfo,sprocess,timeinfo,alarmtitle,teamname,appname);
	} else  if(typeinfo==3){
		var startip = $("#startip").val().trim();
		var sendip = $("#sendip").val().trim();
		connectservice(typeinfo,servicename,servicedescript,startip,appinfo,sendip,timeinfo,alarmtitle,teamname,appname);
	} else if(typeinfo==4){
		var hostip = $("#hostip").val().trim();
		runpaltform(typeinfo,servicename,servicedescript,hostip,appinfo,teamname,appname);
	}else {
		alert("类型未知");
	}
}


function runpaltform(typeinfo,servicename,servicedescript,hostip,appinfo,teamname,appname){
	if(servicename==""||servicename==null||appinfo==""||appinfo==null||hostip==""||hostip==null){
        alert("请填写完整信息！");
        $("#createappbutton").attr("disabled",false);
	}else{
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './servicehost/createservicehostip',
			data : {
				servicename:servicename,
				servicedescript:servicedescript,
				hostip:hostip,
				typeinfo:typeinfo,
				appname:appname,
				appinfo:appinfo
				},
			success : function(redata) {
				$("#createappbutton").attr("disabled",false);
				if(redata == "OK"){
					$("#successrunservicename").html(servicename);
					$("#successrundecript").html(servicedescript);
					$("#successrunteamname").html(teamname);
					$("#successrunappname").html(appname);
					$("#successtype").html(typeinfo);
					$("#successrunhostip").html(hostip);
					$("#successpadrunplatform").modal("show");
				}else if(redata == "nodata"){
					alert("该主机未被监控！");
				}else if(redata == "already"){
					alert("服务名称已存在！");
				}else if(redata == "ifcopy"){
					alert("该应用已经存在该主机上！");
				}
			},
			error:function(redata)
			 {
				 $("#createappbutton").attr("disabled",false);
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}
	 
}


function connectservice(typeinfo,servicename,servicedescript,startip,appinfo,sendip,timeinfo,alarmtitle,teamname,appname){
	if(servicename==""||servicename==null||appinfo==""||appinfo==null||startip==""||startip==null||sendip==null||sendip==""||alarmtitle==null||alarmtitle==""){
        alert("请填写完整信息！");
        $("#createappbutton").attr("disabled",false);
	}else{
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './serviceip/createserviceip',
			data : {
				servicename:servicename,
				servicedescript:servicedescript,
				startip:startip,
				endip:sendip,
				typeinfo:typeinfo,
				alarmtitle:alarmtitle,
				appinfo:appinfo,
				timeinfo:timeinfo
				},
			success : function(redata) {
				$("#createappbutton").attr("disabled",false);
//				alert(redata);
				if(redata=='OK'){
					$("#successltxservicenamepo").html(servicename);
					$("#successltxdecriptpo").html(servicedescript);
					$("#successltxteamnamepo").html(teamname);
					$("#successltxappnamepo").html(appname);
					$("#successtype").html(typeinfo);
					$("#ltxstartip").html(startip);
					$("#endip").html(sendip);
					$("#successltxtime").html(timeinfo+"分钟");
					$("#successltxtitle").html(alarmtitle);
					$("#successpadltx").modal("show");	
				}else if(redata=='already'){
					 alert("服务名称已存在！");
				}else if(redata=='nodata'){
					alert("主机没有被监控！");
				}else if(redata=='ifcopy'){
					alert("发起IP,目标IP已存在！");
				}else {
					 alert("操作失误");
				}
			},
			error:function(redata)
			 {
				 $("#createappbutton").attr("disabled",false);
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}
	 
}


function urlservice(typeinfo,servicename,servicedescript,surl,urltype,appinfo,rightcode,timeinfo,alarmtitle,teamname,appname){
	if(servicename==""||servicename==null||appinfo==""||appinfo==null||surl==""||surl==null||urltype==""||urltype==null||rightcode==null||rightcode==""||alarmtitle==null||alarmtitle==""){
        alert("请填写完整信息！");
        $("#createappbutton").attr("disabled",false);
	}else{
		
		var dependid = "";
		var dependtext = "";
		var ztris = "";
		$("#dependinfo button[type='button']").each(function(){
			dependid=dependid+$(this).val()+"、";
			dependtext=dependtext+$(this).attr("tname")+"、";
			ztris=ztris+$(this).attr("ztri")+"、";
		});
  		
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './serviceweb/createservice',
			data : {
				servicename:servicename,
				servicedescript:servicedescript,
				surl:surl,
				urltype:urltype,
				appinfo:appinfo,
				typeinfo:typeinfo,
				rightcode:rightcode,
				timeinfo:timeinfo,
				alarmtitle:alarmtitle,
				dependids:dependid,
				ztris:ztris
				},
			success : function(redata) {
				$("#createappbutton").attr("disabled",false);
				if(redata=='OK'){
					$("#successservicename").html(servicename);
					$("#successdecript").html(servicedescript);
					$("#successteamname").html(teamname);
					$("#successappname").html(appname);
					$("#successurl").html(surl);
					$("#successurltype").html(urltype);
					$("#successtime").html(timeinfo+"分钟");
					$("#successtitle").html(alarmtitle);
					$("#successdepend").html(dependtext);
					$("#successcode").html(rightcode);
					$("#successpad").modal("show");	
				}else if(redata=='already'){
					 alert("服务名称已存在！");
				}else  {
					 alert("操作失误");
				}
			},
			error:function(redata)
			 {
				 $("#createappbutton").attr("disabled",false);
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}
	 
}


function portservice(typeinfo,servicename,servicedescript,sip,appinfo,sport,timeinfo,alarmtitle,teamname,appname){
	if(servicename==""||servicename==null||appinfo==""||appinfo==null||sip==""||sip==null||sport==null||sport==""||alarmtitle==null||alarmtitle==""){
        alert("请填写完整信息！");
        $("#createappbutton").attr("disabled",false);
	}else{
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './serviceport/createserviceport',
			data : {
			 
				servicename:servicename,
				servicedescript:servicedescript,
				sip:sip,
				appinfo:appinfo,
				typeinfo:typeinfo,
				sport:sport,
				timeinfo:timeinfo,
				alarmtitle:alarmtitle
				},
			success : function(redata) {
 				$("#createappbutton").attr("disabled",false);
				if(redata=='OK'){
 					$("#successservicenamepo").html(servicename);
					$("#successdecriptpo").html(servicedescript);
					$("#successteamnamepo").html(teamname);
					$("#successappnamepo").html(appname);
					$("#successtimepo").html(timeinfo+"分钟");
					$("#successtitlepo").html(alarmtitle);
					$("#sippo").html(sip);
					$("#sportpo").html(sport);
					$("#successpadport").modal("show");	
				}else if(redata=='already'){
					 alert("服务名称已存在！");
				}else  if(redata=='ifcopy'){ 
					 alert("此端口已被监控！");
				}else if(redata=='nodata'){ 
					 alert("此主机未被监控！");
				}else  if(redata=='nonum'){ 
					 alert("端口输入不正确！");
				}else {
			
					 alert("操作失误");
				}
			},
			error:function(redata)
			 {
				 $("#createappbutton").attr("disabled",false);
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}
	 
}



function processservice(typeinfo,servicename,servicedescript,sip,appinfo,sprocess,timeinfo,alarmtitle,teamname,appname){
	if(servicename==""||servicename==null||appinfo==""||appinfo==null||sip==""||sip==null||sprocess==null||sprocess==""||alarmtitle==null||alarmtitle==""){
        alert("请填写完整信息！");
        $("#createappbutton").attr("disabled",false);
	}else{
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './servicepro/createserviceprocess',
			data : {
			 
				servicename:servicename,
				servicedescript:servicedescript,
				sip:sip,
				appinfo:appinfo,
				typeinfo:typeinfo,
				sprocess:sprocess,
				timeinfo:timeinfo,
				alarmtitle:alarmtitle
				},
			success : function(redata) {
 				$("#createappbutton").attr("disabled",false);
				if(redata=='OK'){
  					$("#successservicenamepro").html(servicename);
					$("#successdecriptpro").html(servicedescript);
					$("#successteamnamepro").html(teamname);
					$("#successappnamepro").html(appname);
					$("#successtimepro").html(timeinfo+"分钟");
					$("#successtitlepro").html(alarmtitle);
					$("#sippro").html(sip);
					$("#sprocessname").html(sprocess);
					$("#successpadprocess").modal("show");	
				}else if(redata=='already'){
					 alert("服务名称已存在！");
				}else  if(redata=='ifcopy'){ 
					 alert("此端口已被监控！");
				}else if(redata=='nodata'){ 
					 alert("此主机未被监控！");
				}else {
					 alert("操作失误");
				}
			},
			error:function(redata)
			 {
				 $("#createappbutton").attr("disabled",false);
				alert("不明原因 失败了。。。。。");
			 }
		});
		
	}
	 
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



function delDepend(obj){
	var tid = $(obj).val();
 	$(obj).parent().remove();
}


function cleanappinfo(){
	 $("#servicename").val("");
	 $("#servicedescript").val("");
	 $("#surl").val("");
	 $("#rightcode").val("");
//	 $("#timeinfo").val("");
	 $("#timeinfo option:first").prop("selected", 'selected');
	 $("#urltype").val("");
	 $("#alarmtitle").val("");
	 $("#sport").val("");
	 $("#sipp").val("");
	 $("#startip").val("");
	 $("#sendip").val("");
	 $("#hostip").val("");
	 $("#sip").val("");
	 $("#sprocess").val("");
     $("#teaminfo").trigger("chosen:updated");
     $("#appinfo").trigger("chosen:updated");
     $("#timeinfo").trigger("chosen:updated");
     $("#urltype").trigger("chosen:updated");
    
}

function changetype(typeinfo){
	$("#changediv").empty();
	var divhtml="";
	var dependhtml="";
	dependhtml="<div class='form-group'><label class='col-sm-2 control-label'>服务依赖：</label>"
		      +"<div class='col-sm-9'><div id='dependinfo'></div>"
              +"<button class='btn btn-primary' type='button' onclick='showAddDependent()' >添加依赖</button>   " ;
	var dependlist="";
 	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './servicemain/servicedependlist',
		data : {
			type:typeinfo
			},
		success : function(redata) {
				
				 $(redata).each(function (i) {
					 dependlist = dependlist+"<label class='checkbox-inline'><input  type='radio' name='depend' class='i-checks' value='"
					 +this.triggerId+"' tname='"+this.triggerName+"'  ztri='"+this.zabTriId+"'>"+this.triggerName+"</label>";
					});
		},
		error:function(redata)
		 {
			 
			alert("依赖列表获取失败");
		 }
	});
	$("#dependentList").empty();
	$("#dependentList").html(dependlist);
	dependhtml=dependhtml+"<span style='color: red'>   (备注：当依赖发生故障时，本服务不予告警。)</span></div></div>";     
 	
	if(typeinfo==0){
		 
		divhtml="<div class='form-group'><label class='col-sm-2 control-label'>URL：</label>"
			   +"<div class='col-sm-9'><input id='surl' type='url' class='form-control' name='url'></div></div>"
			   +"<div class='form-group'><label class='col-sm-2 control-label'>内外网：</label>"
               +"<div class='col-sm-9'><div class='radio i-checks' style='margin-left: 1px'>"
               +"<input id='innet' name='net' class='i-checks' urltype='innet' type='radio'> <i></i> 内网          "
               +"<input id='outnet' name='net' class='i-checks' urltype='outnet' type='radio'> <i></i> 外网 </div></div></div>"
               +dependhtml
               +"<div class='form-group'><label class='col-sm-2 control-label'>正确返回码：</label>"
               +"<div class='col-sm-9'>"  
               +"<input id='rightcode' name='rightcode' style='width: 200px' minlength='2' type='text' class='form-control col-sm-4'   aria-required='true' value=''>"
               +"<span class=' col-sm-7' style='color: red'>(备注：当url返回码在正确返回码之外，予以告警)</span></div> </div>";
		
    
	}else if(typeinfo==2){
		 
		divhtml="<div class='form-group'><label class='col-sm-2 control-label'>IP：</label>"
			   +"<div class='col-sm-9'><input id='sip' type='text' class='form-control' name='sip'></div></div>"
               +"<div class='form-group'><label class='col-sm-2 control-label'>端口号：</label>"
               +"<div class='col-sm-9'>"  
               +"<input id='sport' name='sport' style='width: 200px' minlength='2' type='text' class='form-control col-sm-4'   aria-required='true' value=''>"
               +"</div> </div>";
				
		      
	}else if(typeinfo==1){
		 
		divhtml="<div class='form-group'><label class='col-sm-2 control-label'>IP：</label>"
			    +"<div class='col-sm-9'><input id='sipp' type='text' class='form-control' name='sip'></div></div>"
	            +"<div class='form-group'><label class='col-sm-2 control-label'>进程名：</label>"
	            +"<div class='col-sm-9'>"  
	            +"<input id='sprocess' name='sprocess'  type='text' class='form-control col-sm-4'   aria-required='true' value=''>"
	            +"</div> </div>";
		
      
	}else if(typeinfo==3){
		 
		divhtml="<div class='form-group'><label class='col-sm-2 control-label'>发起IP：</label>"
			    +"<div class='col-sm-9'><input id='startip' type='text' class='form-control' name='startip'></div></div>"
	            +"<div class='form-group'><label class='col-sm-2 control-label'>目标IP：</label>"
	            +"<div class='col-sm-9'>"  
	            +"<input id='sendip' type='text' class='form-control' name='sendip'></div></div>"
	            +"</div> </div>";
	}else if(typeinfo==4){
		divhtml="<div class='form-group'><label class='col-sm-2 control-label'>主机IP：</label>"
			    +"<div class='col-sm-9'><input id='hostip' type='text' class='form-control' name='hostip'></div></div>";
	}
	 
	$("#changediv").html(divhtml);
	$(".i-checks").iCheck({
        checkboxClass:"icheckbox_square-green",
        radioClass:"iradio_square-green",
    }); 
}


function get(type){
	 
		
}
