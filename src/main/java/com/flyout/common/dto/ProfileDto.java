package com.flyout.common.dto;

import com.flyout.common.enums.EnableEnum;
import com.flyout.common.enums.SexEnum;
import com.flyout.domain.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/14 11:04.
 * description: 个人档案dto
 */
public class ProfileDto {
    private Long id;
    private String imgpath;
    private String username;
    private String screenname;
    private SexEnum sex;
    private String phonearea;
    private String phonenumber;
    private String birthday;//生日
    private String email;
    private NationInfo nation;//目标国家
    private SchoolInfo school;//目标学校
    private String studyDate;//留学日期
    private Photo photo;//头像
    private Account inviter;
    private List<Account> invitedAccounts;
    private List<BankCard> bankCards;
    private EnableEnum enable;
    private String invitationCode;
    private BigDecimal balance = BigDecimal.valueOf(0);
    private BigDecimal profit = BigDecimal.valueOf(0);

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getScreenname() {
        return screenname;
    }

    public void setScreenname(String screenname) {
        this.screenname = screenname;
    }

    public SexEnum getSex() {
        return sex;
    }

    public void setSex(SexEnum sex) {
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

    public EnableEnum getEnable() {
        return enable;
    }

    public void setEnable(EnableEnum enable) {
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

    public static ProfileDto fromAccount(Account account) {
        ProfileDto dto = new ProfileDto();
        dto.setBalance(account.getBalance());
        dto.setBankCards(account.getBankCards());
        dto.setBirthday(account.getBirthday());
        dto.setEmail(account.getEmail());
        dto.setEnable(account.getEnable());
        dto.setId(account.getId());
        dto.setImgpath(account.getImgpath());
        dto.setInvitationCode(account.getInvitationCode());
        dto.setInvitedAccounts(account.getInvitedAccounts());
        dto.setInviter(account.getInviter());
        dto.setNation(account.getNation());
        dto.setPhonearea(account.getPhonearea());
        dto.setPhonenumber(account.getPhonenumber());
        dto.setPhoto(account.getPhoto());
        dto.setProfit(account.getProfit());
        dto.setSchool(account.getSchool());
        dto.setScreenname(account.getScreenname());
        dto.setSex(account.getSex());
        dto.setStudyDate(account.getStudyDate());
        dto.setUsername(account.getUsername());
        return dto;
    }
}
