package com.flyout.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2016/11/14 16:32.
 * description: 短信发送历史记录
 */
@Entity
@Table(name = "Sms_History_sh")
public class SMSHistory {
    @Id
    @GeneratedValue
    @Column(name = "id_sh")
    private Long id;

    @Column(name = "tel_sh")
    private String tel;

    @Column(name = "ip_sh")
    private String ip;

    @Column(name = "createTime_sh")
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
