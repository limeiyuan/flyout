package com.flyout.service;

import com.flyout.dao.SMSHistoryDaoImpl;
import com.flyout.domain.SMSHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by LiMeiyuan on 2016/11/14 16:44.
 * description:
 */
@Service
public class SMSHistoryServiceImpl {
    @Autowired
    private SMSHistoryDaoImpl smsHistoryDao;

    public void save(String ip, String tel) {
        SMSHistory history = new SMSHistory();
        history.setIp(ip);
        history.setTel(tel);
        history.setCreateTime(new Date());
        smsHistoryDao.saveOrUpdate(history, null);
    }

    public Integer getCountByTel(String tel) {
        return smsHistoryDao.findByTel(tel);
    }

    public Integer getCountByIp(String ip) {
        return smsHistoryDao.findByIp(ip);
    }

    public void removeHistory() {
        smsHistoryDao.removeHistory();
    }
}
