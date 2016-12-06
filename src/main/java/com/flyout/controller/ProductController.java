package com.flyout.controller;

import com.flyout.common.dto.PaginationDto;
import com.flyout.common.enums.CategoryEnum;
import com.flyout.domain.Product;
import com.flyout.service.ProductServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2016/12/6.
 * Description: 产品控制层，提供产品查询等服务
 */
@Controller
@RequestMapping("product")
public class ProductController {
    @Resource
    private ProductServiceImpl productService;

    @RequestMapping("getRecommend")
    @ResponseBody
    public PaginationDto<Product> getRecommend(CategoryEnum category) {
        PaginationDto<Product> dto = new PaginationDto<>();
        dto.setResult(true);
        dto.autoFill(productService.getRecommend(category, null));
        return dto;
    }
}
