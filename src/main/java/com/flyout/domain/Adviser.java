package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/10 14:58.
 * description:
 */
@Entity
@Table(name = "account_ac")
@DiscriminatorValue(value = "adviser")
public class Adviser extends Account {
    @Column(name = "adviser_type_ac")
    private String adviserType;//顾问类型：国内，国外

    @Column(name = "work_time_ac")
    private String workTime;//顾问工作时间

    @Column(name = "description_ac")
    private String description;//顾问简介

    public String getAdviserType() {
        return adviserType;
    }

    public void setAdviserType(String adviserType) {
        this.adviserType = adviserType;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
