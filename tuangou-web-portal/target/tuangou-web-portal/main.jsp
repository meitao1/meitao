<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>美淘网首页</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<!-- 
		 /* $.ajax({
			type : 'get',
			dataType : 'json',
			url : 'gethot',
			success : function(data){
				var str="";
				alert(data);
		        $.each(data,function(i,obj){
		        	str = str +'<dl><dt><a href="#"><img src="images/'+obj.picture+
		        	'"/></a></dt><dd class="name">'+obj.title+
		        	'</dd><dd>'+obj.productdesc+
		        	'</dd><dd><span class="discount">¥'+obj.originalprice+
		        	'</span>门店价<span class="price">¥'+obj.currentprice+
		        	'</span></dd></dl>'
		        	
		        	
		        	/* str = str + '<dl><dt><a href="#"><img src="images/'+obj.picture+
		        	'"/></a></dt><dd class="name">'+obj.title+
		        	'</dd><dd>'+obj.productdesc+
		        	'</dd><dd><span class="discount">¥'+obj.originalprice+
			        '</span> 门店价<span class="price">¥'+obj.currentprice+'</span></dd></dl>' */
		        });
		        $("#pjson").html(str);
				
			},
			error : function(error){
				alert("请求失败！");

			}
		});  */ -->
<script type="text/javascript">

$(function(){
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : 'http://localhost:8081/httpclient',
		success : function(data){
			var str="";
			alert(data);
	        $.each(data,function(i,obj){
	        	str = str +'<dl><dt><a href="#"><img src="images/'+obj.picture+
	        	'"/></a></dt><dd class="name">'+obj.title+
	        	'</dd><dd>'+obj.productdesc+
	        	'</dd><dd><span class="discount">¥'+obj.originalprice+
	        	'</span>门店价<span class="price">¥'+obj.currentprice+
	        	'</span></dd></dl>'
	        	
	        	
	        	/* str = str + '<dl><dt><a href="#"><img src="images/'+obj.picture+
	        	'"/></a></dt><dd class="name">'+obj.title+
	        	'</dd><dd>'+obj.productdesc+
	        	'</dd><dd><span class="discount">¥'+obj.originalprice+
		        '</span> 门店价<span class="price">¥'+obj.currentprice+'</span></dd></dl>' */
	        });
	        $("#pjson").html(str);
			
		},
		error : function(error){
			alert("请求失败！");

		}
});

	/* $(function(){
		alert("asdsa");
		
		$.ajax({
			type : 'get',
			dataType : 'jsonp',//数据类型为jsonp
			jsonp : "jsonpCallback",//服务端用于调用的function名的参数
			url : 'http://localhost:8080/product/list2',
			success : function(data){
				var str="";
				alert(data);
		        $.each(data,function(i,obj){
		        	str = str +'<dl><dt><a href="#"><img src="images/'+obj.picture+
		        	'"/></a></dt><dd class="name">'+obj.title+
		        	'</dd><dd>'+obj.productdesc+
		        	'</dd><dd><span class="discount">¥'+obj.originalprice+
		        	'</span>门店价<span class="price">¥'+obj.currentprice+
		        	'</span></dd></dl>'
		       	
		        });
		        $("#pjson").html(str);
				
			},
			error : function(error){
				alert("请求失败！");

			}
		}); 
		
		
	}); */
