package com.flyout.service;

import com.flyout.dao.SuccessCaseDaoImpl;
import com.flyout.domain.SuccessCase;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/18 16:58.
 * description:
 */
@Service
public class SuccessCaseServiceImpl {
    @Resource
    private SuccessCaseDaoImpl successCaseDao;

    public List<SuccessCase> list() {
        return successCaseDao.list(null);
    }

    public List<SuccessCase> getRecommend() {
        return successCaseDao.list(15);
    }
}
