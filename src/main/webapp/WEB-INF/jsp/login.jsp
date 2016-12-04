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
        body, ul, ol, li, dl, dt, dd, h1, h2, h3, h4, h5, h6, div, span, a, input, img, p {
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 12px;
            font-family: "Microsoft YaHei", "Arial";
            background: #f7f7f7;
        }

        ul {
            list-style: none;
        }

        ol {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: black;
            outline: none
        }

        a:hover {
            text-decoration: none;
            outline: none
        }

        img {
            border: none;
        }

        input {
            outline: none
        }

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

        .loginArea input:-webkit-autofill {
            background-color: transparent !important;
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
            color: #0099ec;
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
            width: 80%;
            height: 40px;
            border: 1px solid #ccc;
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

        .verification {
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 0 !important;
            border: 1px solid #ccc;
        }

        .verificationValid {
            color: #606164 !important;
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

        .vertisuc {
            display: none
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
                <div class="loginTab">
                    <span id="loginForm" class="active">登录</span><span id="registerForm">注册</span>
                </div>
                <div class="loginContent">
                    <div>
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
                            <li style="margin-left: 10%;" id="goRegister">注册飞出国账号</li>
                            <li>找回密码</li>
                        </div>
                    </div>
                    <div style="display: none">
                        <div class="inputArea">
                            <img src="<%=resourcePath%>/img/login/account.png">
                            <input name="phonenumber" type="text" placeholder="输入手机号" ng-model="phonenumber"
                                   ng-keyup="$event.keyCode == 13 && login()">
                        </div>
                        <div class="inputArea" style="position: relative;border: none;">
                            <div style="display: inline-block;border: 1px solid #ccc;width: 54%;">
                                <img src="<%=resourcePath%>/img/login/verification.png">
                                <input name="verifCode" type="text" style="width: 60%;" maxlength="6"
                                       placeholder="输入6位校验码" ng-model="verifCode"
                                       ng-keyup="$event.keyCode == 13 && login()">
                            </div>
                            <span class="verification verificationValid"
                                  ng-click="getvertf($event.target)">获取验证码</span>
                            <p class="vertisuc" style=" text-align: center; color: red; line-height: 2;">验证码已发送成功</p>
                        </div>
                        <div class="inputArea">
                            <img src="<%=resourcePath%>/img/login/password.png">
                            <input name="setpassword" type="password" placeholder="请输入密码" ng-model="setpassword"
                                   ng-keyup="$event.keyCode == 13 && login()">
                        </div>
                        <div style="text-align: center">
                            <button ng-click="register()">立即注册</button>
                        </div>
                        <div style="margin: auto;text-align: center; line-height: 3;">
                            已有账号&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)" style="color: #0099ec;" id="goLanding">去登陆</a>
                        </div>
                    </div>
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
                return
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

        //获取验证码
        $scope.getvertf = function (ele) {
            var item = $(ele);

            if (!item.hasClass("verificationValid")) {
                console.log('invalid');
                return;
            }
            if (!/^((13|14|15|17|18)){1}\d{9}$/.test($scope.phonenumber)) {
                alert('请输入正确的手机号');
                return
            }
            var params = $.param({
                tel: $scope.phonenumber
            });
            $http({
                method: 'POST',
                url: '<%=path%>/verification/get.htm',
                data: params
            }).then(function success(response) {
                var result = response.data;
                $scope.schools = result.data;
                $scope.pagination = result.pagination;

                if (!!result.result) {
                    item.removeClass('verificationValid');
                    var seconds = 60;
                    item.text('(' + seconds + 's)后获取');

                    setInterval(function () {
                        seconds--;
                        if (seconds == 0) {
                            item.text('获取验证码');
                            item.addClass('verificationValid');
                        } else {
                            item.text('(' + seconds + 's)后获取');
                        }
                    }, 1000);
                } else {
                    alert(result.message)
                }
            }, function error() {
                $('#queryCoverModal').modal('hide');
                $scope.errorMsg = '发生未知错误，请与系统管理员联系！';
            });
        };


        //注册
        $scope.register = function () {
            if (!$scope.phonenumber) {
                alert('电话号码为空');
                return
            }
            if (!$scope.verifCode) {
                alert('验证码为空');
                return
            }
            if (!$scope.setpassword) {
                alert('密码为空');
            }
            var params = $.param({
                phonenumber: $scope.phonenumber,
                verifCode: $scope.verifCode,
                setpassword: $scope.setpassword
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
                    $('#loginForm').addClass("active").siblings().removeClass('active');
                    $(".loginContent>div").eq($(".loginTab span").index('#loginForm')).show().siblings().hide();
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
<script>
    $(".loginTab span").click(function () {
        $('input').val('');
        $(this).addClass("active").siblings().removeClass('active');
        $(".loginContent>div").eq($(".loginTab span").index(this)).show().siblings().hide();
    });
    $('#goLanding').click(function () {
        $('input').val('');
        $('#loginForm').addClass("active").siblings().removeClass('active');
        $(".loginContent>div").eq($(".loginTab span").index('#loginForm')).show().siblings().hide();
    })

    $('#goRegister').click(function () {
        $('input').val('');
        $('#registerForm').addClass("active").siblings().removeClass('active');
        $(".loginContent>div").eq($(".loginTab span").index('#registerForm')).show().siblings().hide();
    })
</script>
</body>
</html>
