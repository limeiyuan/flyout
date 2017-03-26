<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.flyout.common.auth.AuthHelper" %>
<%@ page import="com.flyout.domain.Account" %>
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

    .fl {
        float: left;
    }

    .fr {
        float: right;
    }

    .cl {
        clear: both;
    }

    .topHead {
        height: 35px;
        width: 100%;
        background: #f5f5f5;
        border-bottom: 1px solid #eee;
    }

    .topHeadContent {
        width: 1200px;
        margin: 0 auto;
        line-height: 30px;
        font-size: 12px;
    }

    .regisLogin {
    }

    .login {
        margin-right: 18px;
    }

    .topHeadContentLeft a, .topHeadContentRightUl li a {
        color: #666;
    }

    .topHeadContentLeft a:hover {
        color: #666;
        text-decoration: none;
        outline: none
    }

    .topHeadContentRightUl .hiName {
        color: #ff3638;
        margin: 0 10px;
    }

    .registerMargin {
        margin: 0 20px 0 8px
    }

    .topHeadContentRightUl li {
        float: left;
        width: 100px;
        text-align: center
    }

    .topHeadContentRightUl li.iconImage {
        width: 45px;
    }

    .topHeadContentRightUl li a:hover {
    }

    .topHeadContentRightUl li.shuxian {
        width: 28px;
        text-align: center;
        color: #999;
    }

    .topHeadContentRightUl li.goalCol::before {
        content: url("<%=resourcePath%>/img/home/col.png");
        margin-right: 8px;
    }

    .topHeadContentRightUl .moreServ::before {
        content: url("<%=resourcePath%>/img/home/more.png");
        margin-right: 8px;
    }

    .topHeadContentRightUl .moreServ {
        background: url("<%=resourcePath%>/img/home/arrow_down.png") no-repeat right 15px;
    }

    .topHeadContentRightUl .weibo {
        display: inline-block;
        height: 30px;
        width: 18px;
        background: url("<%=resourcePath%>/img/home/weibo.png") no-repeat left center
    }

    .topHeadContentRightUl .weixin {
        display: inline-block;
        height: 30px;
        width: 18px;
        background: url("<%=resourcePath%>/img/home/weixin.png") no-repeat right center
    }

    /*logoSearch开始*/
    .logoFly {
        width: 100%;
        background: #fff;
    }

    .logoSearch {
        width: 1200px;
        height: 100px;
        margin: 0 auto;
        overflow: hidden;
    }

    .logoSearch .logo {
        background: url("<%=resourcePath%>/img/home/logo.png") no-repeat center center;
        width: 160px;
        height: 100px;
        cursor: hand;
    }

    .logoSearch .search {
        width: 500px;
        height: 32px;
        margin: 26px auto 0;
    }

    .logoSearch .freeTel {
        width: 180px;
        height: 100px;
    }

    .logoSearch .freeTel .telIcon {
        width: 30px;
        height: 35px;
        margin-top: 35px;
    }

    .logoSearch .freeTel > div {
        margin-top: 32px;
    }

    .logoSearch .freeTel .telNum {
        font-size: 18px;
        font-weight: bold;
        color: #fb5454;
        padding: 0;
        margin: 0;
        line-height: 24px;
    }

    .logoSearch .freeTel .telTime {
        font-size: 12px;
        color: #666;
        padding: 0;
        margin: 0
    }

    .search .searchBox {
        overflow: hidden;
        width: 478px;
    }

    .search .seatchSchool {
        width: 76px;
        display: inline-block;
        line-height: 33px;
        text-align: center;
        background: #f5f5f5;
        background: #f5f5f5 url("<%=resourcePath%>/img/home/select.png") no-repeat 65px center;
        background-size: 10%;
        cursor: pointer;
    }

    .search .searchInput {
        border: 1px solid #0099ec;
    }

    .search .search_box {
        display: inline-block;
    }

    .search input {
        width: 316px;
        border: none;
        padding: 0 22px 0 16px;;
        line-height: 22px;
    }

    .search a {
        width: 79px;
        height: 35px;
        background: #0099ec;
        line-height: 35px;
        font-size: 16px;
        color: #fff;
        text-align: center
    }

    .search a:hover {
        color: #fff;
    }

    .topHeadContentRightUl li .moreServList {
        display: none;
        position: absolute;
        width: 100px;
        z-index: 99;
        background: #fff;
        cursor: pointer;
        text-indent: 2em
    }

    .searchBox .searchList {
        position: absolute;
        display: none;
        z-index: 99;
        width: 80px;
        text-align: center;
        background: #fff;
        line-height: 2;
    }

    /*logoSearch结束*/
    /*nav开始*/
    .nav {
        height: 50px;
        width: 100%;
        line-height: 50px;
        background: #fff;
        border-bottom: 1px solid #0099ec;
    }

    .nav_active {
        background: #0099ec;
        color: #fff;
    }

    .navContent {
        width: 1200px;
        margin: auto;
    }

    .navContent ul li {
        display: inline;
    }

    .navContent ul li a {
        float: left;
        width: 100px;
        font-size: 14px;
        text-align: center;
        color: #333;
    }

    .navContent ul li a:hover {
        background: #0099ec;
        color: #fff;
    }
