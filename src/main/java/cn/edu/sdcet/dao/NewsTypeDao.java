package cn.edu.sdcet.dao;

import cn.edu.sdcet.entity.NewsTypeBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsTypeDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/J2300720_xinwen";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";

    // 获取数据库连接方法
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // 查询所有新闻类别
    public List<NewsTypeBean> findAll() {
        List<NewsTypeBean> newsTypeList = new ArrayList<>();
        String sql = "SELECT * FROM xinwenType";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                NewsTypeBean bean = new NewsTypeBean(rs.getInt("newsTypeId"), rs.getString("newsTypeName"));
                newsTypeList.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching news types", e);
        }
        return newsTypeList;
    }
}
