package cn.edu.sdcet.entity;

public class NewsTypeBean {
    private int newsTypeId;
    private String newsTypeName;

    public NewsTypeBean() {
    }

    public NewsTypeBean(int newsTypeId, String newsTypeName) {
        this.newsTypeId = newsTypeId;
        this.newsTypeName = newsTypeName;
    }

    public int getNewsTypeId() {
        return newsTypeId;
    }

    public void setNewsTypeId(int newsTypeId) {
        this.newsTypeId = newsTypeId;
    }

    public String getNewsTypeName() {
        return newsTypeName;
    }

    public void setNewsTypeName(String newsTypeName) {
        this.newsTypeName = newsTypeName;
    }
}
