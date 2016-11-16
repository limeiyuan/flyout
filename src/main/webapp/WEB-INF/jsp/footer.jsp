<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    body,ul,ol,li,dl,dt,dd,h1,h2,h3,h4,h5,h6,div,span,a,input,img,p{ margin: 0; padding: 0;}
    body{ font-size: 12px; font-family: "Microsoft YaHei","Arial";background: #f7f7f7;}
    ul{ list-style: none;}
    ol{ list-style: none;}
    a{ text-decoration: none;  color:black; outline: none}
    a:hover{ text-decoration: none;  color:black; outline: none}
    img{border: none;}
    input{ outline: none}
    .fl{float: left;}
    .fr{float: right;}
    .footer{width: 100%;height: 360px;background: #303030;}
    .footerBox{width: 1200px;height: 360px;margin: 20px auto;}
    .footerLogo{width: 160px;height: 250px;}
    .footerLogo img{margin-top: 50%; height: 57px}
    .footerCont{padding-top: 30px;}
    .footerwei{width: 660px;height: 250px;margin:0 360px 0 205px;border-left:  1px solid #eee;border-right:  1px solid #eee;;}
    .footerwei ul{overflow: hidden;width: 100%;}
    .footerwei ul img{height: 100px;}
    .footerwei li{float: left; text-align: center;width: 100px;margin: 26px 89px 26px 0; }
    .footerwei .weChat{margin-left: 89px;}
    .footerwei li p{color: #f2f2f2;}
    .footerwei p{text-align: center;font-size: 12px;color: #f2f2f2;line-height: 20px;}
    .footerTel{width: 300px;height: 250px;;color: #f2f2f2;}
    .footerTel div{margin: 50px 0 0 30px;}
    .serviceTel{background: url("<%=resourcePath%>/img/home/hotline.png")no-repeat left center;text-indent: 20px;}
    .serviceNum{font-size: 30px;font-weight: bold;line-height: 50px;}
    .serviceQQ{margin-top: 5px;}
    .serviceQQ,.serviceEmail{line-height: 22px;}
    .footerBox .footerInfo {height: 30px;color: #f2f2f2; }
    .footerBox .footerInfo .shuxian{width: 28px;text-align: center;}
    .footerBox ul li{float: left;text-align: center;}
    .footerAgency{width: 500px;margin: 20px auto 0;}
    .VIPAgency{color:#fb5454;}
</style>
<div class="footer">
    <div class="footerBox">
        <div class="footerCont">
            <div class="footerLogo fl">
                <img src="<%=resourcePath%>/img/home/logo_bottom.png" alt="">
            </div>
            <div class="footerTel fr">
                <div>
                    <p class="serviceTel">客服热线</p>
                    <p class="serviceNum">010-52126919</p>
                    <p class="serviceQQ">QQ咨询：3269155071</p>
                    <p class="serviceEmail">服务邮箱： info@feichuguo.cn</p>
                </div>
            </div>
            <div class="footerwei">
                <ul>
                    <li class="weChat"><img src="<%=resourcePath%>/img/home/qrcode_weixin.png" alt="">
                        <p>微信</p>
                    </li>
                    <li><img src="<%=resourcePath%>/img/home/qrcode_weixin.png" alt="">
                        <p>微信</p></li>
                    <li><img src="<%=resourcePath%>/img/home/qrcode_weixin.png" alt="">
                        <p>微信</p></li>
                </ul>
                <p>海拓华星教育科技（北京）有限公司 </p>
                <p>北京市朝阳区东三环中路7号北京财务中心916A</p>
                <p>版权所有 copyright ©京ICP备 15033976号</p>
            </div>
        </div>
        <ul class="footerInfo footerAgency">
            <li>合作机构：</li>
            <li class="VIPAgency">太平洋教育联盟</li>
            <li class="shuxian">|</li>
            <li>美联英语</li>
            <li class="shuxian">|</li>
            <li>澳洲移民局</li>
            <li class="shuxian">|</li>
            <li>华泰保险</li>
            <li class="shuxian">|</li>
            <li>华夏银行</li>
        </ul>
        <ul class="footerInfo">
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
        </ul>
    </div>
</div>
