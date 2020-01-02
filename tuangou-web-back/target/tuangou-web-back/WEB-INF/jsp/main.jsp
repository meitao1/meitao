<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台首页</title>
<!-- 在页面上引入jqeryeasyui的 css和js -->
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"	charset="utf-8"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<script type="text/javascript" charset="utf-8">
	$(function() {
		//定义的json数组作为动态树形菜单数据
		//var treeData = [{text : "功能菜单"}];
		//var treeData = [{"children":[{"attributes":{"url":""},"text":"角色管理"},{"attributes":{"url":""},"text":"用户管理"},{"attributes":{"url":""},"text":"权限管理"}],"text":"系统管理"},{"children":[{"attributes":{"url":"<iframe width='100%' height='100%' frameborder='0' src='http://localhost:8080/showAddP' style='width:100%;height:100%;margin:0px 0px;'></iframe>"},"text":"添加商品"},{"attributes":{"url":"<iframe width='100%' height='100%' frameborder='0' src='http://localhost:8080/product/all' style='width:100%;height:100%;margin:0px 0px;'></iframe>"},"text":"商品列表"},{"attributes":{"url":""},"text":"热销商品"}],"text":"商品管理"},{"children":[{"attributes":{"url":""},"text":"订单信息"},{"attributes":{"url":""},"text":"问题订单"}],"text":"销售管理"},{"children":[{"attributes":{"url":""},"text":"商家列表"}],"text":"商家管理"}];
	<%-- <%
   		String json = (String) request.getAttribute("jsons");
    %>
		var treeData = <%=json%>;
		creaTtree(treeData); --%>
		
		 $.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'getpri',
			data : 'roleId=${user.role.roleId}',
			success : function(responseData,status,xhr){
				console.info("ajax请求成功！");
				console.info(responseData);
				creaTtree(responseData);
			},
			error : function(error){
				console.info("错了！");
				console.info(error);

			}
		});
		//实例化树形菜单
		function creaTtree(treeData) {
			$("#tree").tree({//easyui 的 api,将ul渲染成树状结构目录
				data : treeData, //树要用的json格式的参数
				lines : true,
				onClick : function(node) {//node是json的元素节点
					if (node.attributes) {
						Open(node.text, node.attributes.url);//调用了一个Open函数，打开标签页
					}
				}
			});
		}
		//在右边center区域打开菜单，新增tab
		function Open(text, url) {
			if ($("#tabs").tabs('exists', text)) {
				$('#tabs').tabs('select', text);
			} else {
				//var content = '<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#tabs').tabs('add', {
					title : text,
					closable : true,
					content : url,//获取树组件中json中的attributes中的url内容
					loadingMessage : "我很努力的加载中....",
				//href:url
				});
			}
		}

		//绑定tabs的右键菜单
		$("#tabs").tabs({
			onContextMenu : function(e, title) {
				e.preventDefault();
				$('#tabsMenu').menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data("tabTitle", title);
			}
		});

		//实例化menu的onClick事件
		$("#tabsMenu").menu({
			onClick : function(item) {
				CloseTab(this, item.name);
			}
		});

		//几个关闭事件的实现
		function CloseTab(menu, type) {
			var curTabTitle = $(menu).data("tabTitle");
			var tabs = $("#tabs");

			if (type === "close") {
				tabs.tabs("close", curTabTitle);
				return;
			}

			var allTabs = tabs.tabs("tabs");
			var closeTabsTitle = [];

			$.each(allTabs, function() {
				var opt = $(this).panel("options");
				if (opt.closable && opt.title != curTabTitle
						&& type === "Other") {
					closeTabsTitle.push(opt.title);
				} else if (opt.closable && type === "All") {
					closeTabsTitle.push(opt.title);
				}
			});

			for (var i = 0; i < closeTabsTitle.length; i++) {
				tabs.tabs("close", closeTabsTitle[i]);
			}
		}
	});
</script>

</head>
<body>
	<div id="cc" class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',title:'网页头部',split:true"
			style="height: 100px;">
			<p align="center" style="font-size: 20px">${user.role.roleId}${user.role.roleName}[${user.userName}]欢迎光临，美淘网！</p></div>
		<div data-options="region:'south',title:'网页底部',split:true"
			style="height: 100px;">
			<p align="center" style="font-size: 15px">Copyright ©2019 武汉美淘团购科技有限公司 版权所有 京ICP备15057271号 京公网安备11010802017390号  问题反馈：ke@kgc.cn</p>
			</div>
		<div data-options="region:'west',title:'系统功能',split:true"
			style="width: 200px;">
			<!-- 树形结构的功能列表 -->
			<ul id="tree"></ul>
		</div>
		<div data-options="region:'center'" style="background: #eee;">
			<div class="easyui-tabs" data-options="fit:true" border="false" id="tabs">
				<div title="后台中心" style="padding: 20px;" data-options="iconCls:'icon-reload',closable:true"
					style="padding: 20px;">欢迎管理员进入美淘网后台中心！</div>
			</div>
		</div>
	</div>
</body>
</html>