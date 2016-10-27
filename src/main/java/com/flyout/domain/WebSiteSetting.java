package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/9/27 10:09.
 * description:
 */
@Entity
@Table(name = "website_setting_ws")
public class WebSiteSetting {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "Online_Count")
    private Long onlineCount;

    @Column(name = "Slide_Show")
    private String slideShow;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOnlineCount() {
        return onlineCount;
    }

    public void setOnlineCount(Long onlineCount) {
        this.onlineCount = onlineCount;
    }

    public String getSlideShow() {
        return slideShow;
    }

    public void setSlideShow(String slideShow) {
        this.slideShow = slideShow;
    }
}
