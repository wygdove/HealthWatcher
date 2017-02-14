function searchteam(obj){
	var userid = $(obj).attr('userid');
	var teamtype = $(obj).attr('teamtype');
	var teamName = $(obj).parent().parent().children('input').val();
	var urlStr = './team/searchTeam';
	$
	.ajax({
		cache:true,
		async:false,
		type:'post',
		url:urlStr,
		data:{
			userid:userid,
			teamtype:teamtype,
			teamName:teamName
		},
		success:function(redata){
			$("#"+teamtype).children("tr").remove();
			$(redata).each(function (data) {
				if(this.owner=='o'){
					owner="设置";
				}else{
					owner="";
				}
				$("#"+teamtype)
				.append(
					"<tr><td>"
						+ this.teamName
						+ "</td>"
						+ "<td>"
						+ this.description
						+ "</td>"
						+ "<td><a href='team/appList/?tid="
						+ this.teamId
						+ "'>"
						+ this.count
						+ "&nbsp;&nbsp;&nbsp; <i class='fa fa-search'></i></a></td>"
						+ "<td><a href='team/tdetail/?tid="
						+ this.teamId
						+ "'>详情&nbsp;&nbsp;"
						+ "</a>"
						+ "<a href='team/tedit/?tid="
						+ this.teamId 
						+ "'>"
						+ owner
						+ "</a></td></tr>"
					);
			});
		},
		error : function(data) {
			alert("NONO");
		}
	});
}