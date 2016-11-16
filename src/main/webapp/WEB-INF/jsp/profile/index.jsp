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
</head>
<body>
<%@include file="../header.jsp" %>
<div ng-controller="mainController">

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
</body>
</html>
