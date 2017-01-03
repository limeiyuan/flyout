package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2017/1/1.
 * Description:
 */
@Entity
@Table(name = "carousel_web_cw")
public class CarouselWeb {
    @Id
    @GeneratedValue
    @Column(name = "id_cl")
    private Long id;

    @Column(name = "title_cl")
    private String title;

    @Column(name = "path_cl")
    private String path;

    @Column(name = "order_by_cl")
    private Integer order;

    @Column(name = "createtime_cl")
    private Date createDate = new Date();

    @ManyToOne()
    @JoinColumn(name = "photo_id_cl")
    private Photo photo;

    @Column(name = "enable_b")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.EnableEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private EnableEnum enable;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }
}
