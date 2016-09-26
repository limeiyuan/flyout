package com.flyout.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2016/9/26 15:06.
 * description:
 */
@Entity
@Table(name = "photo_ph")
public class Photo implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "id_ph")
    private Long id;

    @Column(name = "path_ph")
    private String path;

    @Column(name = "type_ph")
    private String type;

    @Column(name = "upload_time_ph")
    private Date uploadTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
}
