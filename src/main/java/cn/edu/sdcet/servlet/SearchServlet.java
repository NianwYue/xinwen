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

@WebServlet("/search.jsp")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchContent = request.getParameter("searchContent");
        String searchTarget = request.getParameter("searchTarget");

        NewsDao dao = new NewsDao();
        List<NewsBean> searchResults = dao.searchNews(searchTarget, searchContent);
        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
    }
}


