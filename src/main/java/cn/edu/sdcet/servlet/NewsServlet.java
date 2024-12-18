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

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 获取参数
        String newsId = request.getParameter("newsid");
        String typeId = request.getParameter("typeId");

        NewsDao newsDao = new NewsDao();
        NewsTypeDao newsTypeDao = new NewsTypeDao();

        try {
            // 1. 查询新闻类别列表，传递到页面
            List<NewsTypeBean> newsTypeList = newsTypeDao.findAll();
            request.setAttribute("newsTypeList", newsTypeList);

            // 2. 如果点击了某条新闻，查询具体新闻信息
            if (newsId != null && !newsId.isEmpty()) {
                NewsBean news = null;

                // 通过 newsId 查询新闻详情
                List<NewsBean> allNews = newsDao.getAllNews();
                for (NewsBean n : allNews) {
                    if (n.getNewsId().equals(newsId)) {
                        news = n;
                        break;
                    }
                }

                // 如果新闻不存在，跳转到错误页面
                if (news == null) {
                    response.sendRedirect("error.jsp");
                    return;
                }

                // 将新闻详情存入 request 域
                request.setAttribute("news", news);
                request.getRequestDispatcher("info.jsp").forward(request, response);
                return;
            }

            // 3. 如果传入 typeId，查询分类新闻列表
            if (typeId != null && !typeId.isEmpty()) {
                List<NewsBean> newsListByType = newsDao.getNewsByTypeId(typeId);
                request.setAttribute("newsList", newsListByType);
                request.getRequestDispatcher("List.jsp").forward(request, response);
                return;
            }

            // 4. 默认情况，显示所有新闻
            List<NewsBean> newsList = newsDao.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
