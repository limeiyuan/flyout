package com.flyout.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * @author LiMeiyuan
 * @version v1.00
 * @date 2016/12/19 22:33
 * @description:
 */
@Entity
@Table(name = "question_answer_qa")
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_qa")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "question_id_qa")
    private Question question;

    @ManyToOne
    @JoinColumn(name = "adviser_id_qa")
    private Adviser adviser;

    @Column(name = "create_time_qa")
    private Date createTime;

    @Column(name = "content_qa")
    private String content;

    @Column(name = "enable_qa")
    private Boolean enabled;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Adviser getAdviser() {
        return adviser;
    }

    public void setAdviser(Adviser adviser) {
        this.adviser = adviser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
