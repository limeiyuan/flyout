package com.flyout.service;

import com.flyout.common.util.AuthUtil;
import com.flyout.dao.AccountDaoImpl;
import com.flyout.domain.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by LiMeiyuan on 2016/11/9 16:26.
 * description:
 */
@Service
public class AccountServiceImpl {
    @Autowired
    private AccountDaoImpl accountDao;

    public Account login(String loginName, String password) {
        Account account = accountDao.findByUsername(loginName);
        if (account != null) {
            if (AuthUtil.getPassword(password).equalsIgnoreCase(account.getPassword())) {
                return account;
            }
        }
        return null;
    }
}
