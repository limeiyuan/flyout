package com.flyout.controller;

import com.flyout.domain.Blog;
import com.flyout.service.BlogServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @RequestMapping("detail")
    private String detail(@RequestParam Long id, ModelMap map) {
        Blog blog = blogService.get(id);
        map.put("blog", blog);
        return "blog/detail";
    }
}
