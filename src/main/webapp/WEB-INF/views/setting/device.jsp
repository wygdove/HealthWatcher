<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="resources/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="resources/plugins/bootstraptable/bootstrap-table.css" rel="stylesheet">
<style>
.bootstrap-table .fixed-table-footer tbody>tr>td {
    border: 0px;
}
.fixed-table-body table {
   table-layout: fixed;   
}
.fixed-table-body table>tbody>tr>td { 
    text-overflow: ellipsis;
    -moz-text-overflow: ellipsis;  
    overflow: hidden;
    white-space: nowrap;   
} 
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
                <div class="widget white-bg">
					<div class="row">
						<div class="col-xs-10 text-left">
							<span><big><big>设备管理</big></big></span>
						</div>
						<div class="col-xs-2 text-right">
							<button id="btnadd" class="btn btn-primary">添加设备</button>
						</div>
					</div>
					<div class="row">
						<table id="devicetable"></table>
					</div>
				</div>
			</div>
		</div>
    </div>
    
	<div class="modal inmodal" id="savedmodal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-body" style="height:250px">
					<form class="form-horizontal m-t">
						<div class="form-group" style="display:none">
							<input id="tindex" name="tindex" class="form-control" type="text" value="" style="display:none;">
							<input id="devid" name="devid" class="form-control" type="text" value="" style="display:none;">
						</div>
						<div class="form-group">
	                        <label class="col-sm-3 control-label">设备名称：</label>
	                        <div class="col-sm-5">
	                            <input id="devname" name="devname" class="form-control" type="text" value="">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">设备类型：</label>
	                        <div class="col-sm-5">
	                            <select class="selecter" id="devtype" name="devtype" style="width:205px;">
									<c:forEach items="${devicetypes }" var="dtlist">
										<option data-typedes="${dtlist.deviceTypeDescription }" value="${dtlist.deviceTypeId }">${dtlist.deviceTypeDescription }</option>
									</c:forEach>
								</select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">设备号：</label>
	                        <div class="col-sm-5">
	                            <input id="devflag" name="devflag" class="form-control" type="text" />
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-3 control-label">设备优先级：</label>
	                        <div class="col-sm-5">
	                            <select class="selecter" id="devisdefault" name="devisdefault" style="width:205px;">
									<option value="false">非默认设备</option>
									<option value="true">默认设备</option>
								</select>
	                        </div>
	                    </div>
	            	</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
					<button id="btnad" type="button" class="btn btn-primary">添加</button>
					<button id="btnsd" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/qq-tajs-stats.js"></script>
	<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="resources/plugins/bootstraptable/bootstrap-table.js"></script>
    <script>
    var $dtable=$('#devicetable');
    $(document).ready(function() {
    	$('.selecter').chosen();
    	$("#devtype_chosen").width("205px");
    	$("#devisdefault_chosen").width("205px");
    	inittable();
    	initbtn();
    });
    
    function inittable() {
    	var dict={"dname":"设备名称","dtype":"设备类型","dflag":"设备号","isdefault":"设备优先级"};
    	$dtable.bootstrapTable('destroy');
    	$dtable.bootstrapTable({
    		cache:true,
    		method:'post',
            url:"./setting/getdevicelist", 
            dataType:"json",
            contentType:"application/x-www-form-urlencoded",
    		queryParamsType:"undefined",
    		queryParams:function(params) {
    			var userid='';
    			if(userid==null){return false;}
    			var temp={userid:userid};
    			return temp;
    		},
            onLoadError:function (data) {  
            	$dtable.bootstrapTable('removeAll');
            	alert("数据请求出错！");
            	console.log(data);
            }, 
            formatLoadingMessage:function(){
            	return "请稍等，正在加载中...";
            },
    		classes:"table table-bordered table-hover",
    		toolbar:"#toolbar",
    		editable:true,
    		search:false,
    		showToggle:false,
    		showColumns:false,
    		minimumCountColumns:"3",
    		showPaginationSwitch:false,
    		pagination:true,
    		pageSize:"10",
    		pageList:"[5,10,20,50,100]",
    		showFooter:true,
    		showExport:false,
            exportDataType:"all",
            detailView:false,
            detailFormatter:function detailFormatter(index,row) {
                var html=[];
                $.each(row,function (key,value) {
                	var showvalue='';
                	if(key[0]!='_') {
                		if(key=="isdefault") {
                			showvalue=(value==true)?"默认设备":"非默认设备";
                		} else {
                			showvalue=value;
                		}
                		html.push("<p><b>"+dict[key]+":</b>"+showvalue+"</p>");
                	}
                });
                return html.join('');
            },
            columns:[
    			{field:'dname',title:dict["dname"],sortable:true,align:'left',width:'200px'},
    			{field:'dtype',title:dict["dtype"],sortable:true,align:'left',width:'200px'},
    			{field:'dflag',title:dict["dflag"],sortable:true,align:'left',width:'200px'},
    			{field:'isdefault',title:dict["isdefault"],sortable:true,align:'left',width:'200px',
    				formatter:function(value,row,index) {
    					return (value==true)?"默认设备":"非默认设备";
    				}
    			},
    			{field:'operate',title:'设备操作',align:'center',width:'100px',events:operateEvents,formatter:operateFormatter
                }
    		]
        });
    }
    
    function operateFormatter(value,row,index) {
   		return [
   			'<a class="edit" href="javascript:void(0)" title="编辑该设备">',
   			'<i class="glyphicon glyphicon-edit"></i>',
   			'</a>',
   			'&nbsp;&nbsp',
   			'<a class="remove" href="javascript:void(0)" title="删除该设备">',
   			'<i class="glyphicon glyphicon-remove"></i>',
   			'</a>'
   		].join('');
   	}
    window.operateEvents={
   		'click .edit':function(e,value,row,index) {
   			console.log(row);
   			$("#devid").val(row.deviceid);
   			$("#devname").val(row.dname);
   			$("#devflag").val(row.dflag);
   			$("#tindex").val(index)
   			$("#btnad").hide();
   			$("#btnsd").show();
   			$("#devtype option").removeAttr("selected");  
   			$("#devtype option[data-typedes='"+row.dtype+"']").attr("selected","selected");  
   			$("#devtype").trigger("chosen:updated");
   		    $("#devtype").width("205px");
   			$("#devisdefault option").removeAttr("selected");  
   			$("#devisdefault option[value='"+row.isdefault+"']").attr("selected","selected");  
   			$("#devisdefault").trigger("chosen:updated");
   		    $("#devisdefault_chosen").width("205px");
   			$("#savedmodal").modal("show");
   		},
   		'click .remove':function(e,value,row,index) {
   			// console.log(row);
   			deldevice(row.deviceid);
   		}
   	};
   	
    function initbtn() {
    	$("#btnadd").click(function() {
    		cleardevform();
    		$("#savedmodal").modal("show");
    	});
    	$("#btnad").click(function() {
    		saverequest('add');
    	});
    	$("#btnsd").click(function() {
    		saverequest('update');
    	});
    }
   	
   	function cleardevform() {
   		$("#devid").val('');
   		$("#devname").val('');
		$("#devflag").val('');
		$("#tindex").val('');
		$("#btnad").show();
		$("#btnsd").hide();
		$("#devtype").trigger("chosen:updated");
		$("#devisdefault").trigger("chosen:updated");
		$("#devtype_chosen").width("205px");
	    $("#devisdefault_chosen").width("205px");
   	}
   	
   	function saverequest(operate) {
   		var updateindex=$("#tindex").val(); 
   		var row={
			deviceid:$("#devid").val(),
			dname:$("#devname").val(),
			dtype:$("#devtype").val(),
			dflag:$("#devflag").val(),
			isdefault:$("#devisdefault").val()
        };
   		// console.log(row);
   		$.ajax({
   			type: 'post',
   			url: './setting/savedevice',
   			data: {
   				operate:operate,
   				devid:row.deviceid,
   				devname:row.dname,
   				devtype:row.dtype,
   				devflag:row.dflag,
   				devisdefault:row.isdefault
   			},
   			success:function(redata) {
   				// console.log(redata);
   				if(redata.recode=='success') {
//    					if(operate=='update') {
//    						$dtable.bootstrapTable('updateRow',{index:updateindex,row:row});
//    					}else if(operate=='add') {
//    						row.deviceid=redata.redid;
//    						row.dtype=redata.redtype;
//    						$dtable.bootstrapTable('append',[row]);
//    					}
					$dtable.bootstrapTable('refresh');
   					cleardevform();
   					$("#savedmodal").modal("hide");
   				}
   				else {
   					alert(redata.recode);
   				}
   			},
   			error:function(redata) {
   				console.log(redata);
   			}
   		});
   	}
   	function deldevice(deviceid) {
   		$.ajax({
   			type: 'post',
   			url: './setting/deletedevice',
   			data: {
   				deviceid:deviceid
   			},
   			success:function(redata) {
   				// console.log(redata);
   				if(redata=='success') {
   		   			$dtable.bootstrapTable('remove',{field:'deviceid',values:[deviceid]});
   				}
   				else {
   					alert(redata);
   				}
   			},
   			error:function(redata) {
   				console.log(redata);
   			}
   		});
   	}
		
   	
    </script>
</body>
</html>
