package com.flyout.service;

import com.flyout.common.enums.BlogCategoryEnum;
import com.flyout.dao.BlogDaoImpl;
import com.flyout.domain.Blog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@Service
public class BlogServiceImpl {
    @Resource
    private BlogDaoImpl blogDao;

    public List<Blog> getRecommend(Integer limit, BlogCategoryEnum category) {
        return blogDao.list(limit, category);
    }
}
