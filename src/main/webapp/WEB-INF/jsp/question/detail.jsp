<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2017/1/6
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../commonResource.jsp" %>
    <style>
        .main_container {
            width: 1200px;
            overflow: hidden;
            margin: 10px auto 0;
        }

        .main_container h3 {
            font-size: 16px;
            font-weight: bold;
            color: #0099ec;
            margin: 8px 0;
        }
    </style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="main_container">
    <h3 style="text-align: center">${question.content}</h3>
    <br/>
    <p style="text-align: right"><fmt:formatDate pattern="yyyy-MM-dd" value="${question.createTime}"/></p>
    <br/>
    <c:forEach items="${question.answerList}" var="answer">
        <div style="border: 1px">
            <div>
                <p>${answer.adviser.screenname}</p>
                <div><img src="<%=picPath%>${answer.adviser.photo.path}" style="width: 50px;height: auto"></div>
                <fmt:formatDate pattern="yyyy-MM-dd" value="${answer.createTime}"/>
            </div>
            <div>
                <p><c:out value="${answer.content}"/></p>
            </div>
        </div>
    </c:forEach>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>

