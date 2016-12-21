package com.flyout.service;

import com.flyout.dao.AdviserDaoImpl;
import com.flyout.domain.Adviser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/10 15:04.
 * description:
 */
@Service
public class AdviserServiceImpl {
    @Resource
    private AdviserDaoImpl adviserDao;

    public List<Adviser> getRecommendAdviser() {
        return adviserDao.findRecommend();
    }
}
