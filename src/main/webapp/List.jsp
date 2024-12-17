<%@ page import="cn.edu.sdcet.entity.NewsBean" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/12/17
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul class="list">
    <%
        List<NewsBean> newsList = (List<NewsBean>) request.getAttribute("newsList");
        if (newsList != null) {
            for (NewsBean news : newsList) {
    %>
    <li>
        <a href="info.jsp?newsid=<%=news.getNewsId()%>">
            <%=news.getNewsTitle()%>
        </a>
        <span class="date"><%=news.getNewsPublishTime()%></span>
    </li>
    <%
            }
        }
    %>
</ul>

</body>
</html>
