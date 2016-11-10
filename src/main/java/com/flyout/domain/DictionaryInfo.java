package com.flyout.domain;

import com.flyout.common.enums.EnableEnum;
import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/9/26 15:13.
 * description:
 */
@Entity
@Table(name = "dictionary_info_di")
public class DictionaryInfo {
    @Id
    @GeneratedValue
    @Column(name = "id_di")
    private Long id;

    @Column(name = "name_di")
    private String name;

    @Column(name = "type_di")
    private String type;

    @Column(name = "enable_di")
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
        this.enable = enable;
    }
}
