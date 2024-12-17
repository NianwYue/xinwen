package cn.edu.sdcet.servlet;

import cn.edu.sdcet.dao.NewsDao;
import cn.edu.sdcet.dao.NewsTypeDao;
import cn.edu.sdcet.entity.NewsBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDao dao = new NewsDao();
        List<NewsBean> newsList = dao.getAllNews();

        // 调试输出
        System.out.println("News List Size: " + (newsList != null ? newsList.size() : "null"));

        request.setAttribute("newsList", newsList);
        request.setAttribute("newsTypeList",new NewsTypeDao().findAll());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}


