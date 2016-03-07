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
  <title>专业热度排行榜</title>

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
<h1>专业热度排行榜</h1><hr/>
</div>

<table class="am-table am-table-striped">
    <thead>
        <tr>
        <th>排名</th>
            <th>专业名称</th>
            <th>专业介绍</th>
            <th>专业热度（百分制）</th>
        </tr>
    </thead>
    <tbody id="proheattablebody" name="proheattablebody">
        
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
var rank = 0;
	$("#proheattablebody").html("");//先清空原来的表格内容
	$.getJSON("${pageContext.request.contextPath}/servlet/ProRankingServlet?timeStamp="+new Date().getTime(), function(json) {
		$.each(json, function(i,proinfo){
		rank = rank+1;
   			$("#proheattablebody").append(
   				"<tr>" + 
   				"<td>" + rank + "</td>" +
   				"<td>" + proinfo.proName + "</td>" +
   				"<td><a href='" + proinfo.proIntroductionPage + "' target='_blank'>专业介绍页面</a>" + "</td>" +
   				"<td>" + proinfo.proHeat + "</td>" +
   				"</tr>"
   			);
 			});
	});
});
</script>

<jsp:include page="footer.jsp" />
</body>

</html>