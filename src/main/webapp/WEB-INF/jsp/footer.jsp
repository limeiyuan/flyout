<%@ page import="com.flyout.common.dto.CustomServiceDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomServiceDto dto = AuthHelper.getCustomServiceDto();
    String paramStr = "";
    if (dto.getUserId() != null) {
        paramStr = "&partnerId=" + dto.getUserId() + "&uname=" + dto.getName();
        if (dto.getTel() != null) {
            paramStr += "&tel=" + dto.getTel();
        }
        if (dto.getEmail() != null) {
            paramStr += "&email=" + dto.getEmail();
        }
    }
%>
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
        color: black;
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

    .footer {
        width: 100%;
        height: 360px;
        background: #303030;
    }

    .footerBox {
        width: 1200px;
        height: 360px;
        margin: 20px auto;
    }

    .footerLogo {
        width: 160px;
        height: 250px;
    }

    .footerLogo img {
        margin-top: 50%;
        height: 57px
    }

    .footerCont {
        padding-top: 30px;
    }

    .footerwei {
        width: 660px;
        height: 250px;
        margin: 0 360px 0 205px;
        border-left: 1px solid #eee;
        border-right: 1px solid #eee;;
    }

    .footerwei ul {
        overflow: hidden;
        width: 100%;
    }

    .footerwei ul img {
        height: 100px;
    }

    .footerwei li {
        float: left;
        text-align: center;
        width: 100px;
        margin: 26px 89px 26px 0;
    }

    .footerwei .weChat {
        margin-left: 89px;
    }

    .footerwei li p {
        color: #f2f2f2;
    }

    .footerwei p {
        text-align: center;
        font-size: 12px;
        color: #f2f2f2;
        line-height: 20px;
    }

    .footerTel {
        width: 300px;
        height: 250px;;
        color: #f2f2f2;
    }

    .footerTel div {
        margin: 50px 0 0 30px;
    }

    .serviceTel {
        background: url("<%=resourcePath%>/img/home/hotline.png") no-repeat left center;
        text-indent: 20px;
    }

    .serviceNum {
        font-size: 30px;
        font-weight: bold;
        line-height: 50px;
    }

    .serviceQQ {
        margin-top: 5px;
    }

    .serviceQQ, .serviceEmail {
        line-height: 22px;
    }

    .footerBox .footerInfo {
        height: 30px;
        color: #f2f2f2;
    }

    .footerBox .footerInfo .shuxian {
        width: 28px;
        text-align: center;
    }

    .footerBox ul li {
        float: left;
        text-align: center;
    }

    .footerAgency {
        width: 500px;
        margin: 20px auto 0;
    }

    .VIPAgency {
        color: #fb5454;
    }

    .zhichiContainer {
        width: 120px;
        height: 120px;
        position: fixed;
        bottom: 100px;
        right: 0;
    }

    .toolbar-item,.toolbar-layer{background:url(<%=resourcePath%>/img/home/toolbar.png) no-repeat;}
    .toolbar{position:fixed;right:0px;bottom:50px;}/*假设网页宽度为1200px，导航条在右侧悬浮*/
    .toolbar-item{display:block;width:52px;height:52px;margin-top:1px;position:relative;-moz-transition:background-position 1s;-ms-transition:background-position 1s;-o-moz-transition:background-position 1s;-webkit-moz-transition:background-position 1s;transition:background-position 1s;}
    .toolbar-item:hover .toolbar-layer{opacity:1;filter:alpha(opacity=100);transform:scale(1);-webkit-transform:scale(1);-moz-transform:scale(1);-ms-transform:scale(1);-o-transform:scale(1);}
    .toolbar-item-weixin{background-position:0 -798px;}
    .toolbar-item-weixin:hover{background-position:0 -860px;}
    .toolbar-item-weixin .toolbar-layer{height:212px;background-position:0 0;}
    .toolbar-item-feedback{background-position:0 -426px;}
    .toolbar-item-feedback:hover{background-position:0 -488px;}
    .toolbar-item-app{background-position:0 -550px;}
    .toolbar-item-app:hover{background-position:0 -612px;}
    .toolbar-item-app .toolbar-layer{height:194px;background-position:0 -222px;}
    .toolbar-item-top{background-position:0 -674px;}
    .toolbar-item-top:hover{background-position:0 -736px;}
    .toolbar-layer{position:absolute;right:46px;bottom:-10px;width:172px;opacity:0;filter:alpha(opacity=0);
        transform-origin: 95% 95%;-moz-transform-origin: 95% 95%;-ms-transform-origin: 95% 95%;-o-transform-origin: 95% 95%;-webkit-transform-origin: 95% 95%;transform:scale(0.01);
        -moz-transform:scale(0.01);-ms-transform:scale(0.01);-o-transform:scale(0.01);-webkit-transform:scale(0.01);transition:all 1s;-moz-transition:all 1s;-ms-transition:all 1s;-o-transition:all 1s;-webkit-transition:all 1s;}

