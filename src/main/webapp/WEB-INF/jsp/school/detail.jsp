<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/12/1
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../commonResource.jsp" %>
    <style>
        .banner {
            position: relative;
            height: 400px;
            background: url("<%=resourcePath%>/img/school/abroad_univer.png");
        }

        .banner img {
            width: 100%;
            height: 100%;
        }

        .banner .school_intre {
            margin: auto;
            width: 1200px;
        }

        .banner .school_intre .schoo_dagai {
            top: 0;
            float: right;
            height: 100%;
            width: 230px;
        }

        .banner .school_intre .school_xqt {
            background: #0099ec;
            height: 40%;
        }

        .banner .school_intre .school_xqt > div {
            padding-top: 16px;
        }

        .banner .school_intre .school_xqt p {
            text-align: center;
            color: #fff;
            padding: 2px 0;
        }

        .banner .school_intre .school_xqt p span {
            color: #f88b00
        }

        .banner .school_intre .school_xqt .name {
            font-size: 16px;
        }

        .banner .school_intre .school_xqt .rank {
            font-size: 14px;
        }

        .banner .school_intre .school_xqc {
            background: #fff;
            height: 60%;
            opacity: .8;
        }

        .banner .school_intre .school_xqc ul {
            position: relative;
            top: 80px;
        }

        .banner .school_intre .school_xqc li {
            text-align: center;
            padding: 0 10px;
            height: 21px;
        }

        .banner .school_intre .school_xqc li span {
            color: red;
        }

        .banner .school_intre .school_xqc .btn_next {
            color: #fff;
            position: absolute;
            bottom: 10px;
            width: 200px;
            margin-left: 15px
        }

        .banner .school_intre .school_xqc .btn_next span {
            display: inline-block;
            width: 90px;
            height: 32px;
            border-radius: 60px;
            line-height: 32px;
            text-align: center;
            cursor: pointer;
            background: red;
        }

        .banner .school_intre .school_xqc .btn_next .sever_info {
            background: #0099ec;
        }

        .banner .school_img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: 27%;
            background: #000;
            margin-left: 65px;
        }

        .banner .school_img img {
            border-radius: 50%;
        }

        .school_detail {
            width: 1200px;
            overflow: hidden;
            margin: 5px auto 0
        }

        .school_detail .location {
            padding-bottom: 5px;
        }

        .school_detail .location img {
            margin-right: 6px;
        }

        .school_detail .location span {
            margin: 0 2px;
        }

        .school_detail .school_detail {
            width: 78%;
        }

        .school_detail .school_ranking {
            width: 20%;
        }

        .school_detail .school_info {
            background: #E9E9E9;
            overflow: hidden;
        }

        .school_detail .school_info li {
            float: left;
            padding: 0 17px;
            line-height: 36px;
            font-size: 14px;
            cursor: pointer;
        }

        .school_detail .school_info .cur {
            color: #0099ec;
            background: #fff;
        }

        .school_detail .school_content {
            margin-top: 10px;
            color: #999;
            text-indent: 2em;
            font-size: 1.5em;
            font-family: '微软雅黑';
        }

        .school_content > div {
            display: none;
            border: 1px solid #eee;
            padding: 18px 10px;
            min-height: 700px;
        }

        .school_content > div.cur {
            display: block;
        }

        /*学校排名*/
        .school_ranking > div {
            border: 1px solid #eee;
        }

        .school_ranking .ranking_list {
            padding: 0 0 10px 30px;
        }

        .school_ranking .ranking_list h3 {
            margin: 16px;
            font-size: 14px;
            font-weight: bold;
            color: #0099ec;
        }

        .school_ranking .ranking_list ul li {
            margin: 12px 0;
            font-size: 12px;
        }

        .school_ranking .ranking_list ul li span {
            display: inline-block;
            width: 18px;
            height: 18px;
            color: #fff;
            background: #ccc;
            text-align: center;
            line-height: 18px;
            margin-right: 14px;
            border-radius: 3px;
        }

        .school_ranking .ranking_list ul .first, .school_ranking .ranking_list ul .first span {
            color: red;
        }

        .school_ranking .ranking_list ul .second, .school_ranking .ranking_list ul .second span {
            color: #f88b00
        }

        .school_ranking .ranking_list ul .third, .school_ranking .ranking_list ul .third span {
            color: #0099ec;
        }

        .school_ranking .elite_schools {
            text-align: center;
            padding-bottom: 16px;
            margin-top: 36px;
        }

        .school_ranking .elite_schools img {
            width: 100%;
        }

        .school_ranking .elite_schools h4 {
            margin: 8px;
        }

        .school_ranking .elite_schools p {
            color: #999;
            margin: 8px;
        }
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="banner">
    <div class="school_intre">
        <div class="schoo_dagai">
            <div class="school_xqt">
                <div>
                    <p class="name">${school.name}</p>
                    <p class="en_name">${school.ownname}</p>
                    <p class="rank">世界排名:<span>${school.num}</span></p>
                </div>
            </div>
            <div class="school_xqc">
                <ul>
                    <li>国家：<span>${school.nation.name}</span></li>
                    <li>星级：<span>${school.rate}</span></li>
                    <li>学院行政：公立</li>
                    <li>特色专业：商科 法律 教育 经济学 金融</li>
                </ul>
                <div class="btn_next">
                    <span class="fl sever_info">服务详情</span>
                    <span class="fr">免费咨询</span>
                </div>
            </div>
            <div class="school_img">
                <img src="<%=picPath%>/${school.logoPhoto.path}">
            </div>
        </div>
    </div>
</div>
<div class="school_detail">
    <p class="location">
        <img src="<%=resourcePath%>/img/abroad/location.png"
             alt="所在位置">所在位置：
        <span><a href="<%=path%>/home/home.htm">首页</a></span><span>></span>
        <span><a href="<%=path%>/school/index.htm">海外院校</a></span><span>></span>
        <span>学校详情</span>
    </p>
    <div class="school_detail fl">
        <ul class="school_info">
            <li class="cur">学校详情</li>
            <li>专业课程</li>
            <li>入学条件</li>
            <li>成功案例</li>
            <li>院校排名</li>
        </ul>
        <div class="school_content">
            <div class="cur">${school.description}</div>
            <div>${school.subject}</div>
            <div>${school.term}</div>
            <div>${school.honour}</div>
            <div>${school.flyDic}</div>
        </div>
    </div>
    <div class="school_ranking fr">
        <div class="ranking_list">
            <h3>2017澳洲大学排名</h3>
            <ul>
                <li class="first"><span>1</span>墨尔本大学</li>
                <li class="second"><span>2</span>新南威尔士大学</li>
                <li class="third"><span>3</span>莫纳什大学</li>
                <li><span>4</span>昆士大学</li>
                <li><span>5</span>澳洲国立大学</li>
                <li><span>6</span>悉尼科技大学</li>
                <li><span>7</span>皇家墨尔本理工大学</li>
                <li><span>8</span>阿德莱德大学</li>
                <li><span>9</span>西澳大学</li>
            </ul>
        </div>
        <div class="elite_schools">
            <div><img src="<%=resourcePath%>/img/school/MIT.png" alt=""></div>
            <h4>麻省理工学院</h4>
            <p>Massachusetts Institute of Technology</p>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".school_info li").click(function () {
            $(this).addClass("cur").siblings().removeClass('cur');
            $(".school_content >div").eq($(".school_info li").index(this)).show().siblings().hide();
        });
    });
</script>
<%@include file="../footer.jsp" %>
</body>
</html>
