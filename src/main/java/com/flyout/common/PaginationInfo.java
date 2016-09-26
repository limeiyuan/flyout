package com.flyout.common;

/**
 * Created by LiMeiyuan on 2016/9/26 15:40.
 * description:
 */
public class PaginationInfo {
    /** 记录总数 **/
    private int count;

    /** 每页行数 **/
    private int pageRows = 30;

    /** 当前页数 **/
    private int pageNum;

    /** 总页数 **/
    private int pageCount;

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageRows() {
        return pageRows;
    }

    public void setPageRows(int pageRows) {
        this.pageRows = pageRows;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
}
