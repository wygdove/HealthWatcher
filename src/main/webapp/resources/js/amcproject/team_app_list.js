function searchappbytname(tid,userid){
	var searchapp = $("#searchapp").val().trim();
	var urlStr = './team/searchappList';
	$
	.ajax({
		cache:true,
		async:false,
		type:'post',
		url:urlStr,
		data:{
			searchapp:searchapp,
			tid:tid,
			userid:userid
		},
		success:function(myapp){
			$("#applist").children("tr").remove();
			$(myapp).each(function (data) {
				if(this.ifmaintenance==true){
					wifmaintenance="维护中";
				}else{
					wifmaintenance="";
				}
				if(this.userId==userid){
					sapptype="设置";
				}else{
					sapptype="";
				}
				if(this.apptype==1){
					apptype="<input type='checkbox' class='js-switch-small' checked disabled/><a class='btn-danger btn-rounded'>被指派</a>"
				} else if(this.apptype==2){
					apptype="<input type='checkbox' class='js-switch-small' checked disabled/><a class='btn-danger btn-rounded'>创建者</a>"
				} else if(this.apptype==0){
					if(this.ifalert==true){
						apptype="<input type='checkbox' userid="+userid+" appid="+this.appId+" class='js-switch-small' checked/>"
					}else{
						apptype="<input type='checkbox' userid="+userid+" appid="+this.appId+" class='js-switch-small'/>"
					}
				}else if(this.apptype==null){
					apptype="<input type='checkbox' userid="+userid+" appid="+this.appId+" class='js-switch-small'/>" 
				}
				$("#applist")
				.append(
						"<tr><td>" 
						+ this.appName
						+ "<a class='btn-danger btn-rounded'>"
						+ wifmaintenance
						+ "</a></td><td>"
						+ this.teamName 
						+ "</td><td>"
						+ this.loginAccount 
						+ "</td><td>"
						+ "<a href='service/serlist?appid="
						+ this.appId
						+ "'>" 
						+ this.count
						+ "&nbsp;&nbsp;&nbsp; <i class='fa fa-search'></i></a></td>"
						+ "<td>"
						+ apptype
						+ "</td>"
						+ "<td><a href='appli/appinfo?appid="
						+ this.appId
						+ "'>详情</a> <a href='appli/appupdateinfo?appid="
						+ this.appId
						+ "'>"
						+ sapptype
						+ "</a></td></tr>");
			});
			 var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch-small'));

             elems.forEach(function(html) {
                 var switchery = new Switchery(html);
             });
		},
		error : function(data) {
			alert("NONO");
		}
	});
}
function changealert(userid,appid,isalert){

	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : './appli/changealert',
		data : {
			userid:userid,
			appid:appid,
			isalert:isalert
			},
		success : function(redata) {
			if(redata=="true"){
				alert("订阅成功");
			} else if(redata=="false"){
				alert("取消成功");
			} else{
				alert("操作失败");
			}
			   
		},
		error:function(redata)
		 {
			alert("不明原因 失败了。。。。。");
		 }
	});
	 
}