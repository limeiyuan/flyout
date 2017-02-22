package com.flyout.common.dto;

import com.flyout.common.OrderInfo;
import com.flyout.common.PaginationInfo;
import com.flyout.common.util.WebContextUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:42.
 * description:
 */
public class PaginationDto<T> extends BasicDto {
    private PaginationInfo pagination;
    private OrderInfo order;

    public PaginationInfo getPagination() {
        return pagination;
    }

    public void setPagination(PaginationInfo pagination) {
        this.pagination = pagination;
    }

    public OrderInfo getOrder() {
        return order;
    }

    public void setOrder(OrderInfo order) {
        this.order = order;
    }

    public void autoFill(List<T> results) {
        try {
            HttpServletRequest request = WebContextUtil.getRequest();
            pagination = new PaginationInfo();
            order = new OrderInfo();
            if (request != null) {
                if (request.getParameter("pageNo") != null) {
                    if (request.getAttribute("pageCount") != null && request.getAttribute("count") != null) {
                        int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
                        if (pageCount == 0) {
                            pagination.setPageCount(1);
                        } else {
                            pagination.setPageCount(pageCount);
                        }
                        pagination.setCount(Long.parseLong(request.getAttribute("count").toString()));
                        pagination.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
                        if (pagination.getPageNo() > pageCount) {
                            pagination.setPageNo(pageCount);
                        }
                    }
                }
                if (request.getParameter("order") != null) {
                    order.setName(request.getParameter("order"));
                    order.setSequence(request.getParameter("sequence"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        super.setData(results);
    }
}