</script>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#nav, #mtop, #mbottom {
	width: 985px;      /*内容固定宽度*/
	margin: 0px auto;  /*固定宽度且居中*/
}
#middle #allnav {
	width: 100%;    /*自适应宽度，占据整个屏幕*/
	height: 39px;
	background-color: #ff7701;
}
/*中间导航*/
#middle #nav {
	height: 39px;
}
#nav ul li {
	float: left;
}
#nav ul li a {
	float: left;  /*兼容ie6*/
	padding: 0px 16px;
	height: 39px;
	line-height: 39px;
	display: block;
	font-weight: bold;
	font-size: 15px;
	color: white;
}
#nav ul li a:hover {
	background-color: #ff8c00
}
#nav ul li a.category {
	background-image: url(images/arrow-down.gif);
	background-repeat: no-repeat;
	background-position: right;
}
/*中间的上面*/
#mtop {
	overflow: hidden;  /*解决浮动塌陷*/
	margin-bottom: 4px;/*下外边距 和中下保持4px的间隔*/
}
/*导航菜单的二级菜单用到定位*/
#nav ul li.menuList {
	position: relative;
}
#nav ul li.menuList ul {
	background-color: #ff7701;
	text-align: center;
	top: 39px;  /*脱离原文档流*/
	left: 0px;
	position: absolute;
	width: 123px;
}
#nav ul li ul li {
	float: none;
}
#nav ul li ul li a {
	float: none
}
/*占位符*/
#mtop #navlist {
	float: left;
	width: 121px;
	height: 271px;
	border: 1px solid #963;
	margin-right: 5px;  /*右外边距*/
}
#mtop #content {
	float: left;
	width: 850px;
	height: 273px;
}
/*分类搜索*/
#mtop #content #typesearch {
	height: 54px;/* border:1px solid #03F;*/
}
#mtop #content #typesearch ul {
	clear: both;
}
#mtop #content #typesearch ul li {
	float: left;
	margin: 0px 12px;  /*水平方向利用外边距调开项的间隔*/
	height: 27px;      /*垂直方向利用行高调开项的间隔*/
	line-height: 27px;
}
#mtop #content #typesearch ul li.title {
	font-weight: bold;
	font-size: 13px;
}
#mtop #content #typesearch ul li.title span {
	width: 16px;
	height: 17px;
	display: block;
	background-image: url(images/icon.gif);
	float: left;
	margin-top: 5px;   /*背景和文字对齐*/
}
#mtop #content #typesearch ul li.title span.business {
	background-position: 0px -21px;
}
/*本周精选*/						  
#mtop #content #week {
	height: 214px;/* border:1px solid #F00;*/
}
#mtop #content #week p {
	font-weight: bold;
	font-size: 13px;
	height: 32px;
	line-height: 32px;
	margin: 0px 12px;  /*和分类搜索的标题在垂直方向对齐*/
}
#week p span {
	width: 16px;
	height: 17px;
	display: block;
	background-image: url(images/icon.gif);
	float: left;
	background-position: 0px -64px;
	margin-top: 5px;   /*背景和文字对齐*/
}
#week p span.weekicon {
	background-position: 0px -45px;
}

#week ul li {
	float: left;
}
/*团购精选*/
#mbottom #goods {
	width: 735px;
	float: left;/*height:500px;*//* border:1px solid #C0C;*/                
}
#mbottom #goods p {
	font-weight: bold;
	font-size: 13px;
	height: 32px;
	line-height: 32px;
}
#mbottom #goods p span {
	width: 16px;
	height: 17px;
	display: block;
	background-image: url(images/icon.gif);
	float: left;
	background-position: 0px -64px;
	margin-top: 5px;   /*背景和文字对齐*/
}
#mbottom #goods dl {
	float: left;
	width: 350px;
	height: 320px;
	border: 1px solid #CCC;
	margin-right: 6px;
	margin-bottom: 8px;
}
#mbottom #goods dl dd {
	line-height: 25px;
	padding-left: 17px;  /*文字离边框17*/
}
#mbottom #goods dl dd.name {
	font-weight: bold;
	font-size: 13px
}
/*价格*/
#goods dl dd span.discount {
	color: orange;
	font: bold 16px Verdana, Geneva, sans-serif;
}
#goods dl dd span.price {
	text-decoration: line-through;
}
/*带透明效果的文字特效*/
#goods dl dt.dtTxt {
	position: relative;
}
#goods dl dt.dtTxt p {
	height: 30px;
	width: 350px;
	background-color: black;
	font: bold 14px Verdana, Geneva, sans-serif;
	color: white;
	position: absolute;
	top: 182px;
	left: 0px;
	text-align: center;
	filter: alpha(opacity=50);  /*ie能识别的滤镜效果*/
	opacity: 0.5;  /*火狐能识别的滤镜效果*/
	border-left: 1px solid #CCC;
	border-right: 1px solid #CCC;
	display: none;
}
#goods dl dt.dtTxt:hover p {
	display: block;
}
/*侧边栏*/
#mbottom #side {
	width: 240px;
	float: right;
	/*height: 500px;*/
	/*border: 1px solid #6F9;*/
	margin-top: 33px;   /*和团购精选的图片垂直对齐，而不是和团购精选的标题*/
}
/*侧边栏每个专题的标题*/
#side h2 {
	height: 40px;
	line-height: 40px;
}
/*热门专题*/
#side #hottopic h2 {
	padding-left: 17px;
}
#side #hottopic {
	border: 1px solid #CCC;
	margin-bottom: 14px;
}
/*热卖排行榜*/
#side #hotbuy {
	padding-left: 17px;
	border: 1px solid #CCC;
	padding-right: 17px;
	margin-bottom: 14px; /*和下个专题的垂直间隔*/
}
#side #hotbuy dl {
	border-bottom: 1px dashed #ccc;
	margin-bottom: 11px;  /*每个商品垂直的间距*/
}
#side #hotbuy dl.last {
	border: none;  /*最后一个热门商品没有下边框*/
}
#hotbuy dd {
	line-height: 24px;  /*文字垂直间隔*/
}
#hotbuy dd span {
	font: bold 20px Verdana, Geneva, sans-serif;
	color: orange;
}
/*0元抽奖*/
#side #price {
	
	background-image: url(images/pricebg.JPG);
	height: 86px;    /*156-70*/
    padding-top:70px;
	padding-left:70px;
	margin-bottom: 14px;
}

