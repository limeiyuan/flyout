package com.flyout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by LiMeiyuan on 2016/11/25 16:57.
 * description:
 */
@Controller
public class BaseController {
    @RequestMapping("path")
    private String getPath(@RequestParam String path) {
        return path;
    }
}
