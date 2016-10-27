package com.flyout.controller;

import com.flyout.common.dto.BasicDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LiMeiyuan on 2016/9/27 10:00.
 * description: 主页控制层
 */
@Controller
@RequestMapping("home")
public class HomeController {
    @RequestMapping("getOnlineCount")
    @ResponseBody
    public BasicDto getOnlineCount() {
        BasicDto basicDto = new BasicDto();
        basicDto.setResult(true);
        basicDto.setData(22);
        return basicDto;
    }

    @RequestMapping("getHomeData")
    @ResponseBody
    public BasicDto getHomeData() {
        return new BasicDto();
    }
}
