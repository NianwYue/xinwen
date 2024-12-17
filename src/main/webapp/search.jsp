<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Style/Main.css" type="text/css" media="screen, projection"/>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"><a href="index.htm" title="新闻发布系统">新闻发布系统</a></div>
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
	<%!
    	Connection conn;
		Statement statement;
    	ResultSet rs;
    	String sql;
    %>
    <%
    	request.setCharacterEncoding("UTF-8");
  		//1、注册（加载）驱动。使用Class.forName，将显示的加载驱动程序类
    	Class.forName("com.mysql.jdbc.Driver");
    	//2、做好前置准备工作（准备数据库连接字符串）
        String dbName = "student";
        String userName = "root";
        String userPasswd = "19821218";
        String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd+ "&useUnicode=true&characterEncoding=utf-8";
        //3、建立数据库连接
        //DriverManager是JDBC的管理类，作用于用户和驱动程序之间，用于建立数据库连接。
        conn = DriverManager.getConnection(url);
        //4、做好执行SQL语句的准备工作（准备sql语句和Statement对象）
        //Statement用于在已经建立的数据库连接的基础上，向数据库发送要执行的SQL语句
        if(request.getParameter("searchTarget").equals("标题")){
        	sql = "select NRC_TYPE.T_NAME,N_TITLE,N_PUBLISHTIME,N_ID from NRC_TYPE,NRC_NEWS where NRC_TYPE.T_ID=NRC_NEWS.N_ID and N_TITLE like '%"+request.getParameter("searchContent")+"%'";
        }else{
        	sql = "select NRC_TYPE.T_NAME,N_TITLE,N_PUBLISHTIME,N_ID from NRC_TYPE,NRC_NEWS where NRC_TYPE.T_ID=NRC_NEWS.N_ID and N_CONTENT like '%"+request.getParameter("searchContent")+"%'";
        }
        
        System.out.println("sql::"+sql);
        statement = conn.createStatement();
      	//5、执行sql语句
        //执行sql后，将查询出来的结果集保存在ResultSet对象中
        rs = statement.executeQuery(sql);
    %>
	<div id="main">
		<div class="newslist">
			<div class="hd"><h3>搜索结果</h3></div>
			<div class="bd">
				<ul class="list">
				<% while (rs.next()) {  
				%>
					<li><span class="category">[<%=rs.getString(1) %>]</span><a href="Info.htm" target="_blank"><%=rs.getString(2) %></a><span class="date"><%=rs.getString(3) %></span></li>
				<%}%>
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
		<p>版权所有 &copy;<a href="http://www.cnstrong.com.cn/" target="_blank">山东师创软件工程有限公司 </a></p>
	</div>
	<!--[if !IE]>main 结束<![endif]-->
</div>
</body>
</html>
<%
	//7、关闭ResultSet对象
	rs.close();
	//8、关闭Statement对象
	statement.close();
	//9、关闭Connection对象
	conn.close();
%>