package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.Adviser;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;
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

    public List<Adviser> findRecommend() {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.setProjection(Projections.projectionList()
                .add(Projections.property("photo"), "photo")
                .add(Projections.property("screenname"), "screenname")
                .add(Projections.property("shortDescription"), "shortDescription")
                .add(Projections.property("speciality"), "speciality")).setResultTransformer(Transformers.aliasToBean(Adviser.class));
        dc.getExecutableCriteria(getSession()).setMaxResults(10);
        dc.addOrder(Order.desc("score"));
        dc.addOrder(Order.asc("id"));
        return dc.getExecutableCriteria(getSession()).list();
    }

    public List<Adviser> findAdvisers(String keyword) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        if (!StringUtils.isBlank(keyword)) {
            Criterion a = Restrictions.like("screenName", "%" + keyword + "%");
            Criterion b = Restrictions.like("username", "%" + keyword + "%");
            dc.add(Restrictions.or(a, b));
        }
        dc.addOrder(Order.desc("score"));
        dc.addOrder(Order.asc("id"));
        return queryBase(dc);
    }
}
