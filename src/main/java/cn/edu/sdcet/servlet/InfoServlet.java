package cn.edu.sdcet.servlet;

import cn.edu.sdcet.dao.NewsDao;
import cn.edu.sdcet.entity.NewsBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/List.jsp?typeId=3")
public class InfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            NewsDao dao = new NewsDao();
            List<NewsBean> newsList = dao.getNewsByTypeId("3"); // 假设类别ID为3

            for (NewsBean news : newsList) {
                System.out.println(news.getNewsTitle() + " - " + news.getNewsTypeName());
            }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
