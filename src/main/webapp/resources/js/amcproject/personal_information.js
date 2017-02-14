$().ready(function(){
	 $(".i-checks").iCheck({
         checkboxClass:"icheckbox_square-green",
         radioClass:"iradio_square-green",
     });
		jQuery.validator.addMethod("mobileregex", function(value, element) { // mobile正则:
			return this.optional(element) || /^[0-9]+$/.test(value);//
		}, "手机号格式有误");
		jQuery.validator.addMethod("emailregex", function(value, element) { // email正则:
			return this.optional(element) || /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value);
		}, "邮箱格式有误");
		jQuery.validator.addMethod("truename", function(value, element) { // 中文和任意数字以及字母正则:
			return this.optional(element) || /.*[\d|A-z|\u4E00-\u9FFF]+.*$/.test(value); 
		}, "用户名有误");
		$("#userInfo").validate({
			rules : {
				truename : "required",
				useremail : {
					required : true,
					emailregex : true
				},
				usermobile : {
					maxlength : 14,
					mobileregex : true
				}
			},
			messages : {
				truename : "请填写真实姓名",
				useremail : {
					required : "请填写公司邮箱"
				},
				usermobile : {
					maxlength : "手机号过长"
				}
			}
		});
	});
	 
	function edit(){
		if(!$("#userInfo").valid()){
			return ;
			}

		var username = $("#username").text();
 		var displayname = $("#displayname").val();
 		var emailurl = $("#useremail").val();
 		var iphonenum = $("#usermobile").val();
 		$("#editbutton").attr("disabled",true);
        var myapplist = "";
        var subapplist = "";
    
 		
 		 $("#myapp input[type='checkbox']").each(function(){    
 			 if($(this).is(":checked")){ 
 				myapplist=myapplist+$(this).val()+",";
 	 	 	};
 	 	});
 		 
 		 $("#subapp input[type='checkbox']").each(function(){    
 			 if($(this).is(":checked")){ 
 				subapplist=subapplist+$(this).val()+",";
 	 	 	};
 	 	});
 		 
		$.ajax({
			cache : true,
			async : false,
			type : 'post',
			url  : './person/edit',
			data : {
				displayname:displayname,
				username :username,
				emailurl:emailurl,
				iphonenum:iphonenum,
				myapplist:myapplist,
				subapplist:subapplist
				},
			success : function(redata) {
				$("#editbutton").attr("disabled",false);
				if (redata != null) {
 					 $("#updateAt").text(redata[1]);
					 $("#personalinformation").modal("show");
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
		