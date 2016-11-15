package com.flyout.controller;

import com.flyout.common.dto.PaginationDto;
import com.flyout.domain.Product;
import com.flyout.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LiMeiyuan on 2016/11/15 9:52.
 * description: 留学优选 控制层
 */
@Controller
@RequestMapping("abroadRecommend")
public class AbroadRecommendController {
    @Autowired
    private ProductServiceImpl productService;

    @RequestMapping("index")
    public String index() {
        return "abroad/index";
    }

    @RequestMapping("getRecommend")
    public PaginationDto<Product> getRecommend() {
        PaginationDto<Product> dto = new PaginationDto<>();
        dto.autoFill(productService.getRecommend());
        return dto;
    }

    @RequestMapping("query")
    public PaginationDto<Product> query(String name) {
        PaginationDto<Product> dto = new PaginationDto<>();
        dto.autoFill(productService.query(name));
        return dto;
    }
}
