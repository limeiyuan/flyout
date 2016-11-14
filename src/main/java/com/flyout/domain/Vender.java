package com.flyout.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2016/11/14 22:07.
 * description:
 */
@Entity
@Table(name = "vender_info_vi")
public class Vender {
    @Id
    @GeneratedValue
    @Column(name = "id_vi")
    private Long id;

    @Column(name = "vender_name_vi")
    private String venderName;

    @Column(name = "vender_tel_vi")
    private String tel;

    @Column(name = "vender_email_vi")
    private String email;

    @Column(name = "vender_address_vi")
    private String address;

    @Column(name = "vender_description_vi")
    private String description;

    @ManyToOne
    @JoinColumn(name = "photo_id_vi")
    private Photo photo;

    @Column(name = "createtime_vi")
    private Date createTime;

    @Column(name = "enable_vi")
    private Boolean enable;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVenderName() {
        return venderName;
    }

    public void setVenderName(String venderName) {
        this.venderName = venderName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }
}
