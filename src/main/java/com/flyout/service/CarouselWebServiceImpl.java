package com.flyout.service;

import com.flyout.dao.CarouselWebDaoImpl;
import com.flyout.domain.CarouselWeb;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2017/1/1.
 * Description:
 */
@Service
public class CarouselWebServiceImpl {
    @Resource
    private CarouselWebDaoImpl carouselWebDao;

    public List<CarouselWeb> getCarousels() {
        return carouselWebDao.getCarousels(7);
    }
}
