package cn.edu.sdcet.servlet;

import cn.edu.sdcet.dao.NewsDao;
import cn.edu.sdcet.dao.NewsTypeDao;
import cn.edu.sdcet.entity.NewsBean;
import cn.edu.sdcet.entity.NewsTypeBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listNews")
public class ListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取 typeId 参数
        String typeId = request.getParameter("typeId");

        NewsDao newsDao = new NewsDao();
        NewsTypeDao typeDao = new NewsTypeDao();

        // 查询新闻类别列表
        List<NewsTypeBean> newsTypeList = typeDao.findAll();
        request.setAttribute("newsTypeList", newsTypeList);

        // 查询指定类别的新闻列表
        if (typeId != null && !typeId.isEmpty()) {
            List<NewsBean> newsListByType = newsDao.getNewsByTypeId(typeId);
            request.setAttribute("newsList", newsListByType);
        } else {
            // 如果 typeId 为空，查询所有新闻
            List<NewsBean> newsList = newsDao.getAllNews();
            request.setAttribute("newsList", newsList);
        }

        // 转发到 List.jsp 页面
        request.getRequestDispatcher("List.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 调用 doGet()，避免代码重复
        doGet(request, response);
    }

}
