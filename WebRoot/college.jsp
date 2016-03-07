<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>高校信息检索</title>

<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="icon" type="image/png" href="assets/i/favicon.png">

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
</head>

<body>
<header class="am-topbar">
  <jsp:include page="header.jsp" />
</header>

	<div>
		<h1>高校信息检索</h1>
		<hr/>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active"><a href="#tab1">按名称检索</a></li>
			<li><a href="#tab2">按条件检索</a></li>
		</ul>

		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="tab1">
				<form action="" class="am-form">
					<fieldset>
						<div class="am-form-group">
							<label for="college-name">院校名称（此处采用模糊查询技术）：</label> <input
								type="text" id="college-name" name="college-name" placeholder="输入院校名"
								class="am-form-field" required />
						</div>
					</fieldset>
				</form>
				<div>
					<fieldset>
						<button id="search1" name="search1" class="am-btn am-btn-default">给我搜（使用Ajax异步加载Json数据）</button>
					</fieldset>
				</div>
				
				<table class="am-table am-table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>地区</th>
							<th>类别</th>
							<th>学历层次</th>
							<th>985</th>
							<th>211</th>
							<th>介绍页面</th>
						</tr>
					</thead>
					<tbody id="collegeinfotablebody1" name="collegeinfotablebody1">
			
					</tbody>
				</table>
	
				<ul class="am-pagination am-pagination-centered">
				  <li><a id="prePage1" href="#">&laquo;上一页</a></li>
				  <li><a id="nextPage1" href="#">下一页&raquo;</a></li>
				</ul>
				
			</div>
			<div class="am-tab-panel am-fade" id="tab2">
				<form class="am-form">
					<fieldset>
						<div class="am-form-group">
							<label for="area">所在地区：</label> <select name="area" id="area">
								<jsp:include page="arealist.jsp" />
							</select>
						</div>
						<div class="am-form-group">
							<label for="type">院校类别：</label> <select name="type" id="type">
								<jsp:include page="typelist.jsp" />
							</select>
						</div>
						<div class="am-form-group">
							<label for="level">学历层次：</label> <select name="level" id="level">
								<option value="一本">一本</option>
								<option value="二本">二本</option>
								<option value="三本">三本</option>
								<option value="专科">专科</option>
							</select>
						</div>						
						<div class="am-form-group">
							<label for="speciality">特殊属性：</label>
							<div id="speciality" name="speciality" class="am-form-group">
								<label class="am-checkbox-inline"> <input id="_985" name="_985"
									type="checkbox" value="985"> 985
								</label> <label class="am-checkbox-inline"> <input  id="_211" name="_211"
									type="checkbox" value="211"> 211
								</label>
							</div>
						</div>
					</fieldset>
				</form>
				<div>
					<fieldset>
						<button id="search2" name="search2" class="am-btn am-btn-default">给我搜（使用Ajax异步加载Json数据）</button>
					</fieldset>
				</div>
				
				<table class="am-table am-table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>地区</th>
							<th>类别</th>
							<th>学历层次</th>
							<th>985</th>
							<th>211</th>
							<th>介绍页面</th>
						</tr>
					</thead>
					<tbody id="collegeinfotablebody2" name="collegeinfotablebody2">
			
					</tbody>
				</table>
	
				<ul class="am-pagination am-pagination-centered">
				  <li><a id="prePage2" href="#">&laquo;上一页</a></li>
				  <li><a id="nextPage2" href="#">下一页&raquo;</a></li>
				</ul>
				
			</div>
		</div>
	</div>


	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>

<script type="text/javascript">
var pageNo1 = 1;
var pageNo2 = 1;
var getRequestStr1 = "";
var getRequestStr2 = "";