#side #price a {
	color: red;
}
#side #price a:hover {
	text-decoration: underline;
}

#price ul{
		   height:66px;
		   overflow:hidden;
		   	      
}
#price ul li{
              line-height:22px;
			  height:22px;
}

/*最近浏览*/
#side #lastview{
	border: 1px solid #CCC;
	padding-left: 17px;
	padding-right:17px;
}
#side #lastview h2{ float:left; 
                    
}
/*清空*/
#side #lastview p{float:right;
                  height:40px;
				  line-height:40px; /*和标题垂直对齐*/
}
#lastview dl{
	clear:both;
	border-bottom:1px dashed #ccc;
	width:200px;
	height:70px;
	margin-bottom:11px; /*每个浏览过的商品垂直间隔*/
}
#lastview dl dt{
	             float:left;
			     margin-right:10px; /*图片和文字水平间隔*/	 
}
#lastview dl dd{
	              height:25px;
				  line-height:25px;
}
#lastview dl dd span.discount{
	 color:orange;
	 font:bold 14px Verdana, Geneva, sans-serif;
}
#lastview dl dd span.previous{
	text-decoration:line-through;
}
#lastview dl.noborder{
	                  border:none;
}
/*不随滚动条移动的美淘广告*/
div#adv {
	position:fixed;
	top: 300px;
	right: 0px;
}
</style>
</head>

