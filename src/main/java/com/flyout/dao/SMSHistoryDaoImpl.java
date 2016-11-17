package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.domain.SMSHistory;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/11/14 16:36.
 * description:
 */
@Repository
public class SMSHistoryDaoImpl extends BaseHibernateDao<SMSHistory, Long> {
    public Integer findByTel(String tel) {
        Map<String, Object> params = new HashMap<>(2);
        params.put("tel", tel);
        params.put("createTime", new Date(new Date().getTime() - 24 * 60 * 60 * 1000));
        return count("from SMSHistory s where s.tel=:tel and s.createTime>:createTime", params);
    }

    public Integer findByIp(String ip) {
        Map<String, Object> params = new HashMap<>(2);
        params.put("ip", ip);
        params.put("createTime", new Date(new Date().getTime() - 24 * 60 * 60 * 1000));
        return count("from SMSHistory s where s.ip=:ip and s.createTime>:createTime", params);
    }

    public void removeHistory() {
        Map<String, Object> params = new HashMap<>(1);
        params.put("createTime", new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000));
        count("delete from Sms_History_sh where createTime_sh>:createTime", params);
    }
}
