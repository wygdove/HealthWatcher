function searchappbyname(obj) {
	var userid = $(obj).attr("userid");
	var searchtype = $(obj).attr("searchtype");
	var btnid = $(obj).attr("btnid");
	var appname = $(obj).parent().parent().children("input").val();
	$
			.ajax({
				cache : true,
				async : false,
				type : 'post',
				url : './appli/searchbyname',
				data : {
					appname : appname,
					userid : userid,
					searchtype : searchtype

				},
				success : function(redata) {
					$("#" + searchtype).children("tr").remove();

					$(redata)
							.each(
									function(data) {
										if (this.ifmaintenance == true) {
											wifmaintenance = "维护中";
										} else {
											wifmaintenance = "";
										}
                                      
 										if (this.userId == userid) {
											sapptype = "设置";
										} else {
											sapptype = "";
										}

										if (this.apptype == 1) {
											apptype = "<input type='checkbox' class='js-switch-small "
													+ searchtype
													+ "' checked disabled/><a class='btn-danger btn-rounded'>被指派</a>"
										} else if (this.apptype == 2) {
											apptype = "<input type='checkbox' class='js-switch-small "
													+ searchtype
													+ "' checked disabled/><a class='btn-danger btn-rounded'>创建者</a>"
										} else if (this.apptype == 0) {
											if (this.ifalert == true) {
												apptype = "<input type='checkbox' userid="
														+ userid
														+ " appid="
														+ this.appId
														+ " class='js-switch-small "
														+ searchtype
														+ "'  checked/>"
											} else {
												apptype = "<input type='checkbox' userid="
														+ userid
														+ " appid="
														+ this.appId
														+ " class='js-switch-small "
														+ searchtype + "' />"
											}
										} else if (this.apptype == null) {

											apptype = "<input type='checkbox' userid="
													+ userid
													+ " appid="
													+ this.appId
													+ " class='js-switch-small "
													+ searchtype + "'/>"

										}
										$("#" + searchtype)
												.append(
														"<tr><td>"
																+ this.appName
																+ "<a class='btn-danger btn-rounded'>"
																+ wifmaintenance
																+ "</a></td>"
																+ "<td>"
																+ this.teamName
																+ "</td>"
																+ "<td>"
																+ this.owner
																+ "</td>"
																+ "<td><a href='service/serlist?appid="
																+ this.appId
																+ "'>"
																+ this.servicenum
																+ "&nbsp;&nbsp;&nbsp;<i class='fa fa-search'></i></a></td>"
																+ "<td>"
																+ apptype
																+ "</td>"
																+ "<td>"
																+ "<a href='appli/appinfo?appid="
																+ this.appId
																+ "'>详情</a>"
																+ "<a href='appli/appupdateinfo?appid="
																+ this.appId
																+ "'>"
																+ sapptype
																+ "</a></td></tr>");
									});
					$("#"+btnid).children().remove();
					var elems = Array.prototype.slice.call(document
							.querySelectorAll('.' + searchtype));

					elems.forEach(function(html) {
						var switchery = new Switchery(html);
					});
				},
				error : function(data) {
					alert("操作失误");
				}
			});
}
function changealert(userid, appid, isalert) {

	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url : './appli/changealert',
		data : {
			userid : userid,
			appid : appid,
			isalert : isalert
		},
		success : function(redata) {
			if (redata == "true") {
				alert("订阅成功");
			} else if (redata == "false") {
				alert("取消成功");
			} else {
				alert("操作失败");
			}

		},
		error : function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});

}

function pagechange(obj) {
	var pagenum = $(obj).attr("pagenum");
	var btnid = $(obj).attr("btnid");
	var appstype = $(obj).parent().children(".page").attr("apptype");
 
	var userid = $(obj).attr("userid");
	$
			.ajax({
				cache : true,
				async : false,
				type : 'post',
				url : './appli/applistpage',
				data : {
					pagenum : pagenum,
					appstype : appstype
				},
				success : function(redata) {
					$("#" + appstype).children("tr").remove();

					$(redata.list)
							.each(
									function(data) {
										if (this.ifmaintenance == true) {
											wifmaintenance = "维护中";
										} else {
											wifmaintenance = "";
										}

										if (this.userId == userid) {
											sapptype = "设置";
										} else {
											sapptype = "";
										}
 										if (this.apptype == 1) {
											apptype = "<input type='checkbox' class='js-switch-small "
													+ appstype
													+ "' checked disabled/><a class='btn-danger btn-rounded'>被指派</a>"
										} else if (this.apptype == 2) {
											apptype = "<input type='checkbox' class='js-switch-small "
													+ appstype
													+ "' checked disabled/><a class='btn-danger btn-rounded'>创建者</a>"
										} else if (this.apptype == 0) {
											if (this.ifalert == true) {
												apptype = "<input type='checkbox' userid="
														+ userid
														+ " appid="
														+ this.appId
														+ " class='js-switch-small "
														+ appstype
														+ "'  checked/>"
											} else {
												apptype = "<input type='checkbox' userid="
														+ userid
														+ " appid="
														+ this.appId
														+ " class='js-switch-small "
														+ appstype + "' />"
											}
										} else if (this.apptype == null) {

											apptype = "<input type='checkbox' userid="
													+ userid
													+ " appid="
													+ this.appId
													+ " class='js-switch-small "
													+ appstype + "'/>"

										}
										$("#" + appstype)
												.append(
														"<tr><td>"
																+ this.appName
																+ "<a class='btn-danger btn-rounded'>"
																+ wifmaintenance
																+ "</a></td>"
																+ "<td>"
																+ this.teamName
																+ "</td>"
																+ "<td>"
																+ this.owner
																+ "</td>"
																+ "<td><a href='service/serlist?appid="
																+ this.appId
																+ "'>"
																+ this.servicenum
																+ "&nbsp;&nbsp;&nbsp;<i class='fa fa-search'></i></a></td>"
																+ "<td>"
																+ apptype
																+ "</td>"
																+ "<td>"
																+ "<a href='appli/appinfo?appid="
																+ this.appId
																+ "'>详情</a>&nbsp;&nbsp;"
																+ "<a href='appli/appupdateinfo?appid="
																+ this.appId
																+ "'>"
																+ sapptype
																+ "</a></td></tr>");
									});
					$("#"+btnid).children().remove();
					var up = "";
					var down = "";
					if(redata.pageNum!=1){
						pageupnum=redata.pageNum-1;
						up = "<button type='button' class='btn btn-white' pagenum="+pageupnum+"  btnid="+btnid+" userid="+userid+" onclick='pagechange(this)'><i class='fa fa-chevron-left'></i></button>";
					};
					if(redata.pageNum<redata.pages){
						pagedown=redata.pageNum+1;
						down = "<button type='button' class='btn btn-white' pagenum="+pagedown+"  btnid="+btnid+" userid="+userid+" onclick='pagechange(this)'><i class='fa fa-chevron-right'></i></button>";
					};
					var pagediv = "<button class='btn btn-white page'  apptype='"+appstype+"'>"+ redata.pageNum+"</button>";
					var total="<button type='button' class='btn btn-white'>共"+redata.pages+"页 </button>";
					$("#"+btnid).html(up+pagediv+down+total);
					
					var elems = Array.prototype.slice.call(document
							.querySelectorAll('.' + appstype));

					elems.forEach(function(html) {
						var switchery = new Switchery(html);
					});
				},
				error : function(data) {
					alert("操作失误");
				}
			});
}