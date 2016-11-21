package com.flyout.controller;

import com.flyout.common.dto.PaginationDto;
import com.flyout.domain.SuccessCase;
import com.flyout.service.SuccessCaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LiMeiyuan on 2016/11/18 17:17.
 * description:
 */
@Controller
@RequestMapping("successCase")
public class SuccessCaseController {
    @Autowired
    private SuccessCaseServiceImpl successCaseService;

    @RequestMapping("index")
    public String index() {
        return "successcase/index";
    }

    @RequestMapping("detail")
    public String detail(Long id) {
        return "successcase/detail";
    }

    @RequestMapping("list")
    @ResponseBody
    public PaginationDto<SuccessCase> list() {
        PaginationDto<SuccessCase> dto = new PaginationDto<>();
        dto.autoFill(successCaseService.list());
        return dto;
    }
}
