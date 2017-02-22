package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.common.hibernate.GBKOrder;
import com.flyout.domain.NationInfo;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@Repository
public class NationDaoImpl extends BaseHibernateDao<NationInfo, Long> {
    public NationInfo getNationByName(String name) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.add(Restrictions.eq("name", name));
        List<NationInfo> nationInfoList = query(dc);
        if (nationInfoList.size() > 0) {
            return nationInfoList.get(0);
        }
        return null;
    }

    public List<NationInfo> findByName(String name) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        if (name != null) {
            dc.add(Restrictions.eq("name", name));
        }
        dc.addOrder(GBKOrder.asc("name"));
        return query(dc);
    }
}
