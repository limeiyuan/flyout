package com.flyout.controller;

import com.flyout.common.dto.BasicDto;
import com.flyout.service.AccountServiceImpl;
import com.flyout.service.AdviserServiceImpl;
import com.flyout.service.SchoolServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/9/27 10:00.
 * description: 主页控制层
 */
@Controller
@RequestMapping("home")
public class HomeController {
    @Autowired
    private AdviserServiceImpl adviserService;

    @Autowired
    private SchoolServiceImpl schoolService;

    @Autowired
    private AccountServiceImpl accountService;

    @RequestMapping("home")
    public String home() {
        return "home";
    }

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
        BasicDto dto = new BasicDto();
        Map<String, Object> data = new HashMap<>();
        data.put("advisers", adviserService.getRecommendAdviser());
        dto.setData(data);
        return dto;
    }
}
