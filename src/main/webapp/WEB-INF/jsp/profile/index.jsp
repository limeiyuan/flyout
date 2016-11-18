<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/14
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="../commonResource.jsp" %>
    <title>飞出国</title>
    <style>
        a:hover{text-decoration: none;}
        a:visited{text-decoration: none;}
        .user_main{width: 1200px;margin: 24px auto 0;overflow: hidden;padding-bottom: 400px;}
        .nav_select{width: 200px;}
        .user_nav{width:200px;background: #fff;border: 1px solid #eee;padding: 10px 0;}
        .next_icon{margin-left: 36px;}
        .user_nav li{text-align: left;}
        .user_nav li a{padding: 10px 10px 10px 40px;;display:block;cursor:pointer;color: #999;}
        .user_nav li .personal_enter{background: url("<%=resourcePath%>/img/home/arrow_down.png")no-repeat 70% center;}

        .user_nav li .user_icon{padding:  8px 8px 8px 24px;;}
        .user_nav li a:hover{background:#eee;    border-left: 5px solid #0099ec;}
        .user_nav li .cur_content{background:#eee;    border-left: 5px solid #0099ec;}
        .user_nav li .cur_content a{text-decoration: none;}

        .next_item{display:none;}
        .next_item li{width:100%;}
        .next_item li a{display:block;padding:10px 10px 10px 20px;background:none;font-size: 6px;color: #999;text-decoration: none;}
        /*.next_item .next_li a{background:url(<%=resourcePath%>/img/more.png) no-repeat 120px center;}*/
        .next_item .next_li a:hover,.next_item .next_li .sen_x{background:#eee;}
        .recommend{background: url("<%=resourcePath%>/img/account/may_like1.png")no-repeat;background-size: contain;height: 280px;    margin-top: 15px;}


        /*我的收藏开始*/
        .my_collect{width: 975px;height: 670px;border: 1px solid #eee;display: none;}
        .school_tab{overflow: hidden;width: 90%;margin: 0 auto;}
        .school_tab .tabBox{.width: 820px;.height: 320px;background: #fff;width: 100%;}
        .school_tab .vidoBox{.width: 320px;.height: 320px;background: #fff;margin-top: 6px;}
        .school_tab .vidoBox h3{font-size: 16px;color: #333;font-weight: bold;padding: 0 5px;margin: 10px auto;}
        .school_tab .vidoBox h3 a{float: right;color: #999;font-size: 14px;}
        .school_tab .vidoBox div{ width: 100%;height: 100%;border-top: 1px solid #999;}
        .school_tab .vidoBox .vidoContent{width: 80%;height: 80%;background: #ccc;margin: 5% auto;}
        .tabbed_panels{ overflow:hidden; margin:10px auto;}
        .tabbed_panels .examples>li{position: relative;}
        .tabbed_panels .examples li .study_name{font-weight: bold;    line-height: 33px;}
        .tabbed_panels .examples li .study_name img{ margin-left: 20px;}
        .tabbed_panels .examples li p{color: #999;line-height: 20px;}
        .tabbed_panels .examples li p img{margin: 5px;}
        .tabbed_panels .examplesCoten{.height: 286px;    margin: 15px 0 30px;}
        .tabbed_panels .examplesCoten .cancel_col{height: 20px; line-height: 20px;  position: absolute; top: 50%; margin-top: -10px; right: 0;}
        .tabbed_panels ul{ list-style:none; margin:0; padding:0; overflow:hidden; border-bottom: 1px solid #eee;}
        .tabbed_panels li.tab{ float:left; .width:120px;font-size:16px;text-align:center; cursor:pointer;color: #666;line-height: 50px;height: 50px;     padding: 0 36px;}
        .tabbed_panels div.contentGroup{ clear:both; overflow:hidden;}
        .tabbed_panels div.content{ width:100%; display:none; .height:400px;}
        .tabbed_panels li.selectedTab{font-weight:bold; color: #0099ec;border-bottom: 1px solid #0099ec; }
        .tabbed_panels div.selectedContent{ display:block;}
        /*我的收藏结束*/
        /*详细设置开始*/
        .person_info{width: 975px;height: 670px;border: 1px solid #eee;display: none;color: #999;}
        .detailed_set{height: 100%;height: 100%;display: none;}
        .basic_set{height: 100%;height: 100%;display: block;}
        .avatar_box{width: 160px;height: 100%;}
        .avatar_box > div{width: 100px;height:100px;margin: 20px auto 0;}
        .avatar_box  p{text-align: center;line-height: 30px;}
        .info_box{width: 800px;height: 100%;}
        .info_box  ul li{overflow: hidden;  height: 35px;  line-height: 35px; margin-top: 25px;}
        .info_box  ul li span{display: inline-block; padding: 0 10px;}
        .info_box  ul li .required{float: right;color: red;}
        .info_box  ul li input{text-indent: 10px;    float: left;display: block;width:200px;height: 30px;line-height:30px;border-radius: 5px; border: none; border: 1px solid #999;}
        .info_box .fill_name{width: 120px;}
        .save{ width: 100px; background: #0099ec; color: #fff; text-align: center; margin-top: 20px; line-height: 30px; border-radius: 20px;}
        .info_box .password{width: 200px;}
        .info_box  ul li .modify{color: #0099ec;}
        /*详细设置结束*/
        /*收益情况开始*/
        .user_content{}
        .earnings{width: 975px;height: 670px;border: 1px solid #eee;display: none;color: #999;}
        .overage{overflow: hidden;width: 92%;margin: 0 auto;padding: 26px 0; height: 100px;   border-bottom: 1px solid #eee;margin-bottom: 28px;}
        .overage p{    line-height: 22px;}
        .overage .money{color: red;}
        .overage p span{font-size: 16px;}
        .overage .btn_box{width: 200px;
            height: 100%;}
        .overage .btn_box span{    padding: 8px 30px;    border-radius: 40px;border: 1px solid red;}
        .overage .btn_box .recharge {background: red;color: #fff;}
        .overage .btn_box .withdraw {background: #fff;color: red;}
        .gain_money{width: 92%; margin: auto;border-bottom: 1px solid #eee;}
        .gain_money th{font-weight: normal;line-height: 20px;}
        .gain_money td{line-height: 28px; font-size: 16px;padding-bottom: 34px;text-align: center;}
        .billing_title{width: 92%;margin:30px auto 14px;}
        .billing{width: 88%;margin: auto;}
        .billing tr{line-height: 36px; text-align: center;color: #999; }
        .billing tr th{line-height: 36px;text-align: center; }
        .earnings .page{text-align: center;color: #ccc;margin: 30px 0;}
        .earnings .page span{text-align: center; color: #ccc; padding: 4px 10px; border: 1px solid #0099ec; margin-right: 9px;}
        .earnings .page .cur{background: #0099ec; color: #fff;}
        /*收益情况结束*/
        /*我的订单开始*/
        .my_order{width: 975px;height: 670px;border: 1px solid #eee;display: none;color: #999;}
        .order_info{width: 900px;text-align: center;margin: auto;color: #999;}
        .order_info .order_title{line-height: 6;border: none;}
        .order_info tr{border-bottom: 1px solid #eee;}
        .order_info tr td{vertical-align: top;}
        .order_info .product_name{text-indent: -20%;}
        th{text-align: center;}
        .my_order .info_contnet{    text-align: left;overflow: hidden;}
        .my_order .info_contnet div{    text-align: left;}
        .my_order .order_info td>div{padding: 20px 0;text-align: center;}
        .my_order .info_contnet div a{    color: #3c3c3c;  text-decoration: none;  word-break: break-all;}
        .my_order .info_contnet div img{ display: block; margin: 0 auto; max-width: 100%;}
        .my_order .order_name{ font-weight: bold;}
        .my_order .order_pakge{margin-left: 8px;width: 180px;}
        .my_order .order_pakge p{  margin-bottom: 8px;  line-height: 1.2;}
        .pending{text-align: center;}
        .pending p{background: #0099ec;color: #fff;width: 60%;margin: 10px auto;padding: 10px 0;border-radius: 50px;}
        /*我的订单结束*/
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div ng-controller="mainController">
    <div class="user_main">
        <div class="nav_select fl">
            <ul class="user_nav">
                <li>
                    <img  class="fl user_icon" src="<%=resourcePath%>/img/account/personal_enter.png" alt="">
                    <a href="#" class="personal_enter">个人中心</a>
                    <ul class="next_item">
                        <li><a href="##">基本设置</a></li>
                        <li class="next_li">
                            <a href="##">详细设置</a>
                            <div class="clear"></div>
                    </ul>
                </li>
                <li> <img  class="fl user_icon" src="<%=resourcePath%>/img/account/income.png" alt=""><a href="#" class="income">收益情况</a></li>
                <li> <img  class="fl user_icon" src="<%=resourcePath%>/img/account/order_list.png" alt=""><a href="#" class="order_list">我的订单</a></li>
                <li> <img  class="fl user_icon" src="<%=resourcePath%>/img/account/collection.png" alt=""><a href="#" class="collection">我的收藏</a></li>
                <div class="clear"></div>
            </ul>
            <div class="recommend">

            </div>
        </div>
        <div class="user_content fr">
            <!--个人中心开始-->
            <div class="person_info fr">
                <!-- 基本设置开始-->
                <div class="basic_set">
                    基本设置基本设置基本设置基本设置基本设置
                </div>
                <!--  基本设置结束-->
                <!--  详细设置开始-->
                <div class="detailed_set">
                    <div class="avatar_box fl">
                        <div>
                            <img src="<%=resourcePath%>/img/account/short_head.png"/>
                            <p> 头像上传</p>
                        </div>
                    </div>
                    <div class="info_box fr">
                        <ul>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>昵称</span><span class="required">*</span></div><input type="text" />
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>手机</span></div><input type="text" />
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>邮箱</span><span class="required">*</span></div><input type="text" />
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>密码</span></div><p class="password fl">**********<span class="modify fr">修改</span></p>
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>出生日期</span></div><input type="text" />
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>目标院校</span></div><input type="text" />
                            </li>
                            <li class="clearfix">
                                <div class="fill_name fl"><span>目标国家</span></div><input type="text" />
                            </li>
                        </ul>
                        <div class="save">保存</div>
                    </div>
                </div>
                <!--   详细设置结束-->
            </div>
            <!--个人中心结束-->
            <!--收益情况开始-->
            <div class="earnings fr">
                <div class="overage">
                    <div class="amount fl">
                        <p>当前余额</p>
                        <p class="money"> <span>1200.00</span>元</p>
                    </div>
                    <div class="btn_box fr">
                        <span class="recharge fl">充值</span>
                        <span class="withdraw fr">提现</span>
                    </div>
                </div>
                <table class="gain_money">
                    <thead>
                    <tr><th>当前收益</th><th>一级推荐</th><th>二级推荐</th><th>三级推荐</th></tr></thead>
                    <tbody>
                    <tr>
                        <td>1000.00元</td>
                        <td>600.00元</td>
                        <td>200.00元</td>
                        <td>200.00元</td>
                    </tr>
                    </tbody>
                </table>
                <h4 class="billing_title">账单详情</h4>
                <table class="billing">
                    <thead>
                    <tr><th>入账时间</th><th>流水号</th><th>财务类型</th><th>手指金额（元）</th><th>账号金额（元）</th></tr></thead>
                    <tbody>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    <tr>
                        <td>2016.09.17</td>
                        <td>SE0856887</td>
                        <td>一级推荐</td>
                        <td>+600.00</td>
                        <td>1200.00</td>
                    </tr>
                    </tbody>
                </table>
                <p class="page"> 26条记录 1/2页 <span class="cur">1</span> <span>2</span><span>下一页</span></p>
            </div>
            <!--收益情况结束-->
            <!--我的订单开始-->
            <div class="my_order fr">
                <table class="order_info">
                    <thead>
                    <tr class="order_title">
                        <th class="product_name" width="300px">产品名称</th>
                        <th width="150px">购买时间</th>
                        <th width="150px">支付时间</th>
                        <th width="150px">支付金额（元）</th>
                        <th width="150px">订单状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="order_detail">
                        <td width="300px">
                            <div class="info_contnet">
                                <div class="fl order_img">
                                    <img src="<%=resourcePath%>/img/account/thumbnail.png" alt="">
                                </div>
                                <div class="order_pakge fl">
                                    <p class="order_name">英国8所院校专业留学申请硕士定制套餐</p>
                                    <p class="">英国前Top10硕士直录</p>
                                </div>
                            </div>

                        </td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2868.00</div></td>
                        <td width="150px">
                            <div class="pending">
                                待支付
                                <p>前往支付</p>
                            </div>
                        </td>
                    </tr>
                    <tr class="order_detail">
                        <td width="300px">
                            <div class="info_contnet">
                                <div class="fl order_img">
                                    <img src="<%=resourcePath%>/img/account/thumbnail.png" alt="">
                                </div>
                                <div class="order_pakge fl">
                                    <p class="order_name">英国8所院校专业留学申请硕士定制套餐</p>
                                    <p class="">英国前Top10硕士直录</p>
                                </div>
                            </div>

                        </td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2868.00</div></td>
                        <td width="150px">
                            <div>
                                已完成
                            </div>
                        </td>
                    </tr>
                    <tr class="order_detail">
                        <td width="300px">
                            <div class="info_contnet">
                                <div class="fl order_img">
                                    <img src="<%=resourcePath%>/img/account/thumbnail.png" alt="">
                                </div>
                                <div class="order_pakge fl">
                                    <p class="order_name">英国8所院校专业留学申请硕士定制套餐</p>
                                    <p class="">英国前Top10硕士直录</p>
                                </div>
                            </div>

                        </td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2016-10-09 19:51:00</div></td>
                        <td width="150px"><div>2868.00</div></td>
                        <td width="150px">
                            <div>
                                已完成
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--我的订单结束-->
            <!--我的收藏开始-->
            <div class="my_collect fr">
                <div class="school_tab">
                    <div class="tabBox fl">

                        <div class="tabbed_panels">

                            <ul class="tabGroup">
                                <li class="tab selectedTab">院校留学</li>
                                <li class="tab">服务商家</li>
                                <li class="tab">专家顾问</li>
                            </ul>
                            <div class="contentGroup">
                                <div class="content selectedContent">
                                    <ul class="examples examplesCoten">
                                        <li>
                                            <div class="fl" style="margin-right: 8px;"><img src="<%=resourcePath%>/img/account/thumbnail.png" alt=""></div>
                                            <p class="study_name">英国2所院校专业留学申请硕士定制套餐</p>
                                            <p>服务商：飞出国</p>
                                            <p>预估费用：￥24999.00</p>
                                            <span class="fr cancel_col">取消收藏</span>
                                        </li>

                                    </ul>
                                    <ul class="examples examplesCoten">
                                        <li>
                                            <div class="fl" style="margin-right: 8px;"><img src="<%=resourcePath%>/img/account/thumbnail.png" alt=""></div>
                                            <p class="study_name">英国2所院校专业留学申请硕士定制套餐</p>
                                            <p>服务商：飞出国</p>
                                            <p>预估费用：￥24999.00</p>
                                            <span class="fr cancel_col">取消收藏</span>
                                        </li>

                                    </ul>
                                </div>
                                <div class="content">
                                    <ul class="examples examplesCoten">
                                        <li>
                                            <div class="fl" style="margin-right: 8px;"><img src="<%=resourcePath%>/img/account/thumbnail.png" alt=""></div>
                                            <p class="study_name">鹏润教育联盟</p>
                                            <p>服务商：飞出国</p>
                                            <p>预估费用：￥24999.00</p>
                                            <span class="fr cancel_col">取消收藏</span>
                                        </li>

                                    </ul>
                                </div>
                                <div class="content">
                                    <ul class="examples examplesCoten">
                                        <li>
                                            <div class="fl" style="margin-right: 8px;"><img src="<%=resourcePath%>/img/account/avatar.png"
                                                                                            alt=""></div>
                                            <p class="study_name">郭强<img src="<%=resourcePath%>/img/account/verified.png" alt=""></p>
                                            <p>专场国家：澳大利亚、新西兰</p>
                                            <p><img src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                    src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                    src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                    src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                    src="<%=resourcePath%>/img/account/collection.png" alt=""></p>
                                            <span class="fr cancel_col">取消收藏</span>
                                        </li>

                                    </ul><ul class="examples examplesCoten">
                                    <li>
                                        <div class="fl" style="margin-right: 8px;"><img src="<%=resourcePath%>/img/account/avatar.png"
                                                                                        alt=""></div>
                                        <p class="study_name">郭强<img src="<%=resourcePath%>/img/account/verified.png" alt=""></p>
                                        <p>专场国家：澳大利亚、新西兰</p>
                                        <p><img src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                src="<%=resourcePath%>/img/account/collection.png" alt=""><img
                                                src="<%=resourcePath%>/img/account/collection.png" alt=""></p>
                                        <span class="fr cancel_col">取消收藏</span>
                                    </li>

                                </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--我的收藏结束-->
        </div>
    </div>
</div>

<%@include file="../footer.jsp" %>
<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
        $scope.queryObj = "";
        $scope.pagination = {"pageNo": "1", "pageCount": "1"};
        $scope.sortField = "";
        $scope.sortOrder = true;

        $scope.initial = function () {
            var timestamp = (new Date()).valueOf();
            var url = "getRecommend.htm?timestamp=" + timestamp;
            $scope.getList(url);
        };

        $scope.query = function () {
            var keyword = encodeURIComponent($scope.queryObj);
            var timestamp = (new Date()).valueOf();
            var url = "query.htm?timestamp=" + timestamp + "&name=" + keyword;
            $scope.getList(url);
        };

        $scope.getList = function (url) {
            url += '&pageNo=' + $scope.pagination.pageNo
                    + '&sortField=' + $scope.sortField + '&sortOrder=' + $scope.sortOrder;
            $http({
                method: 'GET',
                url: url
            }).then(function success(response) {
                var result = response.data;
                $scope.products = result.data;
                $scope.pagination = result.pagination;

                $scope.$broadcast('queryFinished');
                $('#queryCoverModal').modal('hide');
            }, function error() {
                $('#queryCoverModal').modal('hide');
                $scope.errorMsg = '发生未知错误，请与系统管理员联系！';
            });
        };

        $scope.initial();
    });

    app.controller('paginationCtrl', function ($scope) {
        $scope.maxSize = 5;
        $scope.totalItems = $scope.$$prevSibling.pagination.count;
        $scope.currentPage = $scope.$$prevSibling.pagination.pageNo;

        $scope.$on('queryFinished', function () {
            $scope.totalItems = $scope.$$prevSibling.pagination.count;
            $scope.currentPage = $scope.$$prevSibling.pagination.pageNo;
            $scope.numPages = $scope.$$prevSibling.pagination.pageCount;
            $scope.itemsPerPage = $scope.$$prevSibling.pagination.count;
        });

        $scope.pageChanged = function () {
            $scope.$$prevSibling.pagination.pageNo = $scope.currentPage;
            $scope.$$prevSibling.query();
        };
    });
</script>
<script>
    $(function(){
        $(".user_nav > li > a").click(function(){
            $(this).addClass("cur_content").parents().siblings().find("a").removeClass("cur_content");
            $(this).parents().siblings().find(".next_item").hide(300);
            $(this).siblings(".next_item").toggle(300);
            // $(".user_content > div").eq($(".user_nav > li > a").index(this)).addClass("user_selected").siblings().removeClass('user_selected');
            $(".user_content > div").eq($(".user_nav > li > a").index(this)).show().siblings().hide();
        });

        $(".next_item > li > a").click(function(){
            $(this).parents().find("a").removeClass("cur_content");
            $(this).addClass("cur_content").parents().siblings().find("a").removeClass("cur_content");
            $(".person_info > div").eq($(".next_item > li > a").index(this)).show().siblings().hide();
        });

        $(".tabGroup > li").click(function(){
            $(this).addClass("selectedTab").siblings().removeClass('selectedTab');
            $(".contentGroup > div").eq($(".tabGroup > li").index(this)).addClass("selectedContent").siblings().removeClass('selectedContent');
        });
    })
</script>
</body>
</html>
