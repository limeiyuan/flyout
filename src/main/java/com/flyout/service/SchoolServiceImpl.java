package com.flyout.service;

import com.flyout.dao.SchoolDaoImpl;
import com.flyout.domain.SchoolInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:26.
 * description:
 */
@Service
public class SchoolServiceImpl {
    @Resource
    private SchoolDaoImpl schoolDao;

    public List<SchoolInfo> getSchoolList(String name) {
        return schoolDao.findByName(name);
    }

    public SchoolInfo getSchool(Long id) {
        return schoolDao.find(id);
    }
}
