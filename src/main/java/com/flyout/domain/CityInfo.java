package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/14 22:06.
 * description:
 */
@Entity
@Table(name = "city_info_ci")
public class CityInfo {
    @Id
    @GeneratedValue
    @Column(name = "id_ci")
    private Long id;

    @Column(name = "name_ci")
    private String name;

    @Column(name = "enable_ci")
    private Boolean enable;

    @Column(name = "hot_ci")
    private Boolean hot;

    @ManyToOne
    @JoinColumn(name = "nation_id_ci")
    private NationInfo nation;

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

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
    }
}
