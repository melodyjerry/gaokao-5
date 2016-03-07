<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>历年录取线查询</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">
  <link rel="stylesheet" href="assets/css/amazeui.min.css">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
<header class="am-topbar">
  <jsp:include page="header.jsp" />
</header>

<div>
<h1>历年录取线查询</h1><hr/>
</div>

<form class="am-form">
  <fieldset>
    <div class="am-form-group">
      <label for="area">地区（此处可以添加获取地理位置功能，html5特性）：</label>
      <select name="area" id="area">
        <jsp:include page="arealist.jsp" />
      </select>
    </div>

    <div class="am-form-group">
      <label for="type">类别：</label>
      <select name="type" id="type">
        <option value="文科">文科</option>
        <option value="理科">理科</option>
        <option value="体育艺术类">体育艺术类</option>
      </select>
    </div>

    <div class="am-form-group">
      <label for="batch">批次：</label>
      <select id="batch" name="batch">
        <option value="本科提前批">本科提前批</option>
        <option value="本科一批">本科一批</option>
        <option value="本科二批">本科二批</option>
        <option value="本科三批">本科三批</option>
        <option value="专科批">专科批</option>
      </select>
    </div>
  </fieldset>
</form>

<div>
    <fieldset><button id="search" name="search" class="am-btn am-btn-default">给我搜（使用Ajax异步加载Json数据）</button></fieldset>
</div>

<table id="scorelinetable" name="scorelinetable" class="am-table am-table-striped">
    <thead>
        <tr>
            <th>年份</th>
            <th>地区</th>
            <th>批次</th>
            <th>类别</th>
            <th>分数</th>
        </tr>
    </thead>
    <tbody id="scorelinetablebody" name="scorelinetablebody">
        
    </tbody>
</table>

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
$(document).ready(function() {
	$("#search").click(function() {
	$("#scorelinetablebody").html("");//先清空原来的表格内容
		$.getJSON("${pageContext.request.contextPath}/servlet/NationalLineServlet?area="+$("#area").val()+"&type="+$("#type").val()+"&batch="+$("#batch").val()+"&timeStamp="+new Date().getTime(), function(json) {
			$.each(json, function(i,scoreline){
    			$("#scorelinetablebody").append(
    				"<tr>" + 
    				"<td>" + scoreline.year + "</td>" +
    				"<td>" + scoreline.area + "</td>" +
    				"<td>" + scoreline.batch + "</td>" +
    				"<td>" + scoreline.type + "</td>" +
    				"<td>" + scoreline.score + "</td>" +
    				"</tr>"
    			);
  			});
		});
	});
});
</script>

<jsp:include page="footer.jsp" />
</body>

</html>