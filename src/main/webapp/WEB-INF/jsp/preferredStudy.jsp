<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/11/16
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="commonResource.jsp" %>
    <title>飞出国</title>
    <style>
        .schoo_li{width: 1200px;}
        .schoo_li ul{overflow: hidden;}
        .schoo_li ul div{width: 106px;height: 106px;margin:auto;}
        .schoo_li li{float: left;width: 208px;margin-right:37.5px;border: 1px solid #eee;padding: 10px 0 30px 0;}
        .schoo_li li p{text-align: center;line-height: 20px;}
        .schoo_li li .appli_name{font-weight: bold;}
        .schoo_li li .appli_num{color: red;}
        .schoo_li li .applied{color: #0099ec;}
        .schoo_li li .free_appli{ width: 100px;margin-top: 20px; background: #0099ec; height: 30px; line-height: 30px; text-align: center; border-radius: 40px;color: #fff;}
        .schoo_li .last_school{margin: 0;}
        .filter_school{width: 1200px;overflow: hidden;}
        .filter_school .country_study{position: relative; overflow: hidden;  border: 1px solid #eee;background: #ccc}
        .filter_school .country_study .head{background: #ccc;width: 8%;}
        .filter_school .country_study .head h4{line-height: 40px;text-align: center;}
        .filter_school .country_study .body{width: 92%;background: #fff;}
        .filter_school .country_study .body li{float: left; padding: 0 22px;}
        .filter_school .country_study .body .country_item{overflow: hidden;line-height: 40px;}
        .filter_school .country_study .body .country_item ul{    width: 90%}
        .filter_school .country_study .body .country_item span{color: #0099ec;line-height: 40px;padding: 0 20px;}
        .filter_school .country_study .body .country_item ul{display: inline-block;}
        .filter_school .country_study .foot{width: 8%;line-height: 40px; position: absolute; top: 0; right: 0;}
        .filter_school .country_study .foot span{text-align: center; display: block;background: url("<%=resourcePath%>/img/arrow_down.png")no-repeat 70% center;}
        .filter_factor{width: 1200px;    padding: 26px 0;}
        .filter_factor>div{display: inline-block;margin-right: 24px;}
        .filter_factor .popularity{color: #0099ec;border: 1px solid #0099ec; padding: 0 25px 0 14px; line-height: 20px; border-radius: 37px;background: url("<%=resourcePath%>/img/arrow_blue.png")no-repeat 92% center;}
        .filter_factor .worth{color: #ccc;border: 1px solid #ccc; padding: 0 25px 0 14px;line-height: 20px;border-radius: 37px;background: url("<%=resourcePath%>/img/arrow_grey.png")no-repeat 92% center;}
        .filter_factor .keyword input{line-height: 20px;border: 1px solid #0099ec;text-indent: 10px;  border-radius: 50px;}
        .filter_factor .keyword{position: relative}
        .filter_factor .keyword span{width:40px;position: absolute;display: inline-block;background: url("<%=resourcePath%>/img/seach_bg.png")no-repeat center center;vertical-align: middle;right: 1px;text-align: center; top:1px;}
        .school_view{width: 1200px;overflow: hidden;}
        .school_sort{width: 80%;}
        .school_sort ul{overflow: hidden}
        .school_sort li{float:left;width: 31%;margin-right: 2%;    border: 1px solid #eee;    margin-bottom: 16px;    padding-bottom: 10px;}
        .school_sort li div{width: 100%;    margin-bottom: 10px;}
        .school_sort  .passing_rate{color: #ccc;}
        .school_sort li div img{width: 100%;height: 100%;}
        .school_sort li p{padding: 0 5px 0 15px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;    line-height: 20px;}
        .may_like{width: 20%;height: 500px;}
        .may_like img{width: 88%;}
        .school_sort .now_price{font-size: 16px;color: red;}
        .school_sort .original_price{color: #ccc;text-decoration: line-through;}
        .school_sort .collection{float: right;padding-right: 24px;margin-right: 10px;background: url("<%=resourcePath%>/img/heart_grey.png")no-repeat 92% center;}
        .school_view .fenye{ padding-bottom: 5px;}
        .school_view .fenye  p{ text-align: center;  color: #ccc;}
        .school_view .fenye  p span{text-align: center;  color: #ccc; padding: 4px 10px; border: 1px solid #0099ec; margin-right: 9px;}
        .school_view .fenye  p .cur{background: #0099ec;color: #fff;}


    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="schoo_li">
    <ul>
        <li>
            <div><img src="<%=resourcePath%>/img/mel.png" alt=""></div>
            <p class="appli_name">墨尔本大学</p>
            <p><span class="appli_num">35233</span><span class="applied">人已申请</span></p>
            <div class="free_appli">免费申请</div>
        </li>
        <li>
            <div><img src="<%=resourcePath%>/img/mel.png" alt=""></div>
            <p class="appli_name">墨尔本大学</p>
            <p><span class="appli_num">35233</span><span class="applied">人已申请</span></p>
            <div class="free_appli">免费申请</div>
        </li>
        <li>
            <div><img src="<%=resourcePath%>/img/mel.png" alt=""></div>
            <p class="appli_name">墨尔本大学</p>
            <p><span class="appli_num">35233</span><span class="applied">人已申请</span></p>
            <div class="free_appli">免费申请</div>
        </li>
        <li>
            <div><img src="<%=resourcePath%>/img/mel.png" alt=""></div>
            <p class="appli_name">墨尔本大学</p>
            <p><span class="appli_num">35233</span><span class="applied">人已申请</span></p>
            <div class="free_appli">免费申请</div>
        </li>
        <li class="last_school">
            <div><img src="<%=resourcePath%>/img/mel.png" alt=""></div>
            <p class="appli_name">墨尔本大学</p>
            <p><span class="appli_num">35233</span><span class="applied">人已申请</span></p>
            <div class="free_appli">免费申请</div>
        </li>
    </ul>
</div>
<div class="filter_school">
    <div class="country_study">
        <div class="head fl">
            <h4>留学国家</h4>
        </div>
        <div class="body fl">
            <div class="country_item">
                <span class="fl">全部</span>
                <ul class="fl">
                    <li>美国</li>
                    <li>加拿大</li>
                    <li>新西兰</li>
                    <li>澳大利亚</li>
                    <li>英国</li>
                    <li>德国</li>
                    <li>法国</li>
                    <li>西班牙</li>
                    <li>葡萄牙</li>
                    <li>美国</li>
                    <li>加拿大</li>
                    <li>新西兰</li>
                    <li>澳大利亚</li>
                    <li>英国</li>
                    <li>德国</li>
                    <li>法国</li>
                    <li>西班牙</li>
                    <li>葡萄牙</li>
                </ul>
            </div>
            <div class="foot fr">
                <span>更多</span>
            </div>
        </div>

    </div>
    <div class="country_study">
        <div class="head fl">
            <h4>申请阶段</h4>
        </div>
        <div class="body fl">
            <div class="country_item">
                <span class="fl">全部</span>
                <ul class="fl">
                    <li>研究生</li>
                    <li>本科</li>
                    <li>新西兰</li>
                    <li>专科</li>
                    <li>高中</li>
                </ul>
            </div>
            <div class="foot fr">
                <span>更多</span>
            </div>
        </div>

    </div>
    <div class="country_study">
        <div class="head fl">
            <h4>选择方向</h4>
        </div>
        <div class="body fl">
            <div class="country_item">
                <span class="fl">全部</span>
                <ul class="fl">
                    <li>人文与社会科学</li>
                    <li>商学</li>
                    <li>工程与计算机技术</li>
                    <li>医学与健康科学</li>
                    <li>建筑与设计</li>
                    <li>自然科学</li>
                </ul>
            </div>
            <div class="foot fr">
                <span>更多</span>
            </div>
        </div>

    </div>
    <div class="country_study">
        <div class="head fl">
            <h4>意向机构</h4>
        </div>
        <div class="body fl">
            <div class="country_item">
                <span class="fl">全部</span>
                <ul class="fl">
                    <li>飞出国</li>
                    <li>鹏润留学</li>
                    <li>太平洋教育</li>
                    <li>美联英语</li>
                    <li>澳洲移民局</li>
                </ul>
            </div>
            <div class="foot fr">
                <span>更多</span>
            </div>
        </div>

    </div>
</div>
<div class="filter_factor">
    <div class="popularity">人气最高</div>
    <div class="worth">最值</div>
    <div class="keyword"><input type="text" placeholder="请输入关键字"><span><img src="<%=resourcePath%>/img/search.png" alt="搜索"></span></div>
</div>

<div class="school_view">
    <div class="school_sort fl">
        <ul>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p class="passing_rate">申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p>申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p>申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p>申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p>申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
            <li class="school_list fr">
                <div><img src="<%=resourcePath%>/img/schoo_view.png" alt=""></div>
                <p>斯坦福斯坦福大学斯坦福大学斯坦福大学斯坦福大学大学</p>
                <p>申请通过率8%</p>
                <p><span class="now_price">￥23543</span><span class="original_price">￥34543</span><span class="collection">收藏</span></p>
            </li>
        </ul>
    </div>
    <div class="may_like fr">
        <div><img src="<%=resourcePath%>/img/may_like1.png" alt=""></div>
        <div><img src="<%=resourcePath%>/img/may_like2.png" alt=""></div>

    </div>
    <div class="fenye cl">
        <p> 26条记录 1/2页 <span class="cur">1</span> <span>2</span><span>下一页</span></p>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
