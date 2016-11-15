<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/15
  Time: 9:53
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

<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {

    });
</script>

<%@include file="../footer.jsp" %>
</body>
</html>
