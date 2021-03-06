package com.flyout.controller;

import com.flyout.common.dto.PaginationDto;
import com.flyout.domain.Product;
import com.flyout.service.ProductServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2016/11/15 9:52.
 * description: 留学优选 控制层
 */
@Controller
@RequestMapping("abroadRecommend")
public class AbroadRecommendController {
    @Resource
    private ProductServiceImpl productService;

    @RequestMapping("index")
    public String index() {
        return "abroad/index";
    }

    @RequestMapping("query")
    @ResponseBody
    public PaginationDto<Product> query(String name) {
        PaginationDto<Product> dto = new PaginationDto<>();
        dto.autoFill(productService.query(name));
        return dto;
    }
}
