package com.flyout.service;

import com.flyout.dao.WebSiteSettingDaoImpl;
import com.flyout.domain.WebSiteSetting;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2016/10/9 15:16.
 * description:
 */
@Service
public class WebSiteSettingServiceImpl {
    @Resource
    private WebSiteSettingDaoImpl webSiteSettingDao;

    public WebSiteSetting getSetting() {
        return webSiteSettingDao.getSetting();
    }
}
