<%--
  Created by IntelliJ IDEA.
  User: LiMeiyuan
  Date: 2016/12/21
  Time: 23:03
  Description: 
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
    <h3 style="text-align: center">${blog.title}</h3>
    <br/>
    <p style="text-align: right"><fmt:formatDate pattern="yyyy-MM-dd" value="${blog.createTime}" /></p>
    <br/>
    ${blog.content}
</div>
<%@include file="../footer.jsp" %>
</body>
</html>
