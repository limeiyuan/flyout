<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/7
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="commonResource.jsp" %>
    <title>飞出国</title>
    <style>
        img {
            margin:auto;
            height: 100%;
            width: 100%;
            max-height: 100%;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div ng-controller="mainController">
    <div>
        <div uib-carousel interval="myInterval" no-wrap="noWrapSlides" active="active"
             style="margin:auto;height: 400px;">
            <div uib-slide ng-repeat="slide in slides track by slide.id" index="$index"
                 style="margin:auto;max-height: 100%;">
                <img ng-src="{{slide.image}}">

                <div class="carousel-caption">
                    <h4>Slide {{$index}}</h4>

                    <p>{{slide.text}}</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var app = angular.module("app", ['ngAnimate', 'ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
        $scope.myInterval = 3000;
        $scope.noWrapSlides = false;
        var slides = $scope.slides = [];
        $scope.active = 0;

        $scope.initial = function () {
            var timestamp = (new Date()).valueOf();

            var url = "list.htm?name="
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

        $scope.addSlide = function () {
            slides.push({
                id: 1,
                image: '<%=resourcePath%>/img/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 2,
                image: '<%=resourcePath%>/img/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 3,
                image: '<%=resourcePath%>/img/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 4,
                image: '<%=resourcePath%>/img/banner.jpg',
                text: '测试图片'
            });
        };

        $scope.render = function () {

        };

//        $scope.initial();
        $scope.addSlide();
        $scope.render();
    });
</script>
<script type="text/javascript">
    $().ready(function () {
    });
</script>
<%@include file="footer.jsp" %>
</body>
</html>
