<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/11/9
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>登录</title>
    <%@include file="commonResource.jsp" %>
    <style type="text/css">
        body {
            font-family: "Microsoft YaHei", "Arial";
        }

        body > div > div > div {
            width: 1000px;
            margin: 0 auto;
        }

        .header {
            height: 100px;
        }

        .container {
            background: url("<%=resourcePath%>/img/login/background.png") no-repeat center;
            height: 600px;
            width: auto;
        }

        .loginArea {
            float: right;
            height: 400px;
            width: 380px;
            margin-top: 115px;
            background: #f4f4f4;
            border-radius: 5px;
        }

        .loginArea div > span {
            display: inline-block;
            width: 40%;
            line-height: 40px;
            text-align: center;
            font-size: 16px;
            color: #b0b0b0;
            background: #f4f4f4;
            cursor: pointer;
            border-bottom: 1px solid #b0b0b0;
            margin-top: 35px;
        }

        .loginArea div > li {
            display: inline-block;
            width: 40%;
            line-height: 40px;
            text-align: center;
            font-size: 16px;
            color: #b0b0b0;
            background: #f4f4f4;
            cursor: pointer;
            margin-top: 35px;
        }

        .loginArea div > button {
            width: 70%;
            height: 40px;
            background: #009aed;
            border: none;
            color: #FFF;
        }

        .loginArea .active {
            color: #009aed;
            border-bottom: 1px solid #009aed;
        }

        .loginArea .inputArea {
            width: 70%;
            height: 40px;
            border: 1px solid;
            margin: 30px auto;
        }

        .loginArea .inputArea img {
            height: auto;
            width: auto;
            padding: 10px;
        }

        .loginArea .inputArea input {
            background: transparent;
            width: 80%;
            height: 100%;
            outline: none;
            border: none;
        }

        #loginForm {
            margin-left: 10%;
        }

        #registerForm {
            margin-right: 10%;
        }

        .footer {
            background: #f4f4f4;
            height: 250px;
        }

        .footer p, li {
            text-align: center;
            line-height: 24px;
        }

        .footer p {
            margin-bottom: 0;
        }

        .footer ul {
            list-style: none;
            margin: auto auto 30px;
            width: 450px;
            height: 24px;
        }

        .footer li {
            margin: 0;
            padding: 0;
            float: left;
        }

        .shuxian {
            width: 28px;
            text-align: center;
        }
    </style>
</head>
<body>
<div ng-controller="mainController">
    <div class="header">
        <div>
            <img src="<%=resourcePath%>/img/login/logo.png" style="float: left;margin-top: 21px;"/>
        </div>
    </div>
    <div class="container">
        <div>
            <div class="loginArea">
                <div>
                    <span id="loginForm" class="active">登录</span><span id="registerForm">注册</span>
                </div>
                <div class="inputArea">
                    <img src="<%=resourcePath%>/img/login/account.png">
                    <input name="username" type="text" placeholder="手机号" ng-model="username"
                           ng-keyup="$event.keyCode == 13 && login()">
                </div>
                <div class="inputArea">
                    <img src="<%=resourcePath%>/img/login/password.png">
                    <input name="password" type="password" placeholder="请输入密码" ng-model="password"
                           ng-keyup="$event.keyCode == 13 && login()">
                </div>
                <div style="text-align: center">
                    <button ng-click="login()">立即登录</button>
                </div>
                <div style="margin: auto;">
                    <li style="margin-left: 10%;">注册飞出国账号</li>
                    <li>找回密码</li>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div style="height: 200px;padding-top: 30px;">
            <ul>
                <li>首页</li>
                <li class="shuxian">|</li>
                <li>留学优选</li>
                <li class="shuxian">|</li>
                <li>推荐商家</li>
                <li class="shuxian">|</li>
                <li>出国社区</li>
                <li class="shuxian">|</li>
                <li>联系我们</li>
            </ul>
            <p>
                北京市朝阳区东三环中路7号北京财富中心916A
            </p>
            <p>
                版权所有 copyright © 2014 京ICP备 15033976号
            </p>
        </div>
    </div>
</div>
<script type="text/javascript">
    var app = angular.module("app", ['ngAnimate', 'ui.bootstrap']);
    app.controller("mainController", function ($scope, $http) {
        $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

        $scope.username = "";
        $scope.password = "";

        var url = "login.htm";
        $scope.login = function () {
            if (!$scope.username) {
                alert('用户名为空');
            }
            if (!$scope.password) {
                alert('密码为空');
            }
            var params = $.param({
                username: $scope.username,
                password: $scope.password
            });
            $http({
                method: 'POST',
                url: url,
                data: params
            }).then(function success(response) {
                var result = response.data;
                $scope.schools = result.data;
                $scope.pagination = result.pagination;

                if (!!result.result) {
                    $('#queryCoverModal').modal('hide');
                    window.location.href = "<%=path%>/home/home.htm"
                } else {
                    alert(result.message)
                }
            }, function error() {
                $('#queryCoverModal').modal('hide');
                $scope.errorMsg = '发生未知错误，请与系统管理员联系！';
            });
        };
    });
</script>
</body>
</html>
