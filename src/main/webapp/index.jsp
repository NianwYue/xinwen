<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cn.edu.sdcet.entity.NewsBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻管理系统</title>
<link rel="stylesheet" href="Style/Main.css" type="text/css" media="screen, projection"/>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"><a href="index.htm" title="新闻信息管理系统">新闻信息管理系统</a></div>
		<div class="search">
			<form id="form1" method="post" action="search.jsp">
				<input type="text" name="searchContent" id="textfield" class="iText" />
				<select name="searchTarget">
					<option selected="selected">标题</option>
					<option>内容</option>
				</select>
				<input type="submit" name="Submit" class="btn" value="搜索" />
				<input type="hidden" name="XXX" value="002">
			</form>
		</div>
	</div>
	<div id="main" class="wrapfix">
		<div id="mostlyCon">
			<div class="newslist">
				<div class="hd"><h3>头条新闻</h3></div>
				<div class="bd">
					<ul class="list">
						<% 
						List<NewsBean> list =(List<NewsBean>)request.getAttribute("newsList");
						Iterator<NewsBean> it = list.iterator();
						while (it.hasNext()) {
							NewsBean news = it.next();
						%>
						<li><span class="category">[<%=news.getNewsTypeName() %>]</span><a href="info.jsp?newsid=<%=news.getNewsId() %>" target="_blank"><%=news.getNewsTitle() %></a><span class="date"><%=news.getNewsPublishTime() %></span></li>
						<%}%>
					</ul>
				</div>
			</div>

			<div class="newslist">
				<div class="hd"><h3>热点新闻</h3></div>
				<div class="bd">
					<ul class="list">
					</ul>
				</div>
			</div>
		</div>
		<div id="sideCon">
			<div id="nav">
				<h3>新闻类别</h3>
				<ul>
				</ul>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>版权所有 &copy;<a href="https://www.sdcet.edu.cn/" target="_blank">山东电子职业技术学院 </a></p>
	</div>
</div>
</body>
</html>