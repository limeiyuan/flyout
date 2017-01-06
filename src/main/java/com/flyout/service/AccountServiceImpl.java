package com.flyout.service;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.util.AuthUtil;
import com.flyout.common.util.RandomUtil;
import com.flyout.dao.AccountDaoImpl;
import com.flyout.domain.Account;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2016/11/9 16:26.
 * description:
 */
@Service
public class AccountServiceImpl {
    @Resource
    private AccountDaoImpl accountDao;

    public Boolean isUsernameDulplicate(String username) {
        Account account = accountDao.findByUsername(username);
        return account == null;
    }

    public Account login(String loginName, String password) {
        Account account = accountDao.findByUsername(loginName);
        if (account != null) {
            if (AuthUtil.getPassword(password).equalsIgnoreCase(account.getPassword())) {
                return account;
            }
        }
        return null;
    }

    public void register(String username, String password) {
        Account account = new Account();
        account.setPassword(AuthUtil.getPassword(password));
        account.setUsername(username);
        account.setScreenname(username + "_" + RandomUtil.genRandomChar(4, RandomUtil.RandomType.NUMBER));
        accountDao.saveOrUpdate(account, null);
        AuthHelper.login(account);
    }

    public void save(Account account) {
        accountDao.saveOrUpdate(account, account.getId());
    }
}
