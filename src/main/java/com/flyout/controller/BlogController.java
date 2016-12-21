package com.flyout.controller;

import com.flyout.service.BlogServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@Controller
@RequestMapping("blog")
public class BlogController {
    @Resource
    private BlogServiceImpl blogService;
}
