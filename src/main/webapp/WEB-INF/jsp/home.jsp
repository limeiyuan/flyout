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
        /*banner开始*/
        .banner{width: 100%;height: 400px;position: relative}
        .banner .bannerImage img{height: 100%;}
        .banner .estimateContainer{width: 1200px;position: absolute;right: 50%;top: 0;}
        .banner .estimate{width: 300px;height: 400px;position: relative;right: -50%;float: right;background: #fff;}
        .estimate div{height: 40px;}
        .estimate div>span{display: inline-block;width: 50%;line-height: 40px;text-align: center;font-size: 16px;color: #666;background: #f0f0f0;cursor:pointer;}
        .estimate div .active{color: #0099ec;background: #fff;}
        .estimate ul{width: 100%;overflow: hidden;}
        /*.estimate ul li{width: 240px;height: 30px;margin: 30px auto;border: 1px solid #d2d2d2;border-radius: 45px;}*/
        .estimate ul .focusCur{border-color: #0099ec;overflow: hidden; background: #fff;}
        .estimate ul .fastEst{background: #0099ec;color: #fff;text-align: center;line-height: 30px;margin: 0 auto;cursor:pointer;}
        .estimate>ul>li{width: 240px;margin: 30px auto;border: 1px solid #d2d2d2;border-radius: 15px;position: absolute;left: 10%}
        .estimate ul li input{margin-left: 18px;width: 180px;border: none;outline: none;line-height: 26px;border-radius: 45px;}
        .estimate ul li span{font-size: 18px;color: #999;line-height: 12px;}
        .estimate ul li img{position: relative;top: -2px;}
        .estimate p{color: #666;text-align: center;line-height: 40px;}
        .estimate p span{color: #fb5454;}
        .select_box ul li { cursor: pointer; }
        .estimate .son_ul {text-indent: 12px; text-indent: 12px;border-radius:20px;background:#fff; position: relative; z-index: 5; }
        .estimate .son_ul li { display: block; line-height: 25px;  }
        .hover { background: #ccc; color: #fff; }
        /*banner结束*/
        /*products 开始*/
        .productsContent{ width: 1200px; margin: auto;height: 500px;margin-top: 20px;}
        .productsInfo{height: 34px;overflow: hidden;}
        .productsInfo::before{content:'|';background: #fb5454;width: 6px;height: 30px;float: left;color: #fb5454;margin-right: 5px;}
        .productsInfo h3,.teacher h3,.community h3{font-size: 16px;color: #333;font-weight: bold;}
        .productsInfo .abroad p,.abroad p,.community p,.teacher p{font-size: 12px;color: #666;font-family: Arial;}
        .moreAbroad{}
        .moreAbroad{ color: #666;    padding-right: 19px;line-height: 30px;cursor:pointer;}
        .productsList{overflow: hidden;margin-top: 5px;}
        .productImag{width: 228px;height: 450px;}
        .productsList ul li{float: right; width: 228px; height: 220px; margin: 5px; background: #fff;cursor: pointer;}
        .productsList ul li div{width: 210px; height: 150px; background: #ccc; margin: 8px auto;}
        .productsList ul li p{font-size: 14px;color: #333; padding-left: 14px;line-height: 20px;}
        .productsList ul li span{ height: 34px; display: block;font-size: 12px;color: #666; padding-left: 14px;line-height: 17px;overflow: hidden;}
        .productsList ul .productCurr div{ height: 110px; }
        .productsList ul  .productFly{ height: 32px; color: #666;background: none;}
        .productsList ul .productFly .flyAbroad{ height: 20px;line-height: 20px; width: 70px;background: url("<%=resourcePath%>/img/home/brand.png")no-repeat left center;padding-left: 26px;}
        .productsList ul .productFly .likeNum{ height: 20px;line-height: 20px;width: 40px; background: url("<%=resourcePath%>/img/home/like_slect.png")no-repeat left center;padding-left: 16px;}
        .intentionA{top:50px}
        .intentionB{top:110px}
        .intentionC{ top:170px}
        .intentionD{top:230px}
        .intentionE{bottom: 42px;}
        /*products结束*/
        /*consultant 开始*/
        .consultant{ width: 1200px; margin: auto;margin-top: 20px;}
        .teacher{height: 34px;overflow: hidden;padding-bottom: 6px;background: #f7f7f7;}
        .teacher::before{content:'|';background: #0099ec;width: 6px;height: 30px;float: left;color: #0099ec;margin-right: 5px;}
        .repuTeacher{margin: 30px auto; width: 1200px; position: relative;}
        .arrow_img{position: absolute; width: 100%; top: 50%;margin-top:-34px;}
        .repuTeacher ul{width: 100%;overflow: hidden; padding: 0 24px;}
        .repuTeacher ul li{width: 180px;height:220px;float: left; text-align: center;border:  1px solid #eee;margin: 0 21px;border-radius: 11px;margin-top: 60px;background: #fff;}
        .repuTeacher ul li .teacherImag{width: 120px;height: 120px;margin: auto;margin: 14px auto }
        .repuTeacher ul li .teacherImag img{width: 120px; height: 120px; border-radius: 50%;}

        .repuTeacher ul li p{font-size: 18px;font-weight: bold;color: #0099ec;margin-bottom: 8px;}
        .repuTeacher ul li span{color: #999;}
        .repuTeacher ul li.arrow{width: 1%;line-height: 220px;border: none;background: #f7f7f7;}
        .arrow img{position: relative; top: 50%;margin-top: -19px;}
        .repuTeacher ul li.teacherCur{width: 220px;height: 300px;margin-top: 12px;}
        .repuTeacher .teacherInfo{display: none;}
        .repuTeacher .teacherCur .teacherInfo{display: block;}
        .repuTeacher .teacherCur .teacherInfo p{color:#fb5454;width: 80%;margin: 8px auto; }
        .repuTeacher .teacherCur .teacherInfo div{margin:0 auto;width: 80px;height: 24px;line-height:24px;color: #999;border: 1px solid #999;border-radius: 12px;text-align: center;cursor: pointer; }
        /*consultant结束*/
        /*questionsAnswers开始*/
        .queAns{width: 1200px; margin: auto;margin-top: 20px;}
        .communityBox{width: 1200px;height: 30px;}
        .communityBox .shuxian{font-size: 18px;padding: 0;color: #999;}
        .community::before{content:'|';background: #fb5454;width: 6px;height: 30px;float: left;color: #fb5454;margin-right: 5px;}
        .community{ width: 200px;}
        .communityBox ul li{ float: left;line-height: 30px;padding: 0 16px;font-size: 14px;}
        .communityBox ul li img{margin-top: 6px;}
        .communityBox ul li span{color:#0099ec;}
        .queAnsExam{width: 1200px;height: 180px;border: 1px solid #999;margin-top: 12px;}
        .examples{width: 958px;height: 180px;float: left;}
        .queAnsExam .goQues{width: 239px;height: 160px;float: left;border-left: 1px solid #999;margin-top: 10px;}
        .examples li{font-size: 14px;color: #666;margin: 20px 24px;}
        .examples li p{display: inline-block;width: 800px;white-space:nowrap;overflow: hidden;text-overflow:ellipsis;}
        .examples li span{float: right;font-size: 12px;color: #666;}
        .examples .quePre, .examples .quePre span{color: #999;}
        .goQues div{width: 120px;height: 42px;background: #0099ec;margin: 56px auto 13px;line-height: 42px;text-align: center;color: #fff;border-radius: 30px;cursor:pointer;}
        .goQues p{font-size: 14px;color: #666;text-align: center;}
        /*questionsAnswers结束*/
        /*studyAbroad开始*/
        .studyAbroad{width: 1200px;margin: 30px auto;overflow: hidden;}
        .moreStudy{padding-right: 30px;font-size: 14px;color: #666;cursor: pointer;}
        .studyTab{width: 1200px;height: 320px;}
        .studyTab .tabBox{width: 820px;height: 320px;background: #fff;}
        .studyTab .vidoBox{width: 320px;height: 320px;background: #fff;margin-top: 6px;}
        .studyTab .vidoBox h3{font-size: 16px;color: #333;font-weight: bold;padding: 0 5px;margin: 10px auto;}
        .studyTab .vidoBox h3 a{float: right;color: #999;font-size: 14px;}
        .studyTab .vidoBox div{ width: 100%;height: 100%;border-top: 1px solid #999;}
        .studyTab .vidoBox .vidoContent{width: 80%;height: 80%;background: #ccc;margin: 5% auto;}
        .tabbedPanels{ overflow:hidden; margin:10px auto;}
        .tabbedPanels .examples li p{width:520px;}
        .tabbedPanels .examplesCoten{height: 286px;}
        .tabbedPanels ul{ list-style:none; margin:0; padding:0; overflow:hidden; border-bottom: 1px solid #999;width: 820px;}
        .tabbedPanels li.tab{ float:left; width:120px;font-size:16px;text-align:center; cursor:pointer;color: #666;  padding-bottom: 10px; }
        .tabbedPanels div.contentGroup{ clear:both; overflow:hidden;}
        .tabbedPanels div.content{ width:100%; display:none; height:400px;}

        .tabbedPanels li.selectedTab{font-weight:bold; color: #0099ec;border-bottom: 1px solid #0099ec; }
        .tabbedPanels div.selectedContent{ display:block;}

        /*studyAbroad结束*/
        /*caseBox开始*/
        .caseBox{width: 1200px;margin: 20px auto;}
        .caseContent{width: 1200px;overflow: hidden;position: relative;}
        .caseContent li{float: left;}
        .caseBox .caseContent li img{width: 80%;}
        .caseContent ul{overflow: hidden;padding: 0 14px;}
        .caseBox .caseContent ul .arrow{width: 1200px;margin:0 auto; width: 1%; line-height: 220px; border: none;}
        .caseBox .caseContent ul li{height:220px;float: left; text-align: center;margin: 0 26px;margin-top: 60px;}
        .caseBox .caseContent ul .case0,.caseBox .caseContent ul .case6{height:78px;width:104px;float: left; text-align: center;margin: 60px 14px 0;}
        .caseBox .caseContent ul .case0 div,.caseBox .caseContent ul .case6 div{display: none;}
        .caseBox .caseContent ul .case1,.caseBox .caseContent ul .case5{height:108px;width:134px;float: left; text-align: center;margin: 45px 14px 0;}
        .caseBox .caseContent ul .case1 div,.caseBox .caseContent ul .case5 div{display: none;}
        .caseBox .caseContent ul .case2,.caseBox .caseContent ul .case4{height:128px;width:154px;float: left; text-align: center;margin: 35px 14px 0;}
        .caseBox .caseContent ul .case3{width:190px;float: left; text-align: center;margin:25px 14px 0;;}
        .caseBox .caseContent ul .arrowR{float: right;}
        .caseBox .caseContent ul li span a {color: red;}
        .caseBox .caseContent ul li p{text-align: center;font-size: 14px;color: #666;margin: 8px auto;}
        .caseBox .caseContent ul li span{text-align: center;font-size: 12px;color: #666;}
        .viewCase{width: 1200px;overflow: hidden;}
        .viewCase ul{overflow: hidden;}
        .viewCase .viewBox{float: left;width: 280px;height: 378px; border: 1px solid #eee;border-radius: 10px;padding: 24px;margin: 0 9px;background: #fff;position: relative;}
        .viewCase .viewBox .titeBox{border-bottom: 1px solid #eee;    padding-bottom: 8px;}
        .viewCase .viewBox div p{font-size: 14px;color: #333;}
        .viewCase .viewBox div h3{font-size: 18px;font-weight: bold;color: #333;line-height: 28px;}
        .viewCase .viewBox ul{padding: 10px 0;font-size: 14px;color: #666;}
        .viewCase .viewBox ul li{line-height: 22px;}
        .viewCase .viewBox .gpa{margin-bottom: 7px;}

        .viewCase .viewBox .viewTit{display: inline-block;width: 34%;vertical-align: top;}
        .viewCase .viewBox .viewTitCont{display: inline-block;width: 65%;}
        .viewCase .btnBox{overflow: hidden;    position: absolute;
            bottom: 22px;
            width: 84%;}
        .viewCase .btnBox span{width: 100px;height: 32px; border-radius: 60px;line-height: 32px;display: inline-block;border: 1px solid #fb5454;text-align: center;cursor:pointer;}
        .viewCase .viwExam{background: #fb5454;color: #fff;}
        .viewCase .onlineQue{background: #fff;color:#fb5454; }
        .clickMore{display: block; margin: 25px auto; width: 100px;color: #333;font-size: 14px;}
        .clickMore span{cursor: pointer;}
        /*caseBox结束*/
        /*advantage开始*/
        .advantage{width: 1200px;margin: 30px auto;background: #fff;}
        .advantage .advantageBox{height: 394px;border: 1px solid #eee;}
        .advantageCont ul{overflow: hidden; padding: 40px 0;border-bottom: 1px solid #eee;margin: 0 24px;}
        .advantageCont li{float: left; text-align: center;width: 20%;}
        .advantageCont li h6{color: #333;font-size: 16px;line-height: 33px;}
        .advantageCont li p{color: #666;font-size: 14px;}
        .advantageCont li p span{color: #fb5454;}
        .advantageMedia li{float: left; text-align: center;margin: 10px 20px;}
        .advantageMedia{overflow: hidden}
        .advantageMedia ul{padding: 0 23px;overflow: hidden;}
        .advantageMedia h3{font-size: 18px;color: #fb5454;text-align: center;margin: 23px 18px;}
        .advantageMedia img{height: 32px;width: 115px;}
        /*advantage结束*/

        .right.carousel-control, .left.carousel-control {
            display: none;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div ng-controller="mainController">
    <div class="banner">
        <div id="js_banner" class="fx_banner" uib-carousel interval="myInterval" no-wrap="noWrapSlides" active="active">
            <ul id="js_banner_img" class="fx_banner_img clear" uib-slide ng-repeat="slide in slides track by slide.id" index="$index">
                <li>
                    <div class="fx_banner_inner fx_grid_c1">
                        <div class="child child0" data-z="1"><img ng-src="{{slide.image}}"></div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="estimateContainer">
            <div class="estimate">
                <div id="asseSele">
                    <span class="active" id="studyAsse">留学评估</span><span id="colonAsse">移民评估</span>
                </div>


                <ul class="asseContent">
                    <li class="focusCur intentionA">
                        <input type="text" placeholder="意向留学国家">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>美国</li>
                            <li>英国</li>
                            <li>澳大利亚</li>
                            <li>新西兰</li>
                            <li>加拿大</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionB">
                        <input type="text" placeholder="计划出国时间">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>2017年</li>
                            <li>2018年</li>
                            <li>三年以后</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionC">
                        <input type="text" placeholder="申请阶段">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>高中</li>
                            <li>本科</li>
                            <li>硕士</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionD">
                        <input type="text" placeholder="平均分或预估">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>80分以上</li>
                            <li>70-80分</li>
                            <li>70分以下</li>
                        </ul>
                    </li>
                    <li class="fastEst intentionE">快速评估</li>
                </ul>
                <ul class="asseContent" style="display: none">
                    <li class="focusCur intentionA">
                        <input type="text" placeholder="意向移民国家">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>美国</li>
                            <li>英国</li>
                            <li>澳大利亚</li>
                            <li>新西兰</li>
                            <li>加拿大</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionB">
                        <input type="text" placeholder="计划出国时间">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>2017年</li>
                            <li>2018年</li>
                            <li>三年以后</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionC">
                        <input type="text" placeholder="申请阶段">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>高中</li>
                            <li>本科</li>
                            <li>硕士</li>
                        </ul>
                    </li>
                    <li class="focusCur intentionD">
                        <input type="text" placeholder="平均分或预估">
                        <span>|</span>
                        <img class="selectedInput" src="<%=resourcePath%>/img/home/select.png" alt="">
                        <ul class="son_ul" style="display: none">
                            <li>80分以上</li>
                            <li>70-80分</li>
                            <li>70分以下</li>
                        </ul>
                    </li>
                    <li class="fastEst intentionE">快速评估</li>
                </ul>

                <div style="bottom: 5px;position: absolute;width: 300px;">
                    <p>已有<span>1342</span>人参与免费在线评估</p>
                </div>
            </div>
        </div>
    </div>
    <div class="productsContent">
        <div class="productsInfo">
            <div class="abroad fl">
                <h3>热门留学产品</h3>
                <p>Recommend abroad</p>
            </div>
            <div class="moreAbroad fr">查看更多</div>
        </div>

        <div class="productsList">
            <div class="productImag fl">
                <img src="<%=resourcePath%>/img/home/ad_left.jpg" alt="热门留学产品">
            </div>

            <ul>

                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写内容简介，签证通过率95%以上，专家跟踪办理。</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li class="productCurr">
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
                <li>
                    <div></div>
                    <p>英国高中留学申请</p>
                    <span>这里填写产品的内容简介，签证通过率95%以上，专家跟踪办理</span>
                    <div class="productFly">
                        <div class="flyAbroad fl">飞出国</div>
                        <div class="likeNum fr">284</div>
                    </div>
                </li>
            </ul>
        </div>

    </div>
    <div class="consultant">
        <div class="teacher">
            <h3>明星顾问</h3>
            <p>Teacher Consultant</p>
        </div>
        <div class="repuTeacher">
            <ul>
                <li class="famousTeacher" ng-repeat="adviser in advisers"
                    adviser-loaded>
                    <div class="teacherImag"><img ng-src="<%=picPath%>/{{adviser.photo.path}}" alt=""></div>
                    <p>{{adviser.screenname}}</p>
                    <span>美国顾问专家</span>
                    <div class="teacherInfo">
                        <p>/海外留学生活背景，精通澳洲留学程序/</p>
                        <div>鹏润留学</div>
                    </div>
                </li>
            </ul>
            <div class="arrow_img">
                <img id="leftArrow" ng-click="adviserPre($event.target)" class="fl" src="<%=resourcePath%>/img/home/arrow_left.png" alt="">
                <img id="rightArrow" ng-click="adviserNext($event.target)" class="fr" src="<%=resourcePath%>/img/home/arrow_right.png" alt="">
            </div>
        </div>
    </div>
    <div class="queAns">
        <div class="communityBox">
            <div class="community fl">
                <h3>问答社区</h3>
                <p>Q&A community</p>
            </div>
            <ul>
                <li class="shuxian">|</li>
                <li><img src="<%=resourcePath%>/img/home/placard.png" alt=""></li>
                <li>Jerry正则咨询<span>陈老师</span> </li>
                <li>小鱼米正在咨询<span>LillianLIU</span>老师</li>
                <li>Jerry正则咨询<span>陈老师</span></li>
                <li>Jerry正则咨询<span>陈老师</span></li>
                <li class="shuxian">|</li>
                <li>当前在线人数：2256</li>
            </ul>
            <div class="moreAbroad fr">更多</div>
        </div>
        <div class="queAnsExam">
            <div class="examples">
                <ul>
                    <li><p>Jerry：去英国留学有什么要求？准备去读研，商业专科。</p><span>2016-3-17</span></li>
                    <li><p>Cinderella：你好，我想去日本留学，大专，学翻译或者商务，大概咨询费用需要多少？</p><span>2016-3-21</span></li>
                    <li><p>小鱼米：你好，我今天37岁，想移民去澳洲，目前在医院检验科上班，专业是临床检验诊断学，硕士研究生，不知道可不可以</p><span>2016-3-17</span></li>
                    <li class="quePre"><P>李一毛虫：去英国留学有什么要求？准备去读研，商业专科。</P><span>2016-3-17</span></li>
                </ul>
            </div>
            <div class="goQues">
                <div id="freeQue">免费提问</div>
                <p>明显顾问为您专业解答</p>
            </div>
        </div>
    </div>
    <div class="studyAbroad">
        <div class="teacher">
            <h3>今日留学</h3>
            <p>Study information</p>
        </div>
        <div class="studyTab">
            <div class="tabBox fl">

                <div class="tabbedPanels">

                    <ul class="tabGroup">
                        <span class="moreStudy fr">更多</span>
                        <li class="tab">留学咨询</li>
                        <li class="tab selectedTab">留学干货</li>
                        <li class="tab">澳大利亚</li>
                        <li class="tab promoted">新西兰</li>
                    </ul>
                    <div class="contentGroup">
                        <div class="content">内容一</div>
                        <div class="content selectedContent">
                            <ul class="examples examplesCoten">
                                <li><p>Jerry：去英国留学有什么要求？准备去读研，商业专科。</p><span>2016-3-17</span></li>
                                <li><p>Cinderella：你好，我想去日本留学，大专，学翻译或者商务，大概咨询费用需要多少？</p><span>2016-3-21</span></li>
                                <li><p>小鱼米：你好，我今天37岁，想移民去澳洲，目前在医院检验科上班，专业是临床检验诊断学，硕士研究生，不知道可不可以</p><span>2016-3-17</span></li>
                                <li><p>Jerry：去英国留学有什么要求？准备去读研，商业专科。</p><span>2016-3-17</span></li>
                                <li><p>Cinderella：你好，我想去日本留学，大专，学翻译或者商务，大概咨询费用需要多少？</p><span>2016-3-21</span></li>
                                <li><p>小鱼米：你好，我今天37岁，想移民去澳洲，目前在医院检验科上班，专业是临床检验诊断学，硕士研究生，不知道可不可以</p><span>2016-3-17</span></li>
                            </ul>
                        </div>
                        <div class="content">内容三</div>
                        <div class="content">内容四</div>
                    </div>

                </div>
            </div>
            <div class="vidoBox fr">
                <h3>相关视频 <a href="javascript:void(0)">更多</a></h3>
                <div>
                    <div class="vidoContent"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="caseBox">
        <div class="community">
            <h3>成功案例</h3>
            <p>Successful case</p>
        </div>
        <div class="caseContent">
            <ul>
                <%--  <li class="arrow fl">
                      <img src="<%=resourcePath%>/img/arrow_left_red.png" alt="">
                  </li>--%>
                <li class="case0">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>王同学</p>
                        <span>成功获取<a href="javascript:void(0)">悉尼大学</a>Offer</span>
                    </div>
                </li>
                <li class="case1">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>李同学</p>
                        <span>成功获取<a href="javascript:void(0)">新南威尔士大学</a>Offer</span>
                    </div>
                </li>
                <li class="case2">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>刘同学</p>
                        <span>成功获取<a href="javascript:void(0)">博文中学</a>Offer</span>
                    </div>
                </li>
                <li class="case3">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>加雪佩</p>
                        <span>成功获取<a href="javascript:void(0)">莫纳什大学</a>Offer</span>
                    </div>
                </li>
                <li class="case4">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>加雪佩</p>
                        <span>成功获取<a href="javascript:void(0)">莫纳什大学</a>Offer</span>
                    </div>
                </li>
                <li class="case5">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>加雪佩</p>
                        <span>成功获取<a href="javascript:void(0)">莫纳什大学</a>Offer</span>
                    </div>
                </li>
                <li class="case6">
                    <img src="<%=resourcePath%>/img/home/avatar5.png" alt="">
                    <div>
                        <p>加雪佩</p>
                        <span>成功获取<a href="javascript:void(0)">莫纳什大学</a>Offer</span>
                    </div>
                </li>
                <%--   <li class="arrow arrowR">
                       <img src="<%=resourcePath%>/img/arrow_right_red.png" alt="">
                   </li>--%>
            </ul>
            <div class="arrow_img">
                <img id="left__red_img" class="fl" src="<%=resourcePath%>/img/home/arrow_left_red.png" alt="">
                <img id="right__red_img" class="fr" src="<%=resourcePath%>/img/home/arrow_right_red.png" alt="">
            </div>
        </div>
        <div class="viewCase">
            <ul>
                <li class="viewBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul>
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span  class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span  class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span  class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span  class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span  class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span  class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span  class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnBox">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="viewBox">
                    <div class="titeBox">
                        <p>李同学</p>
                        <h3>新南威尔士大学</h3>
                    </div>
                    <ul>
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">中国政法大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span  class="viewTitCont">法学专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span  class="viewTitCont">本科</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span  class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span  class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span  class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span  class="viewTitCont">The University of New South Wales</span></li>
                        <li><span class="viewTit">申请专业：</span><span  class="viewTitCont">Juris Doctor</span></li>
                    </ul>
                    <div class="btnBox">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="viewBox">
                    <div class="titeBox">
                        <p>刘同学</p>
                        <h3>博文中学</h3>
                    </div>
                    <ul>
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">北京师范大学附属中学</span></li>
                        <li><span class="viewTit">当前专业：</span><span  class="viewTitCont">高一</span></li>
                        <li><span class="viewTit">当前学历：</span><span  class="viewTitCont">高中</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span  class="viewTitCont">80</span></li>
                        <li><span class="viewTit">申请国家</span><span  class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span  class="viewTitCont">高中</span></li>
                        <li><span class="viewTit">申请学校：</span><span  class="viewTitCont">Balwyn High School</span></li>
                        <li><span class="viewTit">申请专业：</span><span  class="viewTitCont">无</span></li>
                    </ul>
                    <div class="btnBox">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="viewBox">
                    <div class="titeBox">
                        <p>孙同学</p>
                        <h3>奥克兰大学</h3>
                    </div>
                    <ul>
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">天津商业大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span  class="viewTitCont">机械工程</span></li>
                        <li><span class="viewTit">当前学历：</span><span  class="viewTitCont">本科大一</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span  class="viewTitCont">3.4</span></li>
                        <li><span class="viewTit">申请国家</span><span  class="viewTitCont">新西兰</span></li>
                        <li><span class="viewTit">申请学历：</span><span  class="viewTitCont">本科</span></li>
                        <li><span class="viewTit">申请学校：</span><span  class="viewTitCont">The University of Auckland</span></li>
                        <li><span class="viewTit">申请专业：</span><span  class="viewTitCont">商科</span></li>
                    </ul>
                    <div class="btnBox">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
            </ul>
            <p class="clickMore"><span>点击查看更多</span></p>
        </div>
    </div>
    <div class="advantage">
        <div class="teacher">
            <h3>今日留学</h3>
            <p>Study information</p>
        </div>
        <div class="advantageBox">
            <div class="advantageCont">
                <ul>
                    <li>
                        <img src="<%=resourcePath%>/img/home/adviser.png" alt="">
                        <h6>平台顾问</h6>
                        <p>平台顾问平均行业经验<span>5年+</span></p>

                    </li>
                    <li>
                        <img src="<%=resourcePath%>/img/home/academy.png" alt="">
                        <h6>合作院校</h6>
                        <p>海外<span>2000</span>多所合规院校合作</p>
                    </li>
                    <li>
                        <img src="<%=resourcePath%>/img/home/services.png" alt="">
                        <h6>专业服务</h6>
                        <p>每年近<span>千名</span>留学生拿到漫游结果</p>
                    </li>
                    <li>
                        <img src="<%=resourcePath%>/img/home/guarantee.png" alt="">
                        <h6>保障机构</h6>
                        <p>平台<span>2000万</span>基金保障</p>
                    </li>
                    <li>
                        <img src="<%=resourcePath%>/img/home/cooperation.png" alt="">
                        <h6>合作机构</h6>
                        <p><span>200多</span>家知名机构合作</p>
                    </li>
                </ul>
            </div>
            <div class="advantageMedia">
                <h3>媒体报道</h3>
                <ul>
                    <li><a href="http://mt.sohu.com/20160507/n448161814.shtml" target="_blank">
                        <img src="<%=resourcePath%>/img/home/Sohu.png" alt=""></a></li>
                    <li><a href="http://yueyu.cntv.cn/2015/10/10/ARTI1444465144332545.shtml" target="_blank">
                        <img src="<%=resourcePath%>/img/home/cntv.png" alt=""></a></li>
                    <li><a href="http://36kr.com/p/5044173.html" target="_blank">
                        <img src="http://sta.36krcnd.com/common-module/common-header/images/logo.png" alt=""></a></li>
                    <li><a href="http://www.jiemodui.com/N/44388.html" target="_blank">
                        <img src="http://www.jiemodui.com/Static/HomeV2/images/jmd_logo.svg" alt=""></a></li>
                    <li><a href="http://www.51vv.com/zhuanti/youthModel03.shtml" target="_blank">
                        <img src="http://www.51vv.com/images_1405/logo.png" alt=""></a></li>
                    <li><a href="http://www.donews.com/m/2927947" target="_blank">
                        <img src="http://ui.donews.com/donews2013/img/donews_logo.gif" alt=""></a></li>
                    <li><a href="http://qianbidao.baijia.baidu.com/article/441594" target="_blank">
                        <img src="http://baijia.baidu.com/static/home/widget/header/images/logo_7745737.jpg" alt=""></a></li>
                    <li><a href="http://finance.jrj.com.cn/tech/2016/03/06184520650106.shtml" target="_blank">
                        <img src="http://i0.jrjimg.cn/textv2015/titlogo01.png" alt=""></a></li>
                    <li><a href="http://news.cnfol.com/it/20160306/22359490.shtml" target="_blank">
                        <img src="http://i8.cnfolimg.com/file/201402/Logo_201402071215264931.jpg" alt=""></a></li>
                    <%--<li><a href="http://info.it.hc360.com/2015/10/101433830042.shtml" target="_blank">--%>
                        <%--<img src="http://style.org.hc360.com/css_hy/images/2011nlogo/it_172X45_zg.gif" alt=""></a></li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var app = angular.module("app", ['ngAnimate', 'ui.bootstrap']);

    app.controller("mainController", function ($scope, $http) {
        $scope.myInterval = 3000;
        $scope.noWrapSlides = false;
        var adviserShowList = $scope.adviserShowList = [];
        var slides = $scope.slides = [];
        $scope.active = 0;

        $scope.initial = function () {
            var timestamp = (new Date()).valueOf();

            var url = "<%=path%>/home/getHomeData.htm?timestamp=" + timestamp;

            $http({
                method: 'GET',
                url: url
            }).then(function success(response) {
                var result = response.data;
                $scope.advisers = result.data.advisers;
                $.each($scope.advisers, function (index) {
                    if (index < 5) {
                        adviserShowList.push(index);
                    }
                });

                $scope.$broadcast('initialed');
                $('#queryCoverModal').modal('hide');
            }, function error() {
                $('#queryCoverModal').modal('hide');
                $scope.errorMsg = '发生未知错误，请与系统管理员联系！';
            });
        };

        $scope.addSlide = function () {
            slides.push({
                id: 1,
                image: '<%=resourcePath%>/img/home/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 2,
                image: '<%=resourcePath%>/img/home/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 3,
                image: '<%=resourcePath%>/img/home/banner.jpg',
                text: '测试图片'
            });
            slides.push({
                id: 4,
                image: '<%=resourcePath%>/img/home/banner.jpg',
                text: '测试图片'
            });
        };

        $scope.adviserPre = function (dom) {
            if (adviserShowList[adviserShowList.length - 1] == ($scope.advisers.length - 1)) {
                adviserShowList.push(0);
            } else {
                adviserShowList.push(adviserShowList[adviserShowList.length - 1] + 1);
            }
            $(dom).parent().prev("ul").prepend($(dom).parent().prev("ul").find('li:last'));
            adviserShowList.shift();
            $scope.renderAdviser();
        };

        $scope.adviserNext = function (dom) {
            if ((adviserShowList[0] - 1) < 0) {
                adviserShowList.unshift($scope.advisers.length - 1);
            } else {
                adviserShowList.unshift(adviserShowList[0] - 1);
            }
            adviserShowList.pop();
            $(dom).parent().prev("ul").append($(dom).parent().prev("ul").find('li:eq(0)'));
            $scope.renderAdviser();
        };

        $scope.renderAdviser = function () {
            $(".famousTeacher").css("display", "none");
            $(".famousTeacher").each(function (index, item) {
                if (index in adviserShowList) {
                    $(item).css("display", "block");
                }
                if (index == 2) {
                    $(item).addClass("teacherCur").siblings().removeClass('teacherCur');
                }
            });
        };

        $scope.render = function () {
        };

        $scope.initial();
        $scope.addSlide();

        $scope.$on('adviserRepeat',function(){
            $scope.render();
        })
    });

    app.directive('adviserLoaded',function(){
        return {
            restrict: 'A',
            link: function (scope) {
                if (scope.$last === true) {
                    $('.famousTeacher').hover(function () {
                        $(this).addClass("teacherCur").siblings().removeClass('teacherCur');
                    });
                }
                scope.renderAdviser();
            }
        };
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        //左箭头
        $('#leftArrow').click(function () {
            $(this).parent().prev("ul").append($(this).parent().prev("ul").find('li:eq(0)'));
        });
        //右箭头
        $('#rightArrow').click(function () {
            $(this).parent().prev("ul").prepend($(this).parent().prev("ul").find('li:last'));
        });
        //    right__red_img
        var imgArr=[{url:"<%=resourcePath%>/img/home/avatar5.png",user:"林同学",effort:"普林斯顿大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"王同学",effort:"哈佛大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"张同学",effort:"耶鲁大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"刘同学",effort:"斯坦福大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"赵同学",effort:"芝加哥大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"薛同学",effort:"哥伦比亚大学"},{url:"<%=resourcePath%>/img/home/avatar5.png",user:"古同学",effort:"宾夕法尼亚大学"}];


        reload();

        $('#left__red_img').click(function () {
            var imgArrs=[];
            imgArrs=imgArr.shift();
            imgArr.push(imgArrs);
            reload();

        });
        $('#right__red_img').click(function () {
            var imgArrs=[];
            imgArrs=imgArr.pop();
            imgArr.unshift(imgArrs);
            reload();

        });

        //选项卡
        $(".tabGroup li").click(function(){
            $(this).addClass("selectedTab").siblings().removeClass('selectedTab');
            $(".contentGroup div").eq($(".tabGroup li").index(this)).addClass("selectedContent").siblings().removeClass('selectedContent');
        });
        $("#asseSele span").click(function(){
            $(this).addClass("active").siblings().removeClass('active');
            $(".asseContent").eq($("#asseSele span").index(this)).show().siblings().hide();
            $('#asseSele').show();
        });

        $('.son_ul').hide(); //初始ul隐藏
        $('.selectedInput').hover(function () {//鼠标移动函数
                    $(this).parent()[0].style.borderRadius = "15px";
                    $(this).parent().find('ul.son_ul').slideDown();  //找到ul.son_ul显示
                    $(this).parent().find('li').hover(function () {
                        $(this).addClass('hover')
                    }, function () {
                        $(this).removeClass('hover')
                    }); //li的hover效果
                    $(this).parent().hover(function () {
                            },
                            function () {
                                $(this).parent().find("ul.son_ul").slideUp();
                            }
                    );
                }, function () {
                    $(this).parents('li')[0].style.borderRadius = "15px";
                }
        );
        $('ul.son_ul li').click(function () {
            $(this).parents('li').find('input').val($(this).html());
            $(this).parents('li').find('ul').slideUp(1);
            $(this).parents('li')[0].style.borderRadius="20px";
        });
        /* $('.son_ul').hover(function () {
         $(this).parents('li')[0].style.borderRadius="20px";
         })*/

        $('.famousTeacher').hover(function () {
            $(this).addClass("teacherCur").siblings().removeClass('teacherCur');
        });
        $('.productsList ul li').hover(function () {
            $(this).addClass("productCurr").siblings().removeClass('productCurr');

        });
        //回显
        function reload() {
            var html='';
            html+='<li style="height: 78px;width: 104px;float: left;text-align: center;margin: 60px 14px 0;">\
                    <img src='+imgArr[0].url+' alt="">\
                    </li>\
                    <li style="height:108px;width:134px;float: left; text-align: center;margin: 45px 14px 0;">\
                      <img src='+imgArr[1].url+' alt="">\
                    </li>\
                    <li style="height: 128px;width: 154px;float: left;text-align: center;margin: 35px 14px 0;">\
                    <img src='+imgArr[2].url+' alt="">\
                    <div>\
                    <p style="text-align: center;font-size: 14px;color: #666;margin: 8px auto;">'+imgArr[2].user+'</p>\
                      <span style="text-align: center;font-size: 12px;color: #666;">成功获取<a href="javascript:void(0)" style="color: red;">'+imgArr[2].effort+'</a>Offer</span>\
                    </div>\
                    </li>\
                    <li style="width:190px;float: left; text-align: center;margin:25px 14px 0;">\
                     <img src='+imgArr[3].url+' alt="">\
                    <div>\
                       <p style="text-align: center;font-size: 14px;color: #666;margin: 8px auto;">'+imgArr[3].user+'</p>\
                      <span style="text-align: center;font-size: 12px;color: #666;">成功获取<a href="javascript:void(0)" style="color: red;">'+imgArr[3].effort+'</a>Offer</span>\
                    </div>\
                    </li>\
                    <li style="height: 128px;width: 154px;float: left;text-align: center;margin: 35px 14px 0;">\
                    <img src='+imgArr[4].url+' alt="">\
                    <div>\
                      <p style="text-align: center;font-size: 14px;color: #666;margin: 8px auto;">'+imgArr[4].user+'</p>\
                    <span style="text-align: center;font-size: 12px;color: #666;">成功获取<a href="javascript:void(0)"  style="color: red;">'+imgArr[4].effort+'</a>Offer</span>\
                    </div>\
                    </li>\
                    <li style="height:108px;width:134px;float: left; text-align: center;margin: 45px 14px 0;">\
                   <img src='+imgArr[5].url+' alt="">\
                    </li>\
                    <li style="height: 78px;width: 104px;float: left;text-align: center;margin: 60px 14px 0;">\
                    <img src='+imgArr[6].url+' alt="">\
                    </li>';

            $('.caseContent>ul').html(html);
        }
    });
</script>
<%@include file="footer.jsp" %>
</body>
</html>
