package com.flyout.domain;

import com.flyout.common.enums.BlogCategoryEnum;
import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.util.Date;

/**
 * @author LiMeiyuan
 * @version v1.00
 * @date 2016/12/21 0:36
 * @description:
 */
@Entity
@Table(name = "Blog_b")
public class Blog {
    @Id
    @GeneratedValue
    @Column(name="id_b")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "account_id_b")
    private Account account;

    @Column(name = "category_b")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.BlogCategoryEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private BlogCategoryEnum category;

    @Column(name="title_b")
    private String title;

    @Column(name="content_b")
    @Lazy
    private String content;

    @Column(name = "enable_b")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.EnableEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private EnableEnum enable;

    @Column(name = "order_b")
    private Integer order;

    @Column(name = "create_time_b")
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public BlogCategoryEnum getCategory() {
        return category;
    }

    public void setCategory(BlogCategoryEnum category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
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

