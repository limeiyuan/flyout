package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Formula;
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
    @Column(name="id_cw")
    private Long id;

    @Column(name="title_cw")
    private String title;

    @Column(name="type_cw")
    private Integer typeId;

    @Formula(value = "case when type_cw='1' then '顾问' when type_cw='2' then '学校' when type_cw='3' then '活动' when type_cw='4' then '方案' when type_cw='5' then '网页URL' when type_cw='6' then '问答' end")
    private String typeName;

    @Column(name="detail_cw")
    private String detail;

    @Column(name="order_by_cw")
    private Integer order;

    @Column(name="createtime_cw")
    private Date createDate = new Date();

    @ManyToOne()
    @JoinColumn(name = "photo_id_cw")
    private Photo photo;

    @Column(name = "enable_cw")
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }
}
