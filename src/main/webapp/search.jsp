<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.sdcet.entity.NewsBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>搜索结果</title>
	<link rel="stylesheet" href="Style/Main.css" type="text/css" media="screen, projection"/>
</head>
<body>
<div id="wrapper">
	<div id="main">
		<h3>搜索结果</h3>
		<ul>
			<%
				List<NewsBean> searchResults = (List<NewsBean>) request.getAttribute("searchResults");
				if (searchResults != null && !searchResults.isEmpty()) {
					for (NewsBean news : searchResults) {
			%>
			<li>
				<span class="category">[<%= news.getNewsTypeName() %>]</span>
				<a href="info.jsp?newsid=<%= news.getNewsId() %>">
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
</body>
</html>
