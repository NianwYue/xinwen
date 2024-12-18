<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.sdcet.entity.NewsBean" %>
<%@ page import="cn.edu.sdcet.entity.NewsTypeBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻列表</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Style/Main.css" />
</head>
<body>
<div id="wrapper">
    <!-- 头部 -->
    <div id="header">
        <div id="logo"><a href="index.jsp">信息管理系统</a></div>
    </div>

    <!-- 主体内容 -->
    <div id="main" class="wrapfix">
        <div id="mostlyCon">
            <!-- 分类新闻列表 -->
            <div class="newslist">
                <div class="hd"><h3>分类新闻</h3></div>
                <div class="bd">
                    <ul class="list">
                        <%
                            List<NewsBean> newsList = (List<NewsBean>) request.getAttribute("newsList");
                            if (newsList != null && !newsList.isEmpty()) {
                                for (NewsBean news : newsList) {
                        %>
                        <li>
                            <span class="category">[<%= news.getNewsTypeName() %>]</span>
                            <a href="info.jsp?newsid=<%= news.getNewsId() %>">
                                <%= news.getNewsTitle() %>
                            </a>
                            <span class="date"><%= news.getNewsPublishTime() %></span>
                        </li>
                        <%      }
                        } else { %>
                        <li>当前分类暂无新闻。</li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 侧边栏 -->
        <div id="sideCon">
            <div id="nav">
                <h3>新闻类别</h3>
                <ul>
                    <%
                        List<NewsTypeBean> newsTypeList = (List<NewsTypeBean>) request.getAttribute("newsTypeList");
                        if (newsTypeList != null) {
                            for (NewsTypeBean type : newsTypeList) {
                    %>
                    <li>
                        <a href="listNews?typeId=<%= type.getNewsTypeId() %>">
                            <%= type.getNewsTypeName() %>
                        </a>
                    </li>
                    <%      }
                    }
                    %>
                </ul>
            </div>
        </div>
    </div>

    <!-- 页脚 -->
    <div id="footer">
        <p>版权所有 &copy; <a href="https://www.sdcet.edu.cn/" target="_blank">山东电子职业技术学院</a></p>
    </div>
</div>
</body>
</html>
