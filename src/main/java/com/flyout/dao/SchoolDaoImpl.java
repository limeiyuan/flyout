package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.SchoolInfo;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:27.
 * description:
 */
@Repository
public class SchoolDaoImpl extends BaseHibernateDao<SchoolInfo, Long> {
    public List<SchoolInfo> findByName(String name) {
        DetachedCriteria dc = createDetachedCriteria();
        if (name != null) {
            Criterion nameCri = Restrictions.like("name", name);
            Criterion eNameCri = Restrictions.like("ownname", name);
            dc.add(Restrictions.or(nameCri, eNameCri));
        }
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        return query(dc);
    }
}