</style>
<script src="http://www.sobot.com/chat/pc/pc.min.js?sysNum=adf09e896940434e948c99693048de37<%=paramStr%>"
        id="zhichiload"
        class="zhichi"></script>

<div class="toolbar">
    <a href="javascript:void(0);" class="toolbar-item toolbar-item-weixin"><span class="toolbar-layer"></span></a>
    <a href="javascript:void(0);" class="zhichi toolbar-item toolbar-item-feedback"></a>
    <a href="javascript:void(0);" class="toolbar-item toolbar-item-app"><span class="toolbar-layer"></span></a>
    <a href="javascript:scroll(0,0)" id="top" class="toolbar-item toolbar-item-top"></a>
</div>


<div class="footer">
    <div class="footerBox">
        <div class="footerCont">
            <div class="footerLogo fl">
                <img src="<%=resourcePath%>/img/home/logo_bottom.png" alt="">
            </div>
            <div class="footerTel fr">
                <div>
                    <p class="serviceTel">客服热线</p>
                    <p class="serviceNum">010-65308635</p>
                    <p class="serviceQQ">QQ咨询：3269155071</p>
                    <p class="serviceEmail">服务邮箱： Info@fcgliuxue.com</p>
                </div>
            </div>
            <div class="footerwei">
                <ul>
                    <li class="weChat"><img src="<%=resourcePath%>/img/downloadApp.png" alt="">
                        <p>下载App</p>
                    </li>
                    <li><img src="<%=resourcePath%>/img/weibo.png" alt="">
                        <p>官方微博</p></li>
                    <li><img src="<%=resourcePath%>/img/weixin.jpg" alt="">
                        <p>订阅号</p></li>
                </ul>
                <p>鹏润海微咨询（北京）有限公司 </p>
                <p>北京市朝阳区东三环中路7号财富中心写字楼A座916A</p>
                <p>版权所有 copyright ©京ICP备 16057147号</p>
            </div>
        </div>
        <ul class="footerInfo footerAgency">
            <li>合作机构：</li>
            <li class="VIPAgency">太平洋教育联盟</li>
            <li class="shuxian">|</li>
            <li>澳洲移民局</li>
            <li class="shuxian">|</li>
            <li>华泰保险</li>
            <li class="shuxian">|</li>
            <li>华夏银行</li>
        </ul>
        <%--        <ul class="footerInfo">
                    <li>友情链接：</li>
                    <li>国际游学</li>
                    <li class="shuxian">|</li>
                    <li>通化公务员考试网</li>
                    <li class="shuxian">|</li>
                    <li>北京翻译公司</li>
                    <li class="shuxian">|</li>
                    <li>雅思考试时间</li>
                    <li class="shuxian">|</li>
                    <li>西安培训机构</li>
                    <li class="shuxian">|</li>
                    <li>统计从业</li>
                    <li class="shuxian">|</li>
                    <li>新东方gre培训</li>
                    <li class="shuxian">|</li>
                    <li>上海培训学校</li>
                    <li class="shuxian">|</li>
                    <li>教育论文发表</li>
                    <li class="shuxian">|</li>
                    <li>统计从业</li>
                    <li class="shuxian">|</li>
                    <li>新东方gre培训</li>
                    <li class="shuxian">|</li>
                    <li>教育论文发表</li>
                </ul>--%>
    </div>
</div>

