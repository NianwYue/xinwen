<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻管理系统</title>
<link rel="stylesheet" href="Style/Main.css" type="text/css" media="screen, projection"/>
</head>
	<%!
    	Connection conn;
		Statement statement;
    	ResultSet rs;
    %>
    <%
    	System.out.println("newsid:"+request.getParameter("newsid"));
  		//1、注册（加载）驱动。使用Class.forName，将显示的加载驱动程序类
    	Class.forName("com.mysql.jdbc.Driver");
    	//2、做好前置准备工作（准备数据库连接字符串）
        String dbName = "student";
        String userName = "root";
        String userPasswd = "19821218";
        String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;
        //3、建立数据库连接
        //DriverManager是JDBC的管理类，作用于用户和驱动程序之间，用于建立数据库连接。
        conn = DriverManager.getConnection(url);
        //4、做好执行SQL语句的准备工作（准备sql语句和Statement对象）
        //Statement用于在已经建立的数据库连接的基础上，向数据库发送要执行的SQL语句
        String sql = "select NRC_TYPE.T_NAME,N_TITLE,N_PUBLISHTIME,N_ID from NRC_TYPE,NRC_NEWS where NRC_TYPE.T_ID=NRC_NEWS.N_ID ORDER BY N_PUBLISHTIME DESC LIMIT 10";
        statement = conn.createStatement();
      	//5、执行sql语句
        //执行sql后，将查询出来的结果集保存在ResultSet对象中
        rs = statement.executeQuery(sql);
    %>
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
	<div id="main">
		<div class="doc-info-view">
			<div class="hd"><h1>三百件珍贵古籍免费展出 敦煌遗书周日亮相国图</h1></div>
			<hr class="double" />
			<!--[if !IE]>文章属性<![endif]-->
			<div class="doc-parameter">
				<div>作者：赵明宇</div>
				<div>2009-06-12 09:55:52</div>
				<div>来源：《北京娱乐信报》</div>
			</div>
			<!--[if !IE]>正文<![endif]-->
			<div class="doc-text">
				<p>1600年前的敦煌遗书、东晋时期写本《金光明经》……本周日，入选第二批《国家珍贵古籍名录》“国家珍贵古籍特展”将亮相国家馆，300件珍贵古籍荟萃一堂。本次展览是新中国成立以来参展单位最多的一次古籍展览，观众可免费参观。</p>
				<p><strong>97家单位参展亮宝</strong></p>
				<p>本次展览由文化部主办，国家馆(国家古籍保护中心)承办，97家公共馆、高校馆、私家等古籍收藏单位共同参与，是新中国成立以来参展单位最多的大型公益性珍贵古籍特展。参展珍品丰富，共将展出300件珍贵古籍，其中有20件敦煌吐鲁番文书、50件宋元刻本、80件名家抄稿本、12种民族文字古籍。</p>
				<p>这些参展古籍是从荣登第二批《国家珍贵古迹名录》的4478部古籍中遴选出来的，平时出于保护的需要，各收藏单位多深藏不露。</p>
				<p>展览将从6月14日至7月3日期间，每天9点至下午4点半免费对外开放，持续展出20天。</p>
				<p><strong>很多古籍首次公展</strong></p>
				<p>展品中，有很多珍贵古籍第一次公开亮相。如，北凉神玺三年(399)宝贤写本《贤劫九百佛名品》是此次展览中年代最早的展品，它原写于高昌，后流入敦煌。展览中，它将与东晋时期写本《金光明经》一起作为敦煌遗书展出。</p>
				<p>此外，安徽皖西学院的一部宋衢州州学刻元明递修的《三国志》，云南大学馆的宋刻《春秋经传集解》，辽宁省馆的宋淳熙年间浙刻《扬子法言》等，此前从未见诸《中国古籍善本书目》等各家目录著录的珍贵古籍，也是首次公开展出。</p>
				<p><strong>安保执行最高级别</strong></p>
				<p>虽然此次展览由国图承办，但国图希望观众借此机会更多地看到来自全国的珍贵古籍，因此展览中有3/4的展品非国图所藏，甚至还有3位私人藏品一起展出。</p>
				<p>这么多珍贵古籍云集北京，如何将这些展品运至北京?国家馆古籍馆副馆长张志清笑着说，这属于秘密，“如果说出来，运送过程就会被知晓，对运送安全有可能构成威胁。”他还表示，在20天的展期里，国图将以最高级别的安全保护措施，保护这些珍贵古籍。据悉，展出的珍贵古籍都已经买了保险，但金额不便对外透露。</p>
			</div>
			<!--[if !IE]>评论<![endif]-->
			<hr class="double" />
			<div class="comment">
				<div class="hd"><h3>最新评论</h3></div>
				<!--[if !IE]>评论列表 开始<![endif]-->
				<ol class="com-list">
					<li>
						<p class="title wrapfix"><span class="num">1.</span><span class="name">游客</span><span class="time">2009-04-17 2:41</span></p>
						<div class="com-body">
							林风眠拍品质疑引业内追踪谁是名家赝品现元凶
						</div>
					</li>
					<li>
						<p class="title wrapfix"><span class="num">2.</span><span class="name">游客</span><span class="time">2009-04-17 2:41</span></p>
						<div class="com-body">
							林风眠拍品质疑引业内追踪谁是名家赝品现元凶
						</div>
					</li>
					<li>
						<p class="title wrapfix"><span class="num">3.</span><span class="name">游客</span><span class="time">2009-04-17 2:41</span></p>
						<div class="com-body">
							林风眠拍品质疑引业内追踪谁是名家赝品现元凶
						</div>
					</li>
				</ol>
				<!--[if !IE]>评论列表 结束<![endif]-->
				<!--[if !IE]>填写评论 开始<![endif]-->
				<div class="com-form">
				<hr class="double" />
					<div class="hd"><h3>发表评论</h3></div>
					<p class="tips">请自觉遵守互联网相关政策法规，评论不得超过250字。</p>
					<form id="form1" method="post" action="">
						<p><textarea name="textarea" id="textarea" rows="5" class="textarea"></textarea></p>
						<p>
							<label for="username">昵称</label><input type="text" name="username" size="10" id="username" class="iText" />
							<input type="submit" name="Submit" class="btn" value="发表评论" />
						</p>
					</form>
				</div>
				<!--[if !IE]>填写评论 开始<![endif]-->
			</div>
		</div>
		<!--[if !IE]>新闻详情 结束<![endif]-->
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