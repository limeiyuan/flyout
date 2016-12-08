<%--
Created by IntelliJ IDEA.
User: LiMeiyuan
Date: 2016/12/7
Time: 22:38
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="../commonResource.jsp" %>
</head>
<style>
    .school_guarantee {
        width: 1200px;
        overflow: hidden;
        margin: 10px auto 0
    }

    .school_guarantee .location {
        padding-bottom: 5px;
    }
    .school_guarantee .location span a{
       color: #0099ec;text-decoration: none;
    }
    .school_guarantee .location span a:visited{
       text-decoration: none;
    }
    .school_guarantee .location img {
        margin-right: 6px;
    }

    .school_guarantee .location span {
        margin: 0 2px;
    }

    .guarantee_main {
    }

    .guarantee_main::after {
        visibility: hidden;
        display: block;
        font-size: 0;
        content: "";
        clear: both;
        height: 0
    }

    .guarantee_tab {
        width: 78%;
        border: 1px solid #eee;
        min-height: 920px;
    }

    .guarantee_ad {
        width: 20%;
        height: 500px;
    }

    .school_guarantee .guarantee_box {
        background: #E9E9E9;
        overflow: hidden;
    }

    .school_guarantee .guarantee_box li {
        float: left;
        padding: 0 20px;
        line-height: 36px;
        font-size: 14px;
        cursor: pointer;
    }

    .school_guarantee .guarantee_box li span {
        color: #0099ec;
    }

    .school_guarantee .guarantee_box .cur {
        background: #fff;
        border-top: 2px solid #0099ec;
    }

    .school_guarantee .guarantee_content {
        margin-top: 10px;
    }

    .guarantee_content > div {
        display: none;
        padding: 18px;
    }
    .guarantee_content > div img {
        display: block;
        margin: 0 auto 16px;
    }

    .guarantee_content > div.cur {
        display: block;
    }

    .guarantee_ad .ad_box {
        width: 100%;
        background: #EAEAEA;
        text-align: center;
        line-height: 300px;
        margin-bottom: 10px;
    }

    .guarantee_ad .ad_top {
        height: 300px;
    }

    .guarantee_ad .ad_bottom {
        height: 500px;
    }

    .study_packages {
        overflow: hidden;
        height: 330px;
        position: relative;
    }

    .study_packages .left_img {
        width: 35%;
        height: 330px;
    }

    .study_packages .right_tex {
        width: 60%;
    }

    .study_packages .left_img img {
        width: 100%;
        height: 100%;
    }

    .study_packages .right_tex h3 {
        font-size: 16px;
        font-weight: bold;
        color: #0099ec;
        margin: 8px 0;
    }

    .study_packages .right_tex span {
        color: red;
    }

    .study_packages .right_tex .ul_box {
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee;
    }

    .study_packages .right_tex ul {
        overflow: hidden;
        width: 66%;
    }

    .study_packages .right_tex .title_box {
        position: relative;
        margin-bottom: 20px;
    }

    .study_packages .right_tex .title_box span {
        position: absolute;
        top: 0;
        right: 0;
        border: 1px solid red;
        width: 60px;
        text-align: center;
        line-height: 20px;
        border-radius: 34px;
    }

    .study_packages .right_tex .title_box span::before {
        content: url("<%=resourcePath%>/img/home/like_slect.png");
        margin-right: 5px;
    }

    .study_packages .right_tex ul li {
        float: left;
        width: 50%;
        line-height: 40px;
        height: 40px;
    }

    .study_packages .right_tex ul li span a {
        color: red;
        font-size: 16px;
        font-weight: bold;
    }

    .study_packages .right_tex ul .text_img span {
        font-weight: bold;
        font-size: 14px;
    }

    .study_packages .right_tex ul .text_img, .study_packages .right_tex ul .text_evaluation {
        text-align: right;
    }

    .study_packages .right_tex ul .market_price span {
        color: #999;
        text-decoration: line-through;
    }

    .study_packages .right_tex ul li img {
        width: 16px;
        height: 15px;
        margin: 0 3px;
    }

    .study_packages .right_tex dl {
        overflow: hidden;
        margin: 20px 0 26px 0;
    }

    .study_packages .right_tex dl dt, .study_packages .right_tex dl dd {
        float: left;
    }

    .study_packages .right_tex dl dt {
        width: 10%
    }

    .study_packages .right_tex dl dd {
        width: 90%
    }

    .study_packages .right_tex dl dd p {
        margin-bottom: 5px;
    }

    .study_packages .right_tex dl dd span {
        color: #0099ec;
        margin: 0 5px;
    }

    .study_packages .right_tex .btnBox {
        width: 61%;
        overflow: hidden;
        cursor: pointer;
    }

    .study_packages .right_tex .btnBox span {
        width: 180px;
        text-align: center;
        border: 1px solid #0099ec;
        color: #0099ec;
        padding: 10px 0;
    }

    .study_packages .right_tex .btnBox .add_cart {
        background: #0099ec;
        color: #fff;
    }

    .study_packages .right_tex .service_agreement {
        position: absolute;
        bottom: 0;
    }

    .study_packages .right_tex .service_agreement img {
        width: 15px;
        height: 15px;
        vertical-align: bottom;
        margin-right: 5px;
    }

    .consultant {
        margin: 30px 0 50px;
        border: 1px solid #eee;
        padding-bottom: 20px;
    }

    .consultant ul {
        overflow: hidden;
        padding: 0 21px 0 31px;
    }

    .consultant li {
        width: 15.5%;
        float: left;
        margin: 26px 50px 0 0;
    }

    .consultant h4 {
        font-size: 14px;
        color: #999;
        background: #F0F0F0;
        padding: 10px 0;
        text-indent: 2rem;
    }

    .consultant .consultant_img {
        width: 120px;
        height: 120px;
        margin: auto;
    }

    .consultant .consultant_img img {
        width: 100%;
    }

    .consultant .consultant_name {
        text-align: center;
        margin: 10px 0;
    }

    .consultant .consultant_box {
        width: 86%;
        margin: auto;
    }

    .consultant .consultant_box span {
        width: 60px;
        border: 1px solid #0099ec;
        border-radius: 5px;
        padding: 7px 0;
        text-align: center;
        cursor: pointer;
    }

    .consultant .consultant_box .advisory {
        background: #0099ec;
        color: #fff;
    }