$(document).ready(function() {

function displaytablebody(element, collegeinfo) {
$(element).append(
		"<tr>" + 
		"<td>" + collegeinfo.no + "</td>" +
		"<td>" + collegeinfo.name + "</td>" +
		"<td>" + collegeinfo.area + "</td>" +
		"<td>" + collegeinfo.type + "</td>" +
		"<td>" + collegeinfo.level + "</td>" +
		"<td>" + collegeinfo._985 + "</td>" +
		"<td>" + collegeinfo._211 + "</td>" +
		"<td><a href='" + collegeinfo.introductionPage + "' target='_blank'>院校介绍页面</a>" + "</td>" +
		"</tr>"
	);
}

$("#nextPage1").click(function() {

	pageNo1=pageNo1+1;
	$("#collegeinfotablebody1").html("");//先清空原来的表格内容
	
		getRequestStr1 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=1"+
						"&collegeName="+$("#college-name").val()+
						"&pageNo1="+pageNo1+
						"&timeStamp=";
	
		$.getJSON(getRequestStr1+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody1", collegeinfo);
  			});
		});
	});
	
$("#prePage1").click(function() {
	
	if(pageNo1>1) {
		pageNo1=pageNo1-1;
	}
	
	$("#collegeinfotablebody1").html("");//先清空原来的表格内容
	
		getRequestStr1 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=1"+
						"&collegeName="+$("#college-name").val()+
						"&pageNo1="+pageNo1+
						"&timeStamp=";
						
		$.getJSON(getRequestStr1+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody1", collegeinfo);
  			});
		});
	});
	
$("#nextPage2").click(function() {

	pageNo2=pageNo2+1;
	$("#collegeinfotablebody2").html("");//先清空原来的表格内容
	
		getRequestStr2 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=2"+
						"&area="+$("#area").val()+
						"&type="+$("#type").val()+
						"&level="+$("#level").val()+
						"&_985="+$("#_985").is(':checked')+
						"&_211="+$("#_211").is(':checked')+
						"&pageNo2="+pageNo2+
						"&timeStamp=";
	
		$.getJSON(getRequestStr2+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody2", collegeinfo);
  			});
		});
	});
	
$("#prePage2").click(function() {
	
	if(pageNo2>1) {
		pageNo2=pageNo2-1;
	}
	
	$("#collegeinfotablebody2").html("");//先清空原来的表格内容
	
		getRequestStr2 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=2"+
						"&area="+$("#area").val()+
						"&type="+$("#type").val()+
						"&level="+$("#level").val()+
						"&_985="+$("#_985").is(':checked')+
						"&_211="+$("#_211").is(':checked')+
						"&pageNo2="+pageNo2+
						"&timeStamp=";
						
		$.getJSON(getRequestStr2+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody2", collegeinfo);
  			});
		});
	});

$("#search1").click(function() {
	pageNo1 = 1;
	$("#collegeinfotablebody1").html("");//先清空原来的表格内容
		
		getRequestStr1 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=1"+
						"&collegeName="+$("#college-name").val()+
						"&pageNo1="+pageNo1+
						"&timeStamp=";
		
		$.getJSON(getRequestStr1+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody1", collegeinfo);
  			});
		});
	});
	
$("#search2").click(function() {
	pageNo2 = 1;
	$("#collegeinfotablebody2").html("");//先清空原来的表格内容
	
		getRequestStr2 = "${pageContext.request.contextPath}/servlet/CollegeServlet?"+
						"requestType=2"+
						"&area="+$("#area").val()+
						"&type="+$("#type").val()+
						"&level="+$("#level").val()+
						"&_985="+$("#_985").is(':checked')+
						"&_211="+$("#_211").is(':checked')+
						"&pageNo2="+pageNo2+
						"&timeStamp=";
		
		$.getJSON(getRequestStr2+new Date().getTime(), function(json) {
			$.each(json, function(i,collegeinfo){
    			displaytablebody("#collegeinfotablebody2", collegeinfo);
  			});
		});
	});
});
</script>

<jsp:include page="footer.jsp" />
</body>

</html>