package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/9/26 15:07.
 * description:
 */
@Entity
@Table(name = "school_info_si")
public class SchoolInfo {
    @Id
    @GeneratedValue
    @Column(name = "id_si")
    private Long id;

    @Column(name = "name_si")
    private String name;//名称

    @Column(name = "ownname_si")
    private String ownname;//对外名称

    @Column(name = "order_si")
    private Integer num;//全球排行

    @Column(name = "price_si")
    private String price;//学费

    @Column(name = "rate_si")
    private String rate;//录取率

    @Column(name = "description_si")
    private String description;//简介

    @Column(name = "subject_si")
    private String subject;//学科设置

    @Column(name = "term_si")
    private String term;//录取条件

    @Column(name = "honour_si")
    private String honour;//院校成就

    @Column(name = "price_ck_si")
    private String priceCk;//费用参考

    @ManyToOne
    @JoinColumn(name = "nation_id_si")
    private NationInfo nation;//所属国家

    @Column(name = "fly_dic_si")
    private String flyDic;//飞出国宝典

    @Column(name = "enable_si")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.EnableEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private EnableEnum enable;//有效

    @OneToOne
    @JoinTable(name = "school_logo_pic_slp",
            joinColumns = {@JoinColumn(name = "school_id_slp")},
            inverseJoinColumns = {@JoinColumn(name = "photo_id_slp")})
    private Photo logoPhoto;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "school_detail_pic_sdp",
            joinColumns = {@JoinColumn(name = "school_id_sdp")},
            inverseJoinColumns = {@JoinColumn(name = "photo_id_sdp")})
    private List<Photo> detailPhotos;

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

    public String getOwnname() {
        return ownname;
    }

    public void setOwnname(String ownname) {
        this.ownname = ownname;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getHonour() {
        return honour;
    }

    public void setHonour(String honour) {
        this.honour = honour;
    }

    public String getPriceCk() {
        return priceCk;
    }

    public void setPriceCk(String priceCk) {
        this.priceCk = priceCk;
    }

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
    }

    public String getFlyDic() {
        return flyDic;
    }

    public void setFlyDic(String flyDic) {
        this.flyDic = flyDic;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }

    public Photo getLogoPhoto() {
        return logoPhoto;
    }

    public void setLogoPhoto(Photo logoPhoto) {
        this.logoPhoto = logoPhoto;
    }

    public List<Photo> getDetailPhotos() {
        return detailPhotos;
    }

    public void setDetailPhotos(List<Photo> detailPhotos) {
        this.detailPhotos = detailPhotos;
    }
}
