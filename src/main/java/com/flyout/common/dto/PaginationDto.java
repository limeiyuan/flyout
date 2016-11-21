package com.flyout.common.dto;

import com.flyout.common.util.WebContextUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:42.
 * description:
 */
public class PaginationDto<T> extends BasicDto {
    private Pagination pagination;

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public void autoFill(List<T> results) {
        try {
            HttpServletRequest request = WebContextUtil.getRequest();
            pagination = new Pagination();
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        super.setData(results);
    }
}
