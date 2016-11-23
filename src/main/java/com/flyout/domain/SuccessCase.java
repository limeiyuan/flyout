package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/18 11:24.
 * description:
 */
@Entity
@Table(name = "success_case_sc")
public class SuccessCase {
    @Id
    @GeneratedValue
    @Column(name = "id_sc")
    private Long id;

    @Column(name = "name_sc")
    private String name;

    @ManyToOne()
    @JoinColumn(name = "nation_id_sc")
    private NationInfo nation;

    @Column(name = "degree_sc")
    private String degree;//当前学历

    @Column(name = "major_sc")
    private String major;//当前专业

    @Column(name = "dest_major_sc")
    private String destMajor;//申请专业

    @OneToOne()
    @JoinColumn(name = "photo_id_sc")
    private Photo photo;

    @Column(name = "gpa_sc")
    private String gpa;

    @Column(name = "graduate_school_sc")
    private String graduateSchool;

    @ManyToOne()
    @JoinColumn(name = "school_id_sc")
    private SchoolInfo school;

    @Column(name = "order_sc")
    private Integer order;

    @Column(name = "description")
    private String description;

    @Column(name = "enable_pi")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.EnableEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private EnableEnum enable;//有效

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getDestMajor() {
        return destMajor;
    }

    public void setDestMajor(String destMajor) {
        this.destMajor = destMajor;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
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

    public SchoolInfo getSchool() {
        return school;
    }

    public void setSchool(SchoolInfo school) {
        this.school = school;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }
}
