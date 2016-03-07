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
  <title>根据考分选学校</title>

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
<h1>根据考分选学校</h1><hr/>
</div>

<form class="am-form">
  <fieldset>
  
  <div class="am-form-group">
		<label for="myScore">我的考分：</label> <input
			type="text" id="myScore" name="myScore" placeholder="输入自己的考分"
			class="am-form-field" required />
	</div>
  
    <div class="am-form-group">
      <label for="area">我的报考地区（此处可以添加获取地理位置功能，html5特性）：</label>
      <select name="area" id="area">
        <jsp:include page="arealist.jsp" />
      </select>
    </div>
    
    <div class="am-form-group">
      <label for="year">我的报考年份（假装今年是2013年）：</label>
      <select name="year" id="year">
        <option value="2013">2013</option>
      </select>
    </div>
    
    <div class="am-form-group">
      <label for="batch">报考批次：</label>
      <select name="batch" id="batch">
        <option value="本科一批">本科一批</option>
        <option value="本科二批">本科二批</option>
        <option value="本科三批">本科三批</option>
        <option value="本科提前批">本科提前批</option>
        <option value="专科批">专科批</option>
      </select>
    </div>

    <div class="am-form-group">
      <label for="type">我是：</label>
      <select name="type" id="type">
        <option value="文科">文科生</option>
        <option value="理科">理科生</option>
        <option value="体育艺术类">体育艺术类学生</option>
      </select>
    </div>

  </fieldset>
</form>

<div>
    <fieldset><button id="search" name="search" class="am-btn am-btn-default">给我搜（使用Ajax异步加载Json数据）</button></fieldset>
</div>

<div>
<fieldset>
<h2>
<span>提示：参考线差是根据各个高校的各专业历年录取信息计算出来的，它是一条红线。只有你的分数线差高于（考虑特殊情况，或略低于）参考线差时，才有可能被录取，并且高出的越多，录取的可能性越大。</span>
</h2>
</fieldset>
</div>

<table class="am-table am-table-striped">
    <thead>
        <tr>
        	<th>院校代码</th>
            <th>院校名</th>
            <th>录取批次</th>
            <th>该院校录取的参考线差（分）</th>
            <th>你的线差（分）</th>
        </tr>
    </thead>
    <tbody id="result" name="result">
        
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
	$("#result").html("");//先清空原来的表格内容
		$.getJSON("${pageContext.request.contextPath}/servlet/SelectCollegeByScoreServlet?"+
				"myScore="+$("#myScore").val()+
				"&area="+$("#area").val()+
				"&type="+$("#type").val()+
				"&batch="+$("#batch").val()+
				"&year="+$("#year").val()+
				"&timeStamp="+new Date().getTime(), function(json) {
			$.each(json, function(i,item){
    			$("#result").append(
    				"<tr>" + 
    				"<td>" + item.collegeCode + "</td>" +
    				"<td><a href='" + item.collegeIntro + "' target='_blank'>" + item.collegeName + "</a>" + "</td>" +
    				"<td>" + item.batch + "</td>" +
    				"<td>" + item.avgMinDelta + "</td>" +
    				"<td>" + item.myDelta + "</td>" +
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