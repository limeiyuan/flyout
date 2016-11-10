package com.flyout.common.dto;

import com.flyout.common.util.WebContextUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:42.
 * description:
 */
public class PaginationDto<T> extends BasicDto {
    private Long totalCount;
    private Integer count;
    private Integer pageNo;
    private Integer pageSize;
    private Integer pageCount;

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public void autoFill(List<T> results) {
        try {
            HttpServletRequest request = WebContextUtil.getRequest();
            if (request != null) {
                if (request.getParameter("pageNo") != null) {
                    if (request.getAttribute("pageCount") != null && request.getAttribute("count") != null) {
                        int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
                        if (pageCount == 0) {
                            this.pageCount = 1;
                        }
                        this.totalCount = Long.parseLong(request.getAttribute("count").toString());
                        this.pageNo = Integer.parseInt(request.getParameter("pageNo"));
                        if (pageNo > pageCount) {
                            pageNo = pageCount;
                        }
                        this.pageSize = Integer.parseInt(request.getParameter("pageSize"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        this.count = results.size();
        super.setData(results);
    }
}
