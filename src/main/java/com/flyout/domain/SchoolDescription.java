package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/12/28.
 * Description:
 */
@Entity
@Table(name = "school_info_si")
public class SchoolDescription {
    @Id
    @GeneratedValue
    @Column(name = "id_si")
    private Long id;

    @Column(name = "description_si")
    private String description;//简介

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
