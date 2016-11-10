package com.flyout.controller;

import com.flyout.common.dto.BasicDto;
import com.flyout.common.dto.PaginationDto;
import com.flyout.domain.SchoolInfo;
import com.flyout.service.SchoolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LiMeiyuan on 2016/11/9 21:15.
 * description:
 */
@Controller
@RequestMapping("school")
public class SchoolController {
    @Autowired
    private SchoolServiceImpl schoolService;

    @RequestMapping("index")
    public String index() {
        return "school/list";
    }

    @RequestMapping("list")
    public BasicDto getSchoolList(String name) {
        PaginationDto<SchoolInfo> dto = new PaginationDto<>();
        dto.autoFill(schoolService.getSchoolList(name));
        return dto;
    }
}
