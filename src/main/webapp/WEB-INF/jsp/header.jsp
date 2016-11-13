<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .header {
        height: 180px;
        font-size: 12px;
        font-family: 微软雅黑;
    }

    .header_center {
        margin: 0 auto;
        width: 1200px;
    }

    .top {
        background: #f7f7f7;
        height: 30px;
        color: #666;
        padding-top: 10px;
        line-height: 12px;
    }

    .banner {
    }

    .banner > .menu {
        display: inline;
        float: right;
    }

    .banner > .menu div {
        color: black;
        display: inline;
        border-right: solid #999 1px;
        height: 14px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .banner > .menu div > img {
        width: auto;
        height: auto;
        vertical-align: top;
    }

    .banner > .menu span {
        padding-left: 5px;
        padding-right: 5px;
    }

    .banner > .menu a {
        color: black;
        display: inline;
    }

    .banner > .menu a:hover {
        text-decoration: none;
    }

    .banner > .menu a:visited {
        text-decoration: none;
    }

    #username {
        color: #ff3636;
    }

    .topCenter {
        height: 100px;
        text-align: center;
    }

    .topCenter div {
        /*display: inline;*/
        position: relative;
        top: 50%;
        transform: translateY(-50%);
    }

    .topCenter img {
        width: auto;
        height: auto;
    }

    .searchBar {
        display: inline-block;
        width: 500px;
        height: 35px;
        border: solid #0099ec 1px;
        margin: 0 auto;
    }

    .searchBar div {
        display: inline;
    }

    .searchBar input {
        border: 0 solid;
    }

    .searchBar input:focus {
        outline: none;
    }

    .navigation {
        height: 50px;
        border: solid 1px;
    }

    .nav_button {
        width: 100px;
        height: 50px;
        border-radius: 0;
        font-family: 微软雅黑;
        font-size: 14px;
        background: transparent;
        color: #333;
    }

    .btn_active {
        background: #0099ec;
        color: #FFFFFF
    }
</style>
<div class="header">
    <div class="top">
        <div class="banner header_center">
            <div style="display: inline;">
                咨询热线：40012345678
            </div>
            <div class="menu">
                <div id="userShow"></div>
                <div><img src="<%=resourcePath%>/img/col.png"><span>目标院校</span></div>
                <div><img src="<%=resourcePath%>/img/more.png" style="padding-top: 1px"><span>更多服务</span>
                    <img src="<%=resourcePath%>/img/arrow_down.png" style="padding-top: 5px;">
                </div>
                <div>
                    <img src="<%=resourcePath%>/img/weibo.png" style="padding-right: 10px;padding-left: 3px">
                    <img src="<%=resourcePath%>/img/weixin.png">
                </div>
            </div>
        </div>
    </div>
    <div class="topCenter header_center">
        <div style="float: left;">
            <img src="<%=resourcePath%>/img/logo.png">
        </div>
        <div class="searchBar">
            <div style="height: 100%;width: 80px;color: #666;background: #f7f7f7;line-height: 35px;float: left;">
                <span>搜学校</span>
                <img src="<%=resourcePath%>/img/select.png" style="height: 4px;width: 5px;margin-left: 5px">
            </div>
            <div style="width: 330px;height: 100%;top: 7px;color: #999;">
                <input type="text" style="width: 330px;">
            </div>
            <div style="width: 80px;height: 100%;background: #0099ec;line-height: 35px;float: right;">
                <span style="color: #fff;font-size: 16px">搜索</span>
            </div>
        </div>
        <div style="float: right;height: 100%;">
            <img src="<%=resourcePath%>/img/tel.png" style="width: 30px;height: 35px;margin-top: 33px;">

            <div style="display: inline-block">
                <span style="display: block;font: 18px bold;color: #fb5454;">400-12345678</span>
                <span style="display: block;font-size: 12px;color: #666;">免费咨询电话 9:00-18:00</span>
            </div>
        </div>
    </div>
    <div class="navigation header_center row">
        <div class="col-md-2" style="padding-right: 0;">
            <button type="button" class="nav_button btn btn-primary btn-lg btn-block"
                    onclick="toUrl('product/index.htm')">
                产品管理
            </button>
        </div>
    </div>
</div>

<!-- 数据loading -->
<div id="queryCoverModal" style="display: none;" class="modal fade bs-example-modal-sm" tabindex="-1"
     role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="mySmallModalLabel">查询数据中</h4>
            </div>
            <div class="modal-body">
                喝杯咖啡，稍等片刻，正在飞速赶来......
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    var username = '123';
    if (!username) {
        $('#userShow').append('<a href="login.htm">登录</a>');
    } else {
        var _span = $('<span>');
        _span.append('Hi，');
        _span.append('<a href="person.htm" id="username">' + username);
        _span.append('&nbsp;&nbsp;<a href="logout.htm" id="logout">退出');
        $('#userShow').append(_span);
    }
</script>

<script type="text/javascript">
    function toUrl(url) {
        window.location = '<%=path%>' + '/' + url;
    }

    var navBtn = [];
    $('.nav_button').each(function (index, btn) {
    });
</script>