</style>
<body>
<%@include file="../header.jsp" %>
<div class="school_guarantee" ng-controller="mainController">
    <p class="location">
        <img src="<%=resourcePath%>/img/abroad/location.png"
             alt="所在位置">所在位置：<span><a href="javascript:void(0)">首页</a></span><span>></span><span><a href="javascript:void(0)">留学优选</a></span><span>></span><span><a href="javascript:void(0)">产品详情</a></span><span>></span><span> ${product.title}</span>
    </p>

    <div class="study_packages">
        <div class="left_img fl">
            <img src="${picPath}${product.photo.path}" alt="">
        </div>
        <div class="right_tex fr">
            <div class="title_box">
                <h3>${product.title}  飞出国推荐 </h3>
                <p>一站式服务 超高申请通过率</p>
                <span>收藏</span>
            </div>
            <div class="ul_box">
                <ul>
                    <li>优选价：<span>￥<a href="javascript:void(0)">${product.price}</a></span></li>
                    <li class="text_img"><img src="<%=resourcePath%>/img/abroad/start2.png" alt=""><img
                            src="<%=resourcePath%>/img/abroad/start2.png" alt=""><img
                            src="<%=resourcePath%>/img/abroad/start2.png" alt=""><img
                            src="<%=resourcePath%>/img/abroad/start2.png" alt=""><img
                            src="<%=resourcePath%>/img/abroad/start1.png" alt=""><span>4.9</span>
                    </li>
                    <li class="market_price">市场价：<span>${product.price}</span></li>
                    <li class="text_evaluation">累加评价：<span>324</span></li>
                </ul>
            </div>
            <dl>
                <dt>套餐包含:</dt>
                <dd><p><span>√</span>${product.highlight}</p>


            </dl>
            <div class="btnBox">
                <span class="add_cart fl">加入购物车</span>
                <span class="fr">马上咨询</span>
            </div>
            <p class="service_agreement">服务协议：<img src="<%=resourcePath%>/img/abroad/protection.jpg" alt="">消费者保障</p>
        </div>
    </div>
    <div class="consultant">
        <h4>顾问</h4>
        <ul>
            <li>
                <div class="consultant_img">
                    <img src="<%=resourcePath%>/img/account/avatar.png" alt="">
                </div>
                <p class="consultant_name">郭强</p>
                <div class="consultant_box">
                    <span class="advisory fl">咨询</span>
                    <span class="fr">签约</span>
                </div>
            </li>
            <li>
                <div class="consultant_img">
                    <img src="<%=resourcePath%>/img/account/avatar.png" alt="">
                </div>
                <p class="consultant_name">郭强</p>
                <div class="consultant_box">
                    <span class="advisory fl">咨询</span>
                    <span class="fr">签约</span>
                </div>
            </li>
        </ul>
    </div>


    <div class="guarantee_main">
        <div class="guarantee_tab fl">
            <ul class="guarantee_box">
                <li class="cur">详情介绍</li>
                <li>申请资格</li>
                <li>服务保障</li>
                <li>费用明细</li>
                <li>入学时间</li>
            </ul>
            <div class="guarantee_content">
                <div class="cur">
                    <img src="${picPath}${product.introPhoto.path!=null?product.introPhoto.path:'/fly/product/default.jpg'}" alt="">
                    <p>${product.intro}</p>
                </div>
                <div>${product.targetUsers}</div>
                <div>${product.detail}</div>
                <div>${product.priceDetail}</div>
                <div>${product.timePlace}</div>
            </div>
        </div>
        <div class="guarantee_ad fr">
            <div class="ad_box ad_top">预留广告位</div>
            <div class="ad_box ad_bottom">预留广告位</div>
        </div>
    </div>

</div>
<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
    });
</script>
<script>
    $(".guarantee_box li").click(function () {
        $(this).addClass("cur").siblings().removeClass('cur');
        $(".guarantee_content >div").eq($(".guarantee_box li").index(this)).show().siblings().hide();
    });
</script>
<%@include file="../footer.jsp" %>
</body>
</html>