<body>
<iframe src="head.html" width="100%" height="104" scrolling="no" frameborder="0"></iframe>
<div id="middle">
  <div id="allnav">
    <div id="nav">
      <ul>
        <li class="menuList"><a href="#" class="category">全部商品分类</a>
          <ul>
            <!--二级菜单-->
            <li><a href="#">美食</a></li>
            <li><a href="#">旅游</a></li>
            <li><a href="#">酒店</a></li>
            <li><a href="#">电影</a></li>
            <li><a href="#">KTV</a></li>
            <li><a href="#">时尚</a></li>
            <li><a href="#">生活服务</a></li>
          </ul>
        </li>
        <li><a href="index.html">首页</a></li>
        <li><a href="#">团购</a></li>
        <li><a href="#">美食</a></li>
        <li><a href="#">电影</a></li>
        <li><a href="#">KTV</a></li>
        <li><a href="#">酒店订票</a></li>
        <li><a href="#">购物</a></li>
        <li><a href="#">品牌特卖</a></li>
      </ul>
    </div>
  </div>
  <div id="mtop">
    <div id="navlist">#navlist 导航菜单的下拉列表</div>
    <div id="content">
      <div id="typesearch">
        <ul>
          <li class="title"><span class="hot"></span>热门团购</li>
          <li><a href="#">代金劵</a></li>
          <li><a href="#">火锅</a></li>
          <li><a href="#">自助餐</a></li>
          <li><a href="#">KTV</a></li>
          <li><a href="#">电影</a></li>
          <li><a href="#">美发</a></li>
          <li><a href="#">川湘菜</a></li>
          <li><a href="#">足疗按摩</a></li>
          <li><a href="#">服装</a></li>
          <li><a href="#">烧烤烤肉</a></li>
        </ul>
        <ul>
          <li class="title"><span class="business"></span>热门商圈</li>
          <li><a href="#">武昌区</a></li>
          <li><a href="#">江汉区</a></li>
          <li><a href="#">汉阳区</a></li>
          <li><a href="#">江岸区</a></li>
          <li><a href="#">硚口区</a></li>
          <li><a href="#">青山区</a></li>
          <li><a href="#">光谷高新</a></li>
          <li><a href="#">东西湖区</a></li>
        </ul>
      </div>
      <div id="week">
        <P><span class="weekicon"></span>本周精选</P>
        <ul>
          <li><a href="#"><img src="images/week1.jpg" /></a></li>
          <li><a href="#"><img src="images/week2.jpg" /></a></li>
          <li><a href="#"><img src="images/week3.jpg" /></a></li>
        </ul>
      </div>
    </div>
  </div>
  <div id="mbottom">
    <div id="goods">
      <P><span class="goodicon"></span>团购精选</P>
      <div id="pjson"></div>
      <%-- <c:forEach items="${pjson}" var="obj" >
		        	<dl><dt><a href="#"><img src="images/'+obj.picture+
		        	'"/></a></dt><dd class="name">obj.title</dd><dd>obj.productdesc</dd>
		        	<dd><span class="discount">"¥"+obj.originalprice</span>门店价
		        	<span class="price">"¥"+obj.currentprice</span></dd></dl>
      </c:forEach> --%>
      <dl>
        <dt><a href="#"><img src="images/good1.jpg" /></a> </dt>
        <dd class="name">【首义汇/阅马场】汉庭连锁酒店</dd>
        <dd>住宿1晚，房型4选1，免费提供WiFi，多张美淘券</dd>
        <dd><span class="discount">¥119</span> 门店价<span class="price">¥199</span></dd>
      </dl>
      <!-- <dl>
        <dt><a href="#"><img src="images/good1.jpg" /></a> </dt>
        <dd class="name">【首义汇/阅马场】汉庭连锁酒店</dd>
        <dd>住宿1晚，房型4选1，免费提供WiFi，多张美淘券</dd>
        <dd><span class="discount">¥119</span> 门店价<span class="price">¥199</span></dd>
      </dl>
      <dl>
        <dt class="dtTxt"><a href="detail.html"><img src="images/good2.jpg" /></a>
          <p>商圈：西北湖、武汉广场、汉街</p>
        </dt>
        <dd class="name">【3店通用】大渔铁板烧</dd>
        <dd>单人可口自助套餐，与精美菜品的一场冰火约会</dd>
        <dd><span class="discount">¥149</span> 门店价<span class="price">¥22</span>4</dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good3.jpg" /></a> </dt>
        <dd class="name">【多城市】如家快捷酒店</dd>
        <dd>住宿1晚（标准双人房/商务大床房2选1）</dd>
        <dd><span class="discount">¥119</span> 门店价<span class="price">¥199</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good4.jpg" /></a></dt>
        <dd class="name">【5店通用】东北人烤肉</dd>
        <dd>代金券1张，代金券可叠加使用</dd>
        <dd><span class="discount">¥36</span> 门店价<span class="price">¥50</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good5.jpg" /></a></dt>
        <dd class="name">【王家湾】金逸影城</dd>
        <dd>2D电影票1张，可升级为3D电影票、VIP厅</dd>
        <dd><span class="discount">¥30</span> 门店价<span class="price">¥75</span></dd>
      </dl>
      <dl>
        <dt class="dtTxt"><a href="#"><img src="images/good6.jpg" /></a>
          <p>洪山区光谷资本大厦4楼（光谷广场转盘旁）</p>
        </dt>
        <dd class="name">【光谷/鲁巷】巨幕影城</dd>
        <dd>电影票1张，2D/3D可兑，另有升级方案</dd>
        <dd><span class="discount">¥25.5</span> 门店价<span class="price">¥120</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good7.jpg" /></a></dt>
        <dd class="name">【多城市】艳阳天酒家旅店</dd>
        <dd>住宿1晚，12家店任选1种房型，免费提供WiFi</dd>
        <dd><span class="discount">¥139</span> 门店价<span class="price">¥234</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good8.jpg" /></a></dt>
        <dd class="name">【2店通用】大地数字影院</dd>
        <dd>电影票1张，2D/3D可兑</dd>
        <dd><span class="discount">¥22.9 </span>门店价<span class="price">¥60</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good9.jpg" /></a></dt>
        <dd class="name">【徐东大街】新宿酒店</dd>
        <dd>商务复式A住宿1晚，轻松入住</dd>
        <dd><span class="discount">¥225</span> 门店价<span class="price">¥368</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good10.jpg" /></a></dt>
        <dd class="name">【光谷/鲁巷】发源地</dd>
        <dd>精致烫染2选1，免费提供WiFi</dd>
        <dd><span class="discount">¥99</span> 门店价<span class="price">¥618</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good11.jpg" /></a></dt>
        <dd class="name">【19店通用】精益眼镜</dd>
        <dd>配镜套餐，赠送眼镜盒1个，擦镜布1块</dd>
        <dd><span class="discount">¥388</span> 门店价<span class="price">¥1440</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/good12.jpg" /></a></dt>
        <dd class="name">【中南路/洪山广场】中商广场</dd>
        <dd>现金卡1张，全场穿着类通用（个别专柜特例品牌除外）</dd>
        <dd><span class="discount">¥50</span> 门店价<span class="price">¥100</span></dd>
      </dl> -->
    </div>
    <div id="side">
      <div id="hottopic">
        <h2>热门主题</h2>
        <a href="#"><img src="images/hottopic1.jpg" /></a> <a href="#"><img src="images/hottopic2.jpg" /></a> <a href="hottopic.html"><img src="images/hottopic3.jpg" /></a>
        </dl>
      </div>
      <!--热门主题-->
      <div id="hotbuy">
        <h2>热卖排行榜</h2>
        <dl>
          <dt><a href="#"><img src="images/hotbuy1.jpg" /></a></dt>
          <dd>【武汉广场】武商摩尔国际电影城单人票</dd>
          <dd><span>¥25</span>每天1416人团购</dd>
        </dl>
        <dl>
          <dt><a href="#"><img src="images/hotbuy2.jpg" /></a></dt>
          <dd>【3店通用】万达国际影城电影票</dd>
          <dd><span>¥25</span>每天1166人团购</dd>
        </dl>
        <dl class="last">
          <dt><a href="#"><img src="images/hotbuy3.jpg" /></a></dt>
          <dd>【武汉等】金汉斯烤肉自助餐</dd>
          <dd><span>¥46.75</span>每天468人团购</dd>
        </dl>
      </div>
      <!--热门排行榜-->
      <div id="price">
    
        <ul>
          <li>金汉斯&nbsp; <a href="#">进行中</a></li>
          <li>兰蔻升级版小黑瓶  &nbsp; <a href="#">进行中</a></li>
          <li>苹果 iPhone 5s   &nbsp;<a href="#">进行中</a></li>
          <li>HTC One max   &nbsp;<a href="#">进行中</a> </li>
          <li>三星最新平板电   &nbsp;<a href="#">进行中</a></li>
          <li>苹果 iPad Air  &nbsp;<a href="#">进行中</a></li>
        </ul>
     
     
      </div><!--抽奖--> 
      
      <div id="lastview">
        <h2>最近浏览</h2><P><a href="#">清空</a></P>
          <dl>
             <dt><a href="#"><img src="images/lastview1.jpg" /></a></dt>
             <dd>三星最新平板电脑</dd>
             <dd><span class="discount">&yen;0</span><span class="previous">0</span></dd>
          </dl>
           <dl>
             <dt><a href="#"><img src="images/lastview2.jpg" /></a></dt>
             <dd>中商广场提供现金卡</dd>
             <dd><span class="discount">&yen;50</span><span class="previous">100</span></dd>
          </dl>
           <dl class="noborder">
             <dt><a href="#"><img src="images/lastview3.jpg" /></a></dt>
             <dd>金汉斯烤肉自助餐</dd>
             <dd><span class="discount">&yen;46</span><span class="previous">58</span></dd>
          </dl>
         
      </div>
    </div>
  </div>
</div>
<iframe src="foot.html" width="100%"  scrolling="no" frameborder="0" height="185"></iframe>
<div id="adv"> <img src="images/ban.jpg" width="100"  /> </div>

</body>
</html>
