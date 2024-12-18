<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.sdcet.entity.NewsBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新闻发布系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb18030" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<meta name="Keywords" content="关键字" />
	<meta name="Description" content="描述" />
	<link rel="stylesheet" href="Style/Main.css" type="text/css" media="screen, projection" />
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<a href="index.htm" title="新闻发布系统">新闻发布系统</a>
		</div>
		<!--[if !IE]>logo 结束<![endif]-->
		<div class="search">
			<form id="form1" method="post" action="search.htm">
				<input type="text" name="textfield" id="textfield" class="iText" />
				<input type="submit" name="Submit" class="btn" value="搜索" />
			</form>
		</div>
		<!--[if !IE]>search 结束<![endif]-->
	</div>
	<!--[if !IE]>header 结束<![endif]-->

	<div id="main">
		<div class="newslist">
			<div class="hd">
				<h3>搜索结果</h3>
			</div>
			<div class="bd">
				<ul class="list">
					<%
						List<NewsBean> searchResults = (List<NewsBean>) request.getAttribute("searchResults");
						if (searchResults != null && !searchResults.isEmpty()) {
							for (NewsBean news : searchResults) {
					%>
					<li>
						<span class="category">[<%= news.getNewsTypeName() %>]</span>
						<a href="info.jsp?newsid=<%= news.getNewsId() %>" target="_blank">
							<%= news.getNewsTitle() %>
						</a>
						<span class="date"><%= news.getNewsPublishTime() %></span>
					</li>
					<%
						}
					} else {
					%>
					<li>没有找到符合条件的新闻。</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<!--[if !IE]>newslist 结束<![endif]-->
		<div class="paging wrapfix">
			<div class="total">共有200条记录&nbsp;当前1/10页</div>
			<div class="pn">
				<a href="search.htm" title="上一页" class="nobar">上一页</a>
				<a href="search.htm" class="nonce">1</a>
				<a href="search.htm">2</a>
				<a href="search.htm">3</a>
				<a href="search.htm">4</a>
				<a href="search.htm">5</a>
				<a href="search.htm">6</a>
				<a href="search.htm">7</a>
				<a href="search.htm">8</a>
				<a href="search.htm">9</a>
				<a href="search.htm">10</a>
				<a href="search.htm" title="下一页" class="nobar">下一页</a>
			</div>
		</div>
		<!--[if !IE]>paging 结束<![endif]-->
	</div>
	<!--[if !IE]>main 结束<![endif]-->

	<div id="footer">
		<p>版权所有 &copy;<a href="https://www.sdcet.edu.cn/" target="_blank">山东师创软件工程有限公司</a></p>
	</div>
	<!--[if !IE]>footer 结束<![endif]-->
</div>
</body>
</html>
