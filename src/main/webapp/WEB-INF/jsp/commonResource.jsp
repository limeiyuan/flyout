<%@ page import="com.flyout.common.ApplicationProperties" %>
<%@ page import="com.flyout.common.auth.AuthHelper" %>
<%@ page import="com.flyout.common.dto.RongyunDto" %>
<%@ page import="com.flyout.controller.RongyunController" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>飞出国</title>

<%
    String path = request.getContextPath();
    String resourcePath = request.getContextPath();
    String rongyunToken = AuthHelper.getRongyunDto().getToken();
    String rongyunName = AuthHelper.getRongyunDto().getName();

    ApplicationProperties properties = (ApplicationProperties) WebApplicationContextUtils.getWebApplicationContext(application).getBean(ApplicationProperties.class);
    String picPath = properties.getMap().get("SERVER_PIC_PATH").toString();
%>

<link href="<%=resourcePath%>/css/bootstrap.css" rel="stylesheet" type="text/css">
<link type="text/css" href="<%=resourcePath%>/rongyun/css/RongIMWidget.css" rel="stylesheet"/>

<script src="<%=resourcePath%>/js/jquery-3.1.1.min.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular.1.6.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular-animate.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular-resource.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/ui-bootstrap-tpls-2.2.0.min.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/js/bootstrap/bootstrap.js" type="text/javascript" charset="UTF-8"
        language="javascript"></script>
<script src="<%=resourcePath%>/rongyun/RongIMWidget.js" type="text/javascript"></script>