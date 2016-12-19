package com.flyout.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2016/12/19.
 * Description:
 */
@Table(name = "question_qt")
@Entity
public class Question {
    @Id
    @GeneratedValue
    @Column(name="id_qt")
    private Long id;

    @Column(name="content_qt")
    private String content;

    @Column(name="enable_qt")
    private Integer enable;

    @Column(name = "order_qt")
    private Integer order;

    @Column(name = "create_time_qt")
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
