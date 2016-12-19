package com.flyout.domain;

import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/12/19.
 * Description:
 */
@Table(name = "question_qt")
@Entity
public class Question {
    @Id
    @GeneratedValue
    @Column(name = "id_qt")
    private Long id;

    @Column(name = "content_qt")
    private String content;

    @Column(name = "enable_qt")
    private Integer enable;

    @Column(name = "order_qt")
    private Integer order;

    @Column(name = "create_time_qt")
    private Date createTime;

    @ManyToOne
    @JoinColumn(name = "account_id_qt")
    private Account account;

    @ManyToOne()
    @JoinColumn(name = "nation_id_qt")
    private NationInfo nation;

    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
    private List<Answer> answerList;


    @Formula(value = "(select count(*) from question_answer_qa q where q.question_id_qa = id_qt)")
    private Integer answerCount;

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

    public List<Answer> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<Answer> answerList) {
        this.answerList = answerList;
    }

    public Integer getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(Integer answerCount) {
        this.answerCount = answerCount;
    }
}
