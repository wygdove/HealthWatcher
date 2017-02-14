function exitshow() {
	$("#charttitle").html('');
	$("#chartmain").html('');
	$("#chartmain").data("itemid","none");
	$("#chartmain").data("itemtype","none");
}

function getchartdata(itemid) {
	$("#charttitle").html('<b>过去一小时数据</b>');
	gethistorylist(itemid,'1hour','history');
}
function getchartuintdata(itemid) {
	$("#charttitle").html('<b>过去一小时数据</b>');
	gethistorylist(itemid,'1hour','historyuint');
}

function get1hchartdata() {
	$("#charttitle").html('<b>过去一小时数据</b>');
	var itemid=$("#chartmain").data("itemid");
	var type=$("#chartmain").data("itemtype");
	gethistorylist(itemid,'1hour',type);
}
function get1dchartdata() {
	$("#charttitle").html('<b>过去一天数据</b>');
	var itemid=$("#chartmain").data("itemid");
	var type=$("#chartmain").data("itemtype");
	gethistorylist(itemid,'1day',type);
}


function gethistorylist(itemid,interval,type) {
//	console.log(itemid+","+interval+","+type);
	$("#chartmain").data("itemid",itemid);
	$("#chartmain").data("itemtype",type);

	var chartsurl='charts/historylist';
	if(type=='history') {
		chartsurl='charts/historylist';
	} else if(type=='historyuint') {
		chartsurl='charts/historyuintlist';
	}
	$.ajax({
		cache : true,
		async : false,
		type : 'post',
		url  : chartsurl,
		data : {
			itemid: itemid,
			interval: interval
		},
		success : function(redata) {
//			console.log(redata);
			//interval=1hour redata.length=30
			//interval=1day  redata.length=48
			var dataxAxis=[];
			var dataseries=[];
			if(type=='history') {
				$(redata).each(function (data) {
					dataxAxis.push(this.f_clock);
					dataseries.push(this.value);
				});
				showchart(dataxAxis,dataseries);
			} else if(type=='historyuint') {
				$(redata).each(function (data) {
					dataxAxis.push(this.clock);
					dataseries.push(this.value);
				});
				showmemchart(dataxAxis,dataseries);
			}
		},
		error:function(redata) {
			alert("不明原因 失败了。。。。。");
		}
	});
}

function showchart(dataxAxis,dataseries) {
	var myChart=echarts.init(document.getElementById("chartmain"));
	option={
	    tooltip : {trigger: 'axis'},
	    grid: {
	        left:'5%',right:'5%',bottom:'5%',top:'5%',
	        containLabel: true
	    },
	    xAxis: [{
            type: 'category',
            boundaryGap : false,
            data: dataxAxis
        }],
	    yAxis: [{type :'value'}],
	    series: [{
            name:'值',
            type:'line',
            label:{normal:{show:true,position:'top'}},
            itemStyle:{normal:{color:'#000'}},
            areaStyle:{normal:{color:'#fff'}},
            data:dataseries
        }]
	};
	myChart.setOption(option);
	$("#chartshow").modal("show");
}

function showmemchart(dataxAxis,dataseries) {
	var myChart=echarts.init(document.getElementById("chartmain"));
	option={
		tooltip : {
			trigger: 'axis',
			formatter: function(params, ticket, callback) {
				var res=formatDate(params[0].name);
				if(res!=null&&res!='') {
					res+='<br/>';
				} else {
					res='';
				}
				res +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[0].color+'"></span>'
					+params[0].seriesName+':'+formatSize(params[0].value);
				return res;
			}
		},
		grid: {
			left:'5%',right:'5%',bottom:'5%',top:'5%',
			containLabel: true
		},
		xAxis: [{
			type: 'category',
			boundaryGap : false,
			axisLabel: {
				formatter: function (value, index) {
					return formatDate(value);
				}
			},
			data: dataxAxis
		}],
		yAxis: [{
			type :'value',
			axisLabel: {
				formatter: function (value, index) {
					return formatSize(value);
				}
			},
		}],
		series: [{
			name:'值',
			type:'line',
			label:{normal:{
				show:true,position:'top',
				formatter: function (params) {
					return formatSize(params.value);
				}
			}},					
			itemStyle:{normal:{color:'#000'}},
			areaStyle:{normal:{color:'#fff'}},
			data: dataseries
		}]
	};
	myChart.setOption(option);
	$("#chartshow").modal("show");
}

function formatSize(value) {
	if(value==null||value=='')return '-';
	value=parseInt(value);
	var units=["B","KB","MB","GB","TB"];
	var index=0;
	while(value>=1024&&index<5) {
		value/=1024;
		index++;
	}
	return value.toFixed(2)+" "+units[index];
}
function formatDate(timestamp) { 
	if(timestamp==null||timestamp=='')return timestamp;
	timestamp=''+timestamp;
	if(timestamp.length==10) timestamp=timestamp+'000';
	var date=new Date(parseInt(timestamp));
	var year=date.getFullYear();
	var month=date.getMonth()+1; 
	var day=date.getDate(); 
	return year+"/"+month+"/"+day+" "+date.toTimeString().substr(0,8); 
} 
