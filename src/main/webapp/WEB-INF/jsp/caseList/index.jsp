<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/12/1
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <%@include file="../commonResource.jsp" %>
    <style>
        .success_case{width: 1200px;overflow: hidden;margin:5px auto 0;}
        .success_case .location{padding-bottom: 5px;}
        .success_case .location img{margin-right: 6px;}
        .success_case .location span{color: #999;}
        .success_case .case_list{width: 75%;}
        .success_case .hot_case{width: 23%;}
        .success_case .case_list >ul{padding: 12px;}
        .success_case .case_list >ul >li{display: inline-block;margin-right: 30px;position: relative}
        .success_case .case_list li input{    border: none;border: 1px solid #ccc;margin-left: 5px;width: 200px; outline: none; text-indent: 11px; line-height: 30px;background: #fff;}
        .success_case .case_list li .inte_choice{width: 150px;background:#fff url("<%=resourcePath%>/img/home/select.png")no-repeat 96% center}
        .success_case .case_list button{line-height: 30px; padding: 0 29px; background: #0099ec; border: none; outline: none; color: #fff; float: right; border-radius: 2px;}
        .success_case .case_list .son_ul{position: absolute; width: 150px; z-index: 20; cursor: pointer;padding:0 0 12px 0;background: #fff;left: 56px;}
        .success_case .case_list .son_ul li{text-align: center;margin: 8px auto;color: #999;padding: 0 16px;}
        .success_case .case_list .son_ul .hover{color: #000;}
        .success_case .case_list .school_filter{background: #ccc;margin: 16px auto;font-size: 14px;}
        .success_case .case_list .school_filter li{display: inline-block; width: 85px;  text-align: center;height: 36px;line-height: 36px;}
        .success_case .case_list .school_filter .cuurent{color: #0099ec;cursor: pointer;}
        .success_case .case_list .school_case{}
        .success_case .case_list .school_case >ul{overflow: hidden;}
        .success_case .case_list .school_case >ul >li{float: left;width: 31%;height: 350px;border: 1px solid #eee;border-radius: 10px;padding: 24px;margin: 12px 9px;background: #fff;position: relative;}
        .success_case .case_list .school_case .titeBox {border-bottom: 1px solid #eee;padding-bottom: 8px;}
        .success_case .case_list .school_case .titeBox p {font-size: 14px;color: #333;}
        .success_case .case_list .school_case .titeBox h3 {font-size: 18px;font-weight: bold;color: #333;line-height: 28px;}

        .school_case .content_list{padding: 10px 0;font-size: 14px;color: #666;}
        .school_case .content_list .viewTit{display: inline-block;width: 34%;vertical-align: top;}
        .school_case .content_list .viewTitCont{display: inline-block; width: 65%;}
        .school_case .content_list li{line-height: 22px;}
        .school_case .content_list  .gpa {margin-bottom: 7px;}

        .caseBox .btnContent {overflow: hidden; position: absolute; bottom: 10px; width: 84%; }
        .caseBox .btnContent span { width: 100px; height: 32px; border-radius: 60px; line-height: 32px; display: inline-block; border: 1px solid #fb5454; text-align: center;  cursor: pointer; }
        .caseBox .btnContent .viwExam {background: #fb5454; color: #fff;}
        .school_case .fenye{text-align: center; margin: 20px auto;color: #999;}
        .school_case .fenye span{ border: 1px solid; margin: 0 5px; width: 25px; height: 25px; display: inline-block; text-align: center; line-height: 25px;}
        .school_case .fenye .cur{color: #fff;background: #0099ec;}
        .hot_case li{border: 1px solid #eee;margin-bottom: 26px;}
        .hot_case h3{text-align: center;    margin: 10px 0;    font-size: 14px;}
        .hot_case p{text-align: center;color: #ccc;    margin: 10px 0;    font-size: 12px;}
        .hot_case img{width: 100%;}
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="success_case">
    <p class="location">
        <img src="<%=resourcePath%>/img/abroad/location.png" alt="所在位置">所在位置：首页><span>成功案例列表</span>
    </p>
    <div class="case_list fl">
        <ul>
            <li>意向国家 <input class="inte_choice" type="text" placeholder="请选择">
                <ul class="son_ul" style="display: none">
                    <li>选项一</li>
                    <li>选项二</li>
                    <li>选项三</li>
                    <li>选项四</li>
                    <li>选项五</li>
                </ul></li>
            <li>目标学历<input class="inte_choice" type="text" placeholder="请选择">
                <ul class="son_ul" style="display: none">
                    <li>选项一</li>
                    <li>选项二</li>
                    <li>选项三</li>
                    <li>选项四</li>
                    <li>选项五</li>
                </ul></li>
            <li>学校名称<input class="" type="text" placeholder=""></li>
            <button>搜索</button>
        </ul>
        <div class="school_filter">
            <ul>
                <li class="cuurent">QS排名 ↓</li>
                <li>人气 ↓</li>
                <li>最新 ↓</li>
            </ul>
        </div>
        <div class="school_case">
            <ul>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
                <li class="caseBox">
                    <div class="titeBox">
                        <p>王同学</p>
                        <h3>悉尼大学</h3>
                    </div>
                    <ul class="content_list">
                        <li><span class="viewTit">毕业院校：</span><span class="viewTitCont">深圳大学</span></li>
                        <li><span class="viewTit">当前专业：</span><span class="viewTitCont">计算机专业</span></li>
                        <li><span class="viewTit">当前学历：</span><span class="viewTitCont">本科（专接本）</span></li>
                        <li class="gpa"><span class="viewTit">GPA：</span><span class="viewTitCont">3.0</span></li>
                        <li><span class="viewTit">申请国家</span><span class="viewTitCont">澳大利亚</span></li>
                        <li><span class="viewTit">申请学历：</span><span class="viewTitCont">研究生</span></li>
                        <li><span class="viewTit">申请学校：</span><span class="viewTitCont">The University of Sydney</span></li>
                        <li><span class="viewTit">申请专业：</span><span class="viewTitCont">计算机技术专业</span></li>
                    </ul>
                    <div class="btnContent">
                        <span class="viwExam fl">查看案例</span>
                        <span class="onlineQue fr">在线咨询</span>
                    </div>
                </li>
            </ul>
            <p class="fenye">26条记录 1/2 <span class="cur">1</span><span>2</span> 下一条</p>
        </div>
    </div>
    <div class="hot_case fr">
        <ul>
            <li>
                <div><img src="<%=resourcePath%>/img/school//MIT.png" alt=""></div>
                <h3>麻省理工学院</h3>
                <p>Massachusetts Institute of Technology</p>
            </li>
            <li>
                <div><img src="<%=resourcePath%>/img/school//MIT.png" alt=""></div>
                <h3>麻省理工学院</h3>
                <p>Massachusetts Institute of Technology</p>
            </li>
        </ul>
    </div>
</div>
<script>
    $('.son_ul').hide(); //初始ul隐藏
    $('.inte_choice').click(function () { //鼠标移动函数

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
            }
    );
    $('ul.son_ul li').click(function () {
        $(this).parents('li').find('input').val($(this).html());
        $(this).parents('li').find('ul').slideUp();
    });
</script>
<%@include file="../footer.jsp" %>
</body>
</html>
