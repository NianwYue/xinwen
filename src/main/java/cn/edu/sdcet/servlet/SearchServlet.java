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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String searchTarget = request.getParameter("searchTarget");
        String searchContent = request.getParameter("searchContent");

        System.out.println("Search Target: " + searchTarget);
        System.out.println("Search Content: " + searchContent);

        NewsDao newsDao = new NewsDao();
        List<NewsBean> searchResults = newsDao.searchNews(searchTarget, searchContent);

        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

}
