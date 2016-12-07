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
<body>
<%@include file="../header.jsp" %>
<div ng-controller="mainController">
    <div style="width: 1200px;margin: auto;" align="center">
        <table border="1">
            <tr>
                <td>标题</td>
                <td> ${product.title}</td>
            </tr>
            <tr>
                <td>照片</td>
                <td> <img src="${picPath}${product.photo.path}"></td>
            </tr>
            <tr>
                <td>地区</td>
                <td> ${product.nation.name}</td>
            </tr>
            <tr>
                <td>城市</td>
                <td> ${product.city.name}</td>
            </tr>
            <tr>
                <td>供应商</td>
                <td> ${product.vender.venderName}</td>
            </tr>
            <tr>
                <td>供应商图片</td>
                <td> ${product.vender.photo.path}</td>
            </tr>
            <tr>
                <td>discount</td>
                <td> ${product.discount}</td>
            </tr>
            <tr>
                <td>highlight</td>
                <td> ${product.highlight}</td>
            </tr>
            <tr>
                <td>intro</td>
                <td> ${product.intro}</td>
            </tr>
            <tr>
                <td>targetUsers</td>
                <td> ${product.targetUsers}</td>
            </tr>
            <tr>
                <td>detail</td>
                <td> ${product.detail}</td>
            </tr>
            <tr>
                <td>priceDetail</td>
                <td> ${product.priceDetail}</td>
            </tr>
            <tr>
                <td>timePlace</td>
                <td> ${product.timePlace}</td>
            </tr>
            <tr>
                <td>score</td>
                <td> ${product.score}</td>
            </tr>
            <tr>
                <td>favoriteNum</td>
                <td> ${product.favoriteNum}</td>
            </tr>
            <tr>
                <td>clickNum</td>
                <td> ${product.clickNum}</td>
            </tr>
            <tr>
                <td>sharingNum</td>
                <td> ${product.sharingNum}</td>
            </tr>
            <tr>
                <td>ratio</td>
                <td> ${product.productRatio.ratio}</td>
            </tr>
            <tr>
                <td>过期时间</td>
                <td> ${product.expDate}</td>
            </tr>
            <tr>
                <td>详情图片</td>
                <td>
                    <img src="${picPath}${product.introPhoto.path!=null?product.introPhoto.path:'/fly/product/default.jpg'}">
                </td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    var app = angular.module("app", ['ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
    });
</script>
</body>
</html>
