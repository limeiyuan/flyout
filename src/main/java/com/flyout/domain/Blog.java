package com.flyout.domain;

import org.springframework.context.annotation.Lazy;

import javax.persistence.*;

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

    @ManyToOne()
    @JoinColumn(name = "nation_id_b")
    private NationInfo nation;

    @Column(name="title_b")
    private String title;

    @Column(name="content_b")
    @Lazy
    private String content;

    @Column(name="enable_b")
    private Integer enable;

    @Column(name = "order_b")
    private Integer order;

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

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
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
}

