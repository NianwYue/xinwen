package cn.edu.sdcet.entity;

import java.sql.Date;

public class NewsBean {
    private String newsId;
    private String newsTitle;
    private String newsTypeId;
    private String newsTypeName;
    private String newsPublishTime;

    public NewsBean() {
    }

    // 构造方法
    public NewsBean(String newsId, String newsTitle, String newsTypeId, String newsTypeName, String newsPublishTime) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsTypeId = newsTypeId;
        this.newsTypeName = newsTypeName;
        this.newsPublishTime = newsPublishTime;
    }

    // 数据库使用的构造方法
    public NewsBean(int id, String typeName, String title, Date publishTime) {
        this.newsId = String.valueOf(id);
        this.newsTypeName = typeName;
        this.newsTitle = title;
        this.newsPublishTime = publishTime.toString();
    }

    public String getNewsId() {
        return newsId;
    }

    public void setNewsId(String newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(String newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    public String getNewsTypeName() {
        return newsTypeName;
    }

    public void setNewsTypeName(String newsTypeName) {
        this.newsTypeName = newsTypeName;
    }

    public String getNewsPublishTime() {
        return newsPublishTime;
    }

    public void setNewsPublishTime(String newsPublishTime) {
        this.newsPublishTime = newsPublishTime;
    }

    @Override
    public String toString() {
        return "NewsBean{" +
                "newsId='" + newsId + '\'' +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsTypeId='" + newsTypeId + '\'' +
                ", newsTypeName='" + newsTypeName + '\'' +
                ", newsPublishTime='" + newsPublishTime + '\'' +
                '}';
    }
}
