package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by LiMeiyuan on 2016/9/26 15:06.
 * description:
 */
@Entity
@Table(name = "nation_info_ni")
public class NationInfo implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "id_ni")
    private Long id;

    @Column(name = "name_ni")
    private String name;

    @ManyToOne
    @JoinColumn(name = "photo_id_ni")
    private Photo photo;

    @Column(name = "enable_ni")
    @Type(type = "com.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.EnableEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })
    private EnableEnum enable;

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

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }
}
