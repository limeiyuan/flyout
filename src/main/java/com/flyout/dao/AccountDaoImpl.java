package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.domain.Account;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/9/26 15:58.
 * description:
 */
@Repository
public class AccountDaoImpl extends BaseHibernateDao<Account, Long> {
    public Account findByUsername(String username) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("userName", username));
        dc.add(Restrictions.eq("enable", 1));
        List<Account> accounts = query(dc);
        if (accounts.size() == 1) {
            return accounts.get(0);
        }
        return null;
    }
}
