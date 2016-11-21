package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.Adviser;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/10 15:03.
 * description:
 */
@Repository
public class AdviserDaoImpl extends BaseHibernateDao<Adviser, Long> {
    public Adviser findByUsername(String username) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("username", username));
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        List<Adviser> accounts = query(dc);
        if (accounts.size() == 1) {
            return accounts.get(0);
        }
        return null;
    }
}
