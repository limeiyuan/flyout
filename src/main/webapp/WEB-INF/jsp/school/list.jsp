<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/9
  Time: 21:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="../commonResource.jsp" %>
    <title>学校列表</title>
    <style>
        .banner{width: 100%;;position: relative}
        .banner .fx_banner{height: 520px;width: 100%;background: url('<%=resourcePath%>/img/school/abroad_univer.png') no-repeat center}
        .banner .fx_banner .child {
            width: 1200px;
            margin: 0 auto;
            padding-top: 80px;
        }
        .banner .fly_intention{width: 350px;height: 360px;float: right; top: 36px;background: rgba(0,0,0,.3);border-radius: 8px}
        .fly_intention div{height: 40px;}
        .fly_intention div span{display: inline-block;width: 50%;line-height: 40px;text-align: center;font-size: 16px;color: #666;background: #f0f0f0;cursor:pointer;}
        .fly_intention div .active{color: #0099ec;background: #fff;}
        .fly_intention >ul{width: 100%;overflow: hidden;}
        .fly_intention .son_ul{background: #fff; padding: 0 12px; line-height: 20px;}
        .fly_intention>ul>li{width: 260px;margin: 26px auto;padding: 2px ;position: relative;}
        .fly_intention ul .fastEst{background: #0099ec;color: #fff;text-align: center;line-height: 36px;margin: 0 auto;cursor:pointer;}
        .fly_intention ul li input{border: none;outline: none;text-indent: 11px;line-height: 36px;width: 100%;background: #fff}
        .fly_intention ul li .selectedInput{background: #fff url("<%=resourcePath%>/img/select.png")no-repeat 96% center;}
        .fly_intention ul li .son_ul{position: absolute;width: 236px; z-index: 20;cursor: pointer;}
        .fly_intention ul li .son_ul li:hover{background: #ccc;}
        /*banner结束*/
        /*products 开始*/
        .schoolContent{ width: 1200px; margin: auto;margin-top: 20px;}
        .schoolInfo{height: 34px;overflow: hidden;}
        .schoolInfo::before{content:'|';background: #fb5454;width: 6px;height: 30px;float: left;color: #fb5454;margin-right: 5px;}
        .schoolInfo h3,.teacher h3,.community h3{font-size: 16px;color: #333;font-weight: bold;}
        .schoolInfo .abroad p,.abroad p,.community p,.teacher p{font-size: 12px;color: #666;font-family: Arial;}
        .moreAbroad{ color: #666;line-height: 30px;cursor:pointer;}
        /*.schoolList{overflow: hidden;margin-top: 5px;}
        .productImag{width: 228px;height: 450px;}*/
        .schoolList ul{overflow: hidden;}
        .schoolList ul li{float: left; background: #fff; width: 33%;}
        .schoolList ul .midd_school{margin: 0 2%;}
        .schoolList ul .school_list{position: relative;}
        .schoolList ul .mask_school{position: absolute; top:0;background: rgba(0,0,0,.5);color: #fff;width: 99%;display: none; }
        .schoolList ul .mask_school p{font-weight: bold;margin: 0 40px;text-align: left; color: #fff;    line-height: 30px; }
        .schoolList ul .mask_school .schoo_name{font-size: 20px;    margin: 20px 40px; }
        .schoolList ul .mask_school .details{ width: 100px;  height: 30px;background: #0099ec;line-height: 30px;text-align: center;border-radius: 50px;}
        .schoolList ul li div{     height: 260px; margin: 8px auto;}
        .schoolList ul li p{font-size: 14px;color: #333;     text-align: center;}
        .schoolList ul li span{ height: 34px; display: block;font-size: 12px;color: #666; padding-left: 14px;line-height: 17px;}
        .schoolList ul .productCurr div{ height: 110px; }
        .schoolList ul .productCurr .productFly{ height: 32px; color: #666;background: none;}
        .schoolList ul .productCurr .productFly .flyAbroad{ height: 20px;line-height: 20px; width: 50px;background: url("<%=resourcePath%>/img/brand.png")no-repeat left center;padding-left: 26px;}
        .schoolList ul .productCurr .productFly .likeNum{ height: 20px;line-height: 20px;width: 32px; background: url("<%=resourcePath%>/img/like_slect.png")no-repeat left center;padding-left: 20px;}
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="banner">
    <div id="js_banner" class="fx_banner">
        <div class="child" data-z="1">
            <div class="fly_intention">
                <ul>
                    <li class="select_input">
                        <input class="selectedInput" type="text" placeholder="意向留学国家">
                        <ul class="son_ul" style="display: none">
                            <li>选项一</li>
                            <li>选项二</li>
                            <li>选项三</li>
                            <li>选项四</li>
                            <li>选项五</li>
                        </ul>
                    </li>
                    <li class="select_input">
                        <input class="selectedInput" type="text" placeholder="学校类型">
                        <ul class="son_ul" style="display: none">
                            <li>选项一</li>
                            <li>选项二</li>
                            <li>选项三</li>
                            <li>选项四</li>
                            <li>选项五</li>
                        </ul>
                    </li>
                    <li class="select_input">
                        <input class="selectedInput" type="text" placeholder="申请阶段">
                        <ul class="son_ul" style="display: none">
                            <li>选项一</li>
                            <li>选项二</li>
                            <li>选项三</li>
                            <li>选项四</li>
                            <li>选项五</li>
                        </ul>
                    </li>
                    <li>
                        <input class="" type="text" placeholder="请输入学校名称">
                    </li>

                    <li class="fastEst">自主择校</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="schoolContent"  ng-controller="mainController">
    <div class="schoolInfo">
        <div class="abroad fl">
            <h3>热门院校</h3>
            <p>Hot Universities And Colleges</p>
        </div>
        <div class="moreAbroad fr">更多院校></div>
    </div>

    <div class="schoolList">
        <ul>
            <li class="school_list" ng-repeat="school in schools">
                <div><img src="<%=resourcePath%>/img/school/MIT.png" alt=""></div>
                <div class="mask_school">
                    <p class="schoo_name">{{school.ownname}}</p>
                    <p>地区：{{school.nation.name}}</p>
                    <p>类型：私立</p>
                    <p>热门专业：{{school.subject}}</p>
                    <div class="details">查看详情</div>
                </div>
                <p>{{school.name}}</p>
                <p>{{school.ownname}}</p>
            </li>
        </ul>
    </div>

</div>
<script>
    $(document).ready(function(){
        $(document).ready(function () {
                    $('.son_ul').hide(); //初始ul隐藏
                    $('.selectedInput').click(function () { //鼠标移动函数
                                $(this).parent()[0].style.borderRadius="20px 20px 0 0";
                                $(this).parent().find('ul.son_ul').slideDown();  //找到ul.son_ul显示
                                $(this).parent().find('li').hover(function () {
                                    $(this).addClass('hover')
                                }, function () {
                                    $(this).removeClass('hover')
                                }); //li的hover效果
                                $(this).parent().hover(function () {
                                        },
                                        function () {
                                            $(this).parent().find("ul.son_ul").slideUp();
                                        }
                                );
                            }, function () {
                            }
                    );
                    $('ul.son_ul li').click(function () {
                        $(this).parents('li').find('input').val($(this).html());
                        $(this).parents('li').find('ul').slideUp();
                        $(this).parents('li')[0].style.borderRadius="20px";
                    });
                },

                $('.school_list').mouseover(function(){
                    $('.mask_school').hide();
                    $(this).find('.mask_school').show()
                })

        );
    });
</script>
<script type="text/javascript">
    var app = angular.module("app", ['ngAnimate', 'ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
        $scope.queryObj = "";
        $scope.pagination = {"pageNo": "1", "pageCount": "1"};
        $scope.sortField = "";
        $scope.sortOrder = true;

        $scope.query = function () {
            var keyword = encodeURIComponent($scope.queryObj);
            var timestamp = (new Date()).valueOf();

            var url = "list.htm?name=" + keyword + '&pageNo=' + $scope.pagination.pageNo
                    + '&sortField=' + $scope.sortField + '&sortOrder=' + $scope.sortOrder
                    + '&timestamp=' + timestamp;

            $http({
                method: 'GET',
                url: url
            }).then(function success(response) {
                var result = response.data;
                $scope.schools = result.data;
                $scope.pagination = result.pagination;
                $scope.$broadcast('queryFinished');
                $('#queryCoverModal').modal('hide');
            }, function error() {
                $('#queryCoverModal').modal('hide');
                $scope.errorMsg = '发生未知错误，请与系统管理员联系！';
            });
        };

        $scope.query();
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
<%@include file="../footer.jsp" %>
</body>
</html>
