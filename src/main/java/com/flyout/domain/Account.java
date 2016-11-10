package com.flyout.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/9/26 14:39.
 * description:
 */
@Entity
@Table(name = "account_ac")
public class Account {
    @Id
    @GeneratedValue
    @Column(name = "id_ac")
    private Long id;

    @Column(name = "userpwd_ac")
    private String password;

    @Column(name = "opentype_ac")
    private int opentype; // 1:weibo 2:weixin 3:qq

    @Column(name = "openid_ac")
    private String openid;

    @Column(name = "photo_ac")
    private String imgpath;

    @Column(name = "username_ac")
    private String username;

    @Column(name = "userpwd_ac")
    private String userpwd;

    @Column(name = "screenname_ac")
    private String screenname;

    @Column(name = "sex_ac")
    private Boolean sex;

    @Column(name = "phonearea_ac")
    private String phonearea;

    @Column(name = "phonenumber_ac")
    private String phonenumber;

    @Column(name = "birthday_ac")
    private String birthday;//生日

    @Column(name = "email_ac")
    private String email;

    @ManyToOne
    @JoinColumn(name = "target_country_ac")
    private NationInfo nation;//目标国家

    @ManyToOne
    @JoinColumn(name = "target_school_ac")
    private SchoolInfo school;//目标学校

    @ManyToOne
    @JoinColumn(name = "schooling_ac")
    private DictionaryInfo schooling;//学费区间

    @Column(name = "study_date_ac")
    private String studyDate;//留学日期

    @ManyToOne
    @JoinColumn(name = "photo_id_ac")
    private Photo photo;//头像

    @ManyToOne
    @JoinTable(name = "account_invitation_ship_ais",
            joinColumns = {@JoinColumn(name = "account_id_ais")},
            inverseJoinColumns = {@JoinColumn(name = "inviter_id_ais")})
    @JsonBackReference
    private Account inviter;

    @OneToMany(mappedBy = "inviter")
    @JsonManagedReference
    private List<Account> invitedAccounts;

    @OneToMany(mappedBy = "account")
    private List<BankCard> bankCards;

    @Column(name = "type_ac")
    private String type;//用户类型：学生，顾问

    @Column(name = "isbuddy_ac")
    private Boolean isbuddy;//是否是buddy

    @Column(name = "lifeold_ac")
    private Integer lifeOld;//如果是buddy，需要填写海外生活的时间，单位年

    @Column(name = "adviser_type_ac")
    private String adviserType;//顾问类型：国内，国外

    @Column(name = "work_time_ac")
    private String workTime;//顾问工作时间

    @Column(name = "description_ac")
    private String description;//顾问简介

    @Column(name = "createtime_ac")
    private Date creattime;

    @Column(name = "token_ac")
    private String token;//融云token

    @Column(name = "enable_ac")
    private Boolean enable;

    @Column(name = "invitation_ac")
    private String invitationCode;

    @Column(name = "balance", columnDefinition = "decimal(10,2) DEFAULT '0.00'")
    private BigDecimal balance = BigDecimal.valueOf(0);

    @Column(name = "profit", columnDefinition = "decimal(10,2) DEFAULT '0.00'")
    private BigDecimal profit = BigDecimal.valueOf(0);

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getOpentype() {
        return opentype;
    }

    public void setOpentype(int opentype) {
        this.opentype = opentype;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getScreenname() {
        return screenname;
    }

    public void setScreenname(String screenname) {
        this.screenname = screenname;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getPhonearea() {
        return phonearea;
    }

    public void setPhonearea(String phonearea) {
        this.phonearea = phonearea;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
    }

    public SchoolInfo getSchool() {
        return school;
    }

    public void setSchool(SchoolInfo school) {
        this.school = school;
    }

    public DictionaryInfo getSchooling() {
        return schooling;
    }

    public void setSchooling(DictionaryInfo schooling) {
        this.schooling = schooling;
    }

    public String getStudyDate() {
        return studyDate;
    }

    public void setStudyDate(String studyDate) {
        this.studyDate = studyDate;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public Account getInviter() {
        return inviter;
    }

    public void setInviter(Account inviter) {
        this.inviter = inviter;
    }

    public List<Account> getInvitedAccounts() {
        return invitedAccounts;
    }

    public void setInvitedAccounts(List<Account> invitedAccounts) {
        this.invitedAccounts = invitedAccounts;
    }

    public List<BankCard> getBankCards() {
        return bankCards;
    }

    public void setBankCards(List<BankCard> bankCards) {
        this.bankCards = bankCards;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getIsbuddy() {
        return isbuddy;
    }

    public void setIsbuddy(Boolean isbuddy) {
        this.isbuddy = isbuddy;
    }

    public Integer getLifeOld() {
        return lifeOld;
    }

    public void setLifeOld(Integer lifeOld) {
        this.lifeOld = lifeOld;
    }

    public String getAdviserType() {
        return adviserType;
    }

    public void setAdviserType(String adviserType) {
        this.adviserType = adviserType;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public String getInvitationCode() {
        return invitationCode;
    }

    public void setInvitationCode(String invitationCode) {
        this.invitationCode = invitationCode;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public BigDecimal getProfit() {
        return profit;
    }

    public void setProfit(BigDecimal profit) {
        this.profit = profit;
    }
}