</style>
<div class="topHead">
    <div class="topHeadContent">
        <div class="topHeadContentLeft fl">
            <a href="javascript:void(0)">咨询热线：4006688066</a>
        </div>
        <div class="topHeadContentRight fr">
            <ul class="topHeadContentRightUl">
                <li class="sayHi"><a href="javascript:void(0)">Hi,</a><a href="/profile/index.htm"
                                                                         class="hiName"><%=user.getId() == null ? "" : user.getScreenname()%>
                </a><a href="javascript:void(0)" onclick="logout()">退出</a></li>
                <li class="regisLogin"><a href="/login/index.htm" class="login">登录</a><a
                        href="/login/register.htm">注册</a></li>
<%--                <li class="shuxian">|</li>
                <li class="goalCol"><a href="javascript:void(0)">目标院校</a></li>
                <li class="shuxian">|</li>
                <li class="moreServ">更多服务
                    <ul class="moreServList">
                        <li>海外移民</li>
                        <li>海外房产</li>
                        <li>帮助中心</li>
                        <li>关于我们</li>
                    </ul>
                </li>--%>
                <li class="shuxian">|</li>
                <li class="iconImage"><a href="javascript:void(0)" class="weibo fl"></a><a href="javascript:void(0)"
                                                                                           class="weixin fr"></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="logoFly">
    <div class="logoSearch">
        <div class="logo fl" id="pic_logo"></div>
        <div class="freeTel fr">
            <img class="telIcon fl" src="<%=resourcePath%>/img/home/tel.png" alt="">
            <div class="fr">
                <p class="telNum">400-6688066</p>
                <p class="telTime">免费咨询电话：9:00-18:00</p>

            </div>
        </div>
        <div class="search">
            <div class=searchBox>
                <div class="searchInput fl">
                    <div class="search_box">
                        <div class="seatchSchool">搜学校</div>
                        <ul class="searchList">
                            <li>移民项目</li>
                            <li>海外房产</li>
                        </ul>
                    </div>
                    <input type="text" placeholder="澳大利亚留学"/></div>
                <a href="javascript:void(0)" class="fl">搜索</a>
            </div>

        </div>
    </div>
</div>
<div class="nav">
    <div class="navContent">
        <ul>
            <li><a href="<%=path%>/home/home.htm">首页</a></li>
            <li><a href="<%=path%>/abroadRecommend/index.htm">留学优选</a></li>
            <li><a href="<%=path%>/school/index.htm">海外院校</a></li>
            <li><a href="http://www.lionstudy.com">语言中心</a> </li>
        </ul>
    </div>
</div>

<!-- 数据loading -->
<div id="queryCoverModal" style="display: none;" class="modal fade bs-example-modal-sm" tabindex="-1"
     role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="mySmallModalLabel">查询数据中</h4>
            </div>
            <div class="modal-body">
                喝杯咖啡，稍等片刻，正在飞速赶来......
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    var username = '<%=user.getId()==null?"":user.getScreenname()%>';
    if (!username) {
        $('.sayHi').css({"display": "none"});
    } else {
        $('.regisLogin').css({"display": "none"});
    }

    $('#pic_logo').on('click', function () {
        window.location.href = "<%=path%>/home/home.htm";
    });

    function logout() {
        $.ajax({
            url: '<%=path%>/login/logout.htm',
            method: 'post',
            success: function (data) {
                if (!!data.result) {
                    username = "";
                    $('.sayHi').css({"display": "none"});
                    $('.regisLogin').css({"display": "inline"});
                }
            }
        });
    }
</script>

<script type="text/javascript">
    $('.navContent a').each(function (index, a) {
        var url = $(a).attr('href');
        if (window.location.href.indexOf(url) > -1) {
            $('.navContent a').removeClass('nav_active');
            $(a).addClass('nav_active');
        }
    });
    $('.moreServ').mouseenter(function () {
        $('.moreServList').show();
        $(this).parent().find('li').hover(function () {
            $(this).css('color', '#0099ec')
        }, function () {
            $(this).css('color', '#000')
        });
    });
    $('.moreServ').mouseleave(function () {
        $('.moreServList').hide()
    });
    $('.search_box').click(function () {

        $('.searchList').toggle();
        $(this).parent().find('li').hover(function () {
            $(this).css('color', '#0099ec')
        }, function () {
            $(this).css('color', '#000')
        });
    });
    $('.search_box').mouseleave(function () {
        $('.searchList').hide()
    });
    $('.searchList li').click(function () {
        // $(this).parents('li').find('input').val($(this).html());
        $('.seatchSchool').html($(this).html());
        $('.searchList').slideUp(1);
    });
</script>
