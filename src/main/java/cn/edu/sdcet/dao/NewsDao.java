package cn.edu.sdcet.dao;

import cn.edu.sdcet.entity.NewsBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/J2300720_xinwen";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";
    static {
        // 静态代码块：加载 MySQL 驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Failed to load MySQL driver", e);
        }
    }
    // 获取数据库连接
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // 获取所有新闻
    public List<NewsBean> getAllNews() {
        String sql = "SELECT x.newsId, x.newsTitle, x.newsTypeId, t.newsTypeName, x.newsPublishTime " +
                "FROM xinwen x " +
                "JOIN xinwenType t ON x.newsTypeId = t.newsTypeId";
        return executeQuery(sql, null);
    }

    // 按条件搜索新闻
    public List<NewsBean> searchNews(String searchTarget, String searchContent) {
        String sql;
        if ("title".equalsIgnoreCase(searchTarget)) {
            sql = "SELECT x.newsId, x.newsTitle, x.newsTypeId, xt.newsTypeName, x.newsPublishTime " +
                    "FROM xinwen x JOIN xinwenType xt ON x.newsTypeId = xt.newsTypeId " +
                    "WHERE x.newsTitle LIKE ?";
        } else {
            sql = "SELECT x.newsId, x.newsTitle, x.newsTypeId, xt.newsTypeName, x.newsPublishTime " +
                    "FROM xinwen x JOIN xinwenType xt ON x.newsTypeId = xt.newsTypeId " +
                    "WHERE xt.newsTypeName LIKE ?";
        }
        return executeQuery(sql, "%" + searchContent + "%");
    }

    // 通用查询执行方法
    private List<NewsBean> executeQuery(String sql, String param) {

        List<NewsBean> newsList = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // 设置参数
            if (param != null) {
                ps.setString(1, param);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NewsBean news = new NewsBean(
                            rs.getString("newsId"),
                            rs.getString("newsTitle"),
                            rs.getString("newsTypeId"),
                            rs.getString("newsTypeName"),
                            rs.getString("newsPublishTime")
                    );
                    newsList.add(news);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error executing query", e);
        }

        return newsList;
    }
}
