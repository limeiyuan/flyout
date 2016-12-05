<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/12/1
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="../commonResource.jsp" %>
    <style>
        .school_result {
            width: 1200px;
            overflow: hidden;
            margin: auto;
        }

        .school_result .case_list {
            width: 75%;
        }

        .school_result .hot_school {
            width: 23%;
        }

        .school_result .case_list > ul {
            padding: 12px;
        }

        .school_result .case_list > ul > li {
            display: inline-block;
            margin-right: 20px;
            position: relative;
        }

        .school_result .case_list li input {
            border: 1px solid #ccc;
            margin-left: 5px;
            width: 120px;
            outline: none;
            text-indent: 11px;
            line-height: 30px;
            background: #fff;
        }

        .school_result .case_list li .inte_choice {
            background: #fff url("<%=resourcePath%>/img/home/select.png") no-repeat 96% center
        }

        .school_result .case_list button {
            line-height: 30px;
            padding: 0 29px;
            background: #0099ec;
            border: none;
            outline: none;
            color: #fff;
            float: right;
            border-radius: 2px;
        }

        .school_result .case_list .son_ul {
            position: absolute;
            width: 120px;
            z-index: 20;
            cursor: pointer;
            padding: 0 0 12px 0;
            background: #fff;
            left: 52px;
        }
        .school_result .case_list .son_ul1 {
            left: 33px;
        }

        .school_result .case_list .son_ul li {
            text-align: center;
            margin: 8px auto;
            color: #999;
            padding: 0 16px;
        }

        .school_result .case_list .son_ul .hover {
            color: #000;
        }

        .school_result .case_list .school_filter {
            background: #ccc;
            margin: 16px auto;
            font-size: 14px;
        }

        .school_result .case_list .school_filter li {
            display: inline-block;
            width: 85px;
            text-align: center;
            height: 36px;
            line-height: 36px;
        }

        .school_result .case_list .school_filter .school_total {
            width: 150px;
        }

        .school_result .case_list .school_filter .school_total span {
            color: red;
        }

        .school_result .case_list .school_filter .current {
            color: #0099ec;
            cursor: pointer;
        }

        .school_result .case_list .school_form {
        }

        .school_result .case_list .school_form > ul {
            overflow: hidden;
        }

        .school_result .case_list .school_form > ul > li {
            float: left;
            width: 25%;
            height: 250px;
            border-radius: 10px;
            padding:0 10px;
            background: #fff;
            position: relative;
        }

        .school_form .school_img {
            width: 100%;
            height: 142px;
            border: 1px solid #eee;
            margin-bottom: 15px;
        }

        .school_form img {
            width: 90%;
            height: 100%;
            display: block;
            margin: 10px auto;
        }

        .school_form p {
            text-align: center;
            color: #999;
            margin: 6px 0;
        }

        .school_form .school_area, .school_form .school_name {
            font-size: 14px;
            font-weight: bold;
        }

        .school_form .fenye {
            text-align: center;
            margin:0 auto;
            color: #999;
        }

        .school_form .fenye span {
            border: 1px solid;
            margin: 0 5px;
            width: 25px;
            height: 25px;
            display: inline-block;
            text-align: center;
            line-height: 25px;
        }

        .school_form .fenye .cur {
            color: #fff;
            background: #0099ec;
        }

        .hot_school li {
            border: 1px solid #eee;
            margin-bottom: 26px;
        }

        .hot_school h3 {
            text-align: center;
            margin: 10px 0;
            font-size: 14px;
        }

        .hot_school p {
            text-align: center;
            color: #ccc;
            margin: 10px 0;
            font-size: 12px;
        }

        .hot_school img {
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="school_result" ng-controller="mainController">
    <div class="case_list fl">
        <ul>
            <li>国家 <input class="inte_choice" type="text" placeholder="请选择">
                <ul class="son_ul son_ul1" style="display: none">
                    <li>选选项一选项一选项一选项一项一</li>
                    <li>选项二</li>
                    <li>选项三</li>
                    <li>选项选项一选项一选项一四</li>
                    <li>选项五</li>
                </ul>
            </li>
            <li>学校性质<input class="inte_choice" type="text" placeholder="请选择">
                <ul class="son_ul" style="display: none">
                    <li>选项一</li>
                    <li>选项二</li>
                    <li>选项三</li>
                    <li>选项四</li>
                    <li>选项五</li>
                </ul>
            </li>
            <li>专业方向<input class="inte_choice" type="text" placeholder="请选择">
                <ul class="son_ul" style="display: none">
                    <li>选项一</li>
                    <li>选项二</li>
                    <li>选项三</li>
                    <li>选项四</li>
                    <li>选项五</li>
                </ul>
            </li>
            <li>学校名称<input class="" type="text" placeholder=""></li>
            <button>搜索</button>
        </ul>
        <div class="school_filter">
            <ul>
                <li class="current" ng-click="query('order')">QS排名 ↓</li>
                <li ng-click="query('rate')">人气 ↓</li>
                <li class="school_total fr">共有<span>12000</span>所大学</li>
            </ul>
        </div>
        <div class="school_form">
            <ul>
                <li ng-repeat="school in schools" ng-click="detail(school.id)">
                    <div class="school_img"><img
                            ng-src="{{school.detailPhotos.length>0 ? '<%=picPath%>'+school.detailPhotos[0].path : '<%=resourcePath%>/img/school/MIT.png'}}"
                            alt=""></div>
                    <p class="school_name">{{school.name}}</p>
                    <p>{{school.ownname}}</p>
                    <p class="school_area">所在地区：{{school.nation.name}}</p>
                </li>
            </ul>
           <%-- <p class="fenye">26条记录 1/2 <span class="cur">1</span><span>2</span> 下一条</p>--%>

            <div class="fenye cl" ng-controller="paginationCtrl">

                <ul uib-pagination total-items="totalItems" ng-model="currentPage" ng-change="pageChanged()"
                    max-size="maxSize"
                    previous-text="上一页" next-text="下一页" force-ellipses="true"></ul>
                <p class="fenye">{{totalItems}}条记录&nbsp;{{currentPage}}/{{numPages}}</p>
            </div>
        </div>
    </div>
    <div class="hot_school fr">
        <ul>
            <li>
                <div><img src="<%=resourcePath%>/img/school/MIT.png" alt=""></div>
                <h3>麻省理工学院</h3>
                <p>Massachusetts Institute of Technology</p>
            </li>
            <li>
                <div><img src="<%=resourcePath%>/img/school/MIT.png" alt=""></div>
                <h3>麻省理工学院</h3>
                <p>Massachusetts Institute of Technology</p>
            </li>
        </ul>
    </div>
</div>
<script>
    $('.son_ul').hide(); //初始ul隐藏
    $('.inte_choice').click(function () { //鼠标移动函数
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
            }
    );
    $('ul.son_ul li').click(function () {
        $(this).parents('li').find('input').val($(this).html());
        $(this).parents('li').find('ul').slideUp();
    });
</script>
<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
        $scope.queryObj = "";
        $scope.pagination = {"pageNo": "1", "pageCount": "1"};
        $scope.sortField = "";
        $scope.sortOrder = true;

        $scope.query = function (sortField) {
            var keyword = encodeURIComponent($scope.queryObj);
            var timestamp = (new Date()).valueOf();
            var url = "query.htm?timestamp=" + timestamp + "&name=" + keyword;
            url += '&pageNo=' + $scope.pagination.pageNo
                    + '&sortField=' + $scope.sortField + '&sortOrder=' + $scope.sortOrder;
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

        $scope.detail = function (id) {
            window.location.href = "<%=path%>/school/detail.htm?id=" + id;
        };

        $scope.query();
    });

    app.controller('paginationCtrl', function ($scope) {
        $scope.maxSize = 5;
        $scope.totalItems = $scope.$parent.pagination.count;
        $scope.currentPage = $scope.$parent.pagination.pageNo;

        $scope.$on('queryFinished', function () {
            $scope.totalItems = $scope.$parent.pagination.count;
            $scope.currentPage = $scope.$parent.pagination.pageNo;
            $scope.numPages = $scope.$parent.pagination.pageCount;
            $scope.itemsPerPage = $scope.$parent.pagination.count;
        });

        $scope.pageChanged = function () {
            $scope.$parent.pagination.pageNo = $scope.currentPage;
            $scope.$parent.query();
        };
    });
</script>
<%@include file="../footer.jsp" %>
</body>
</html>