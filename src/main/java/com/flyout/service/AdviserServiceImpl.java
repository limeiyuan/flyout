package com.flyout.service;

import com.flyout.dao.AdviserDaoImpl;
import com.flyout.domain.Adviser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/10 15:04.
 * description:
 */
@Service
public class AdviserServiceImpl {
    @Autowired
    private AdviserDaoImpl adviserDao;

    public List<Adviser> getRecommendAdviser() {
        return adviserDao.findAdvisers(null, 10);
    }
}
