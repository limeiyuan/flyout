package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/18 11:24.
 * description:
 */
@Entity
@Table(name = "success_case_sc")
public class sccussCase {
    @Id
    @GeneratedValue
    @Column(name = "id_sc")
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "nation_id_sc")
    private NationInfo nation;

    @Column(name = "degree_sc")
    private String degree;//当前学历

    @Column(name = "major_sc")
    private String major;//当前专业

    @Column(name = "dest_major_sc")
    private String dest_major;//申请专业

    @Column(name = "gpa_sc")
    private String gpa;

    @Column(name = "graduate_school_sc")
    private String graduateSchool;

    @Column(name = "school_sc")
    private String school;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDest_major() {
        return dest_major;
    }

    public void setDest_major(String dest_major) {
        this.dest_major = dest_major;
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(String gpa) {
        this.gpa = gpa;
    }

    public String getGraduateSchool() {
        return graduateSchool;
    }

    public void setGraduateSchool(String graduateSchool) {
        this.graduateSchool = graduateSchool;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }
}
