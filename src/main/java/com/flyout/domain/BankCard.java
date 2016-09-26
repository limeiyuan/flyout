package com.flyout.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/9/26 15:14.
 * description:
 */
@Entity
@Table(name = "bank_card_bc")
public class BankCard {
    @Id
    @GeneratedValue
    @Column(name = "id_bc")
    private Long id;

    //银行卡号
    @Column(name = "number_bc")
    private String bankCardNo;

    @Column(name = "bank_name_bc")
    private String bankCardName;

    @Column(name = "subbranch_name_bc")
    private String subbranchName;

    @ManyToOne
    @JoinColumn(name = "account_id_bc")
    @JsonIgnore
    private Account account;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBankCardNo() {
        return bankCardNo;
    }

    public void setBankCardNo(String bankCardNo) {
        this.bankCardNo = bankCardNo;
    }

    public String getBankCardName() {
        return bankCardName;
    }

    public void setBankCardName(String bankCardName) {
        this.bankCardName = bankCardName;
    }

    public String getSubbranchName() {
        return subbranchName;
    }

    public void setSubbranchName(String subbranchName) {
        this.subbranchName = subbranchName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
