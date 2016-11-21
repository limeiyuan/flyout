<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/18
  Time: 17:18
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
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center">姓名</th>
            <th class="text-center">国家</th>
            <th class="text-center">说明</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="case in cases">
            <td class="text-left">{{case.name}}
            </td>
            <td class="text-center">{{case.category.name}}
            </td>
            <td class="text-center">{{case.description}}
            </td>
        </tr>
        </tbody>
    </table>


    <!-- 分页-->
    <div ng-controller="paginationCtrl" style="text-align: right">
        <pre>共{{totalItems}}条 {{numPages}}页</pre>
        <uib-pagination total-items="totalItems" ng-model="currentPage" max-size="maxSize" class="pagination-sm"
                        boundary-links="true" items-per-page="itemsPerPage" ng-change="pageChanged()"
                        previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;"
                        last-text="&raquo;"></uib-pagination>
    </div>
</div>

<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
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
                $scope.cases = result.data;
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
