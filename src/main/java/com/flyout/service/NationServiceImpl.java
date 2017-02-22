package com.flyout.service;

import com.flyout.dao.NationDaoImpl;
import com.flyout.domain.NationInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@Service
public class NationServiceImpl {
    @Resource
    private NationDaoImpl nationDao;

    public NationInfo getNationByName(String name) {
        return nationDao.getNationByName(name);
    }

    public List<NationInfo> getNations(String name) {
        return nationDao.findByName(name);
    }
}
