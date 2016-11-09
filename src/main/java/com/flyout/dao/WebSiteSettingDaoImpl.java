package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.domain.WebSiteSetting;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/10/9 15:14.
 * description:
 */
@Repository
public class WebSiteSettingDaoImpl extends BaseHibernateDao<WebSiteSetting, Long> {
    public WebSiteSetting getSetting() {
        List<WebSiteSetting> settings = this.findAll();
        if (settings.size() > 0) {
            return settings.get(settings.size() - 1);
        }
        return null;
    }
}
