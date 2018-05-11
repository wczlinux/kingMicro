$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/log/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 30, key: true },
			{ label: '用户名', name: 'username', width: 30 }, 			
			{ label: '用户操作', name: 'operation', width: 50 }, 			
			{ label: '请求方法', name: 'method', width: 80 }, 			
			{ label: '请求参数', name: 'params', width: 80 },
			{ label: '返回结果', name: 'result', width: 100 },
			{ label: '执行状态', name: 'status', width: 40 },
          /*  { label: '执行时长(毫秒)', name: 'time', width: 80 },*/
			{ label: 'IP地址', name: 'ip', width: 50 }, 			
			{ label: '创建时间', name: 'createDate', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
        pager: "#jqGridPager",
        jsonReader : {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			key: null
		},
	},
	methods: {
		query: function () {
			vm.reload();
		},
		reload: function (event) {
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			var keyParam = new Array();
		//	debugger
			keyParam.push('username');
			keyParam.push('status');
			keyParam.push('operation');
			keyParam.push('method');
			var jsonString = JSON.stringify(keyParam);
			$("#jqGrid").jqGrid('setGridParam',{ 
				postData:{'searchKey': vm.q.key,'keyParam':jsonString},
                page:page
            }).trigger("reloadGrid");
		}
	}
});