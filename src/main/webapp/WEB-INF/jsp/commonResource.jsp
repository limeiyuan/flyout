<%@ page import="com.flyout.common.ApplicationProperties" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.flyout.domain.Account" %>
<%@ page import="com.flyout.common.auth.AuthHelper" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="description" content="鹏润飞出国留学平台，定位于一个优质的留学信息平台，致力于整合留学产业，通过甄选优质的服务提供商入驻，为学生提供一站式服务，15年出国留学、海外移民服务经验保证。全国咨询电话：400-6688-066">
<meta name="Author" content="fcgliuxue.com 飞出国留学">
<meta name="keywords" content="飞出国 留学优选 移民评估 海外院校 留学顾问 留学资讯 澳大利亚留学 新西兰大学 英国中介">
<meta name="Copyright" content="鹏润教育集团 飞出国留学 版权所有">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>飞出国留学_全球留学信息发布平台_真正权威的留学平台</title>

<%
    String path = request.getContextPath();

    ApplicationProperties properties = WebApplicationContextUtils.getWebApplicationContext(application).getBean(ApplicationProperties.class);
    String resourcePath = properties.getMap().get("STATIC_RESOURCE").toString();
    String picPath = properties.getMap().get("SERVER_PIC_PATH").toString();
    request.setAttribute("picPath", picPath);

    Account user = AuthHelper.getLoginUser();
    if (user == null) {
        user = new Account();
    }
%>
<link href="<%=path%>/favicon.ico" rel="icon" type="image/x-icon"/>
<link href="data:image/ico;base64,AAABAAEAICAAAAEAIACoEAAAFgAAACgAAAAgAAAAQAAAAAEAIAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOyYAATsmAAY7JgAPuyYAHrsmAC37JgA3eyYAPXsmAD77JgA9eyYAOPrlwC/7JgAh+yYADbsmAAc65gABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADsmAAW7JgAXuyXAK/smADt7JgA/+yYAOvsmADH7JgAq+yYAJHsmAB865gAeuyXAInsmACV7JgAp+uYAJnsmABc7JgAHgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA65gANOyYAKPrmADt7JgA/+yYAO/smACt7JgAUuyYAC7rmAAS7JgAAgAAAAAAAAAAAAAAAOyYAATsmAAi65gASOyYAHbsmACB7JgAMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgABOuYAErsmADL7JgA++yYAP/smADX65gAWOyYABjrmAAAAAAAAAAAAADsmAAe65gAMAAAAAAAAAAAAAAAAAAAAADrmAAA7JgADuyYACTsmAB07JgAPuyYAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOuYAALsmABi7JgA7+yYAP/smAD165gAl+uYABoAAAAAAAAAAAAAAAAAAAAA7JgABOyYAMfsmACFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOyYAArsmAA87JgAMOyYAAYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgARuyYAO/smAD/7JgA7+yYAInsmAAIAAAAAAAAAAAAAAAAAAAAAAAAAADsmAAC65gAseyYALPrlwAKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOyYAAbsmAAc7JgAJOyYABDrmAAS65gABgAAAAAAAAAAAAAAAOyYAC7rmADJ7JgA/+yYAPfsmACP7JgAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADsmAB27JgA6+yYAHLsmAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOyYAALsmABe7JgAfuuXAFLrmAAKAAAAAAAAAADslwAM65gAl+uYAPnsmAD/7JgAveyYACTsmAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOuYAEjsmAD/7JgA7eyYAH7smAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgAHuyYAInsmADf7JgAWOyXAAIAAAAA65gAAuuXAFjsmADr7JgA/+yYAOXsmABSAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgADuyYAPHsmAD/65gA9+uYAF7rmAAKAAAAAAAAAAAAAAAAAAAAAAAAAADsmAAY7JgASuuXAF7smABS7JgABgAAAADsmAAI7JgAXuyYAK3smACp7JgAfuyYAAzsmAAC65gAAAAAAAAAAAAA7JgAAOuYAAAAAAAAAAAAAAAAAAAAAAAA65gAoeyYALvrlwC765gAweyYACwAAAAA7JgABOuYAAIAAAAA7JgAAuyYAAjslwAC7JgABuyYABjsmAAGAAAAAOyYAFjrmAAi7JgAFOuYADDsmABo7JgAXOyYADjsmABM7JgAHgAAAADsmAAW7JgAYAAAAADsmAAa7JgASOyYAFDsmAB87JgAXuyYAD7smABs7JgADuyYACTsmABm7JgAXOyYABbsmABa7JgAZuyYAFDsmAAo7JgAcuyYAHLsmAAe7JgAy+yYAFAAAAAA65gAVuuYAMnsmAA47JgAIuyYAKfslwBmAAAAAOyYAA7smAC17JgAk+yYAJvsmACp7JgAleyYAJPsmAB065gAleyYALvrmAAK7JgAeuyYAIHsmACV65gAjeyYAK3rmACT7JgAseyYAJ3rmACR65gAp+yYAGLsmACT7JgAyeyYAIHsmABE7JgAueyYABbsmAAE7JgAneyYAMPsmAASAAAAAOyYACbsmADV7JgAmeyYAHzsmABQ7JgAq+uYAHDsmACn65gAu+yYADzsmABq65gAfOyYAGjsmACp7JgAZOyYAKHsmADL7JgAk+uYAIfrmACD7JgAk+yYAGrsmAC17JgAROyYABrslwDH7JgASOyYADjsmADJ65gAi+uYAInsmAAc65gAAOyYAIPsmADH7JgAYuyYABjsmADn7JgAleyYADzrmABA7JgAfuyYAELsmABg7JgAg+yYADbrmAAu7JgAcOyYAHTsmAAe7JgAZOyYAKvsmAC/65gALOyYAIvsmABu7JgAQuuYAHrsmABG65gAXOyYAIvsmAAY7JgAgeuYAETsmAAC7JgAKuyYAKnsmABG7JgAAuyYALnsmAA665gAAgAAAADsmAAY7JgAIuuYAArsmAAi7JgAJuuYABrrmAAS7JgAIOyYAB7smAAa7JgAOuyYALfsmAAc65cAJOuXACrsmAAW7JgADuyYAArsmAAQ7JgAEOyYAALsmAAQ7JgADuyYAETsmABe7JgAFuyYAArrmAAC7JgAHuyYAAoAAAAAAAAAAOyYAHrsmABi7JgAOOyYAJ3smACZ7JgAgeyYADTsmACh65gAn+yYAKnslwA47JgAIOyYAO3rmAD965gA/eyXAJMAAAAAAAAAAAAAAAAAAAAAAAAAAOyYAALsmAAo7JgAw+yXAN3slwBE7JgAOuyYAB4AAAAAAAAAAOyYAADsmAAC65gAq+yYAHjsmAA07JgAYuyYAK3smAB+7JgALOyYAIXsmAC97JgAyeyYAFbsmAAE7JgA5+yYAP/smAD/7JgAqQAAAAAAAAAAAAAAAAAAAADsmAAA7JcAJOyYAKfsmAD57JgA/eyYAO3smADb65cAgQAAAAAAAAAA7JgABuuYAC7smACx7JgAkeyYACbsmABk7JgAw+yYAKPsmAAs7JgAduyYAMPsmACz7JgAeOyYAA7slwDL7JgA/+yYAP/smADLAAAAAAAAAAAAAAAAAAAAAOyYAAzsmAB87JgA8+yYAP/smAD/7JgA/+yYAP/smADz65cAVOyYAAzsmAAE7JgAMuyYAELsmAAi7JgACuuYABjsmAA87JgAOuyYABDrmAAs65cAWuyYAFTsmAA87JgABuyYAKPsmAD/7JgA/+uYAPXrmAAUAAAAAAAAAAAAAAAA65gAFOuYAKHsmAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smADh7JgAh+yXAEbsmAAS65gAAAAAAAAAAAAAAAAAAOyYAALrmAACAAAAAOyYAADsmAAG7JgABuuXAALsmAAA65gAXuuYAP3smAD/7JgA/+uYAGAAAAAAAAAAAAAAAADsmAAw65gAweyYAP/smAD/7JgA/+yYAP/smADz7JgA2+yYAP3smAD37JgAqeuYABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADrlwAq7JgA3eyYAP/smAD/7JgAs+uYAAwAAAAA65gAEuuYALvsmAD97JgA/+yYAP/smAD/7JgA4eyYAIHsmABi7JgA+euYAMPrmABI7JgAGuyYAB4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA65gAAOyYAATrmAACAAAAAOyYABDsmACX7JgA/+yYAP/smADt65gAg+yYAFTrmACb7JgA/+yYAP/smAD/7JgA/+yYAP3rmACv7JgAIuyYADjsmAC97JgAaOyYAAjsmACD7JgAn+yYABIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADsmAAU7JgAOOyYAAgAAAAA7JgAAuuXAEzsmADh7JgA/+yYAP/smADz7JgA6eyYAPnsmAD/7JgA/+yYAP/smAD/7JgA/+yYAO/smADL7JgAeuyYALHsmACn7JgAGuyYAMfsmAD37JgAreyYAEDsmAAGAAAAAAAAAAAAAAAA65gACOyYAKXsmABK7JgAAgAAAAAAAAAA7JgACOuYAI/smAD57JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA5eyYAGjsmAAM65cAzeyYAP/smAD/65gA/eyYAK8AAAAA65cABuuYAC7slwDH7JgAmwAAAAAAAAAAAAAAAAAAAAAAAAAA7JgAJuyYAMHsmAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD57JgAs+yYAGrsmADh7JgA/+yYAP/smAD/7JgA3eyYABjrmAA+7JgAy+yYAMvsmAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgAPOyYAOnsmAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD97JgA8+yYAPvsmAD/7JgA/+yYAP/smADx65gAreyYALvsmADX7JgARgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADrmAAC7JgAWuyYAO3smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD97JgA2euYAFTsmAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADrmAAC7JgAQuyXAMXrmAD57JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA++yYAMXsmAA+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgALuyYAJvsmADn7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAOXsmACd7JgAJgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgAEOyYAFbrmACj7JgA4eyYAP3smAD/7JgA/+yYAP/smAD/7JgA/+yYAP/smAD/7JgA/+yYAOHsmACh7JgAVuyXABIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7JgAAuyYABTsmAAw7JgAaOyYAKnslwDL7JgA4eyYAOvsmADh7JgAzeyYAKnsmABy7JgAKuuYABTslwAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//AP//+Aw//+D/7//D////h+f//w/n//4f9//8P/P+fH/x//z/8P//////924EwBFnNPQLYzPvy+u3/+///+Iw/n92MPwPMzD8D//w+AP/+PgB//hwE//4IDZ//AASP3wABg5+AAIM/wAAAf+AAAP/wAAH/+AAD//4AD///wH/8="
      rel="icon" type="image/x-icon"/>
<link href="<%=resourcePath%>/css/bootstrap.css" rel="stylesheet" type="text/css">
<link type="text/css" href="<%=resourcePath%>/rongyun/css/RongIMWidget.css" rel="stylesheet"/>
<link type="text/css" href="<%=resourcePath%>/css/jquery-ui/jquery-ui.min.css" rel="stylesheet"/>

<script src="<%=resourcePath%>/js/jquery-3.1.1.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular-animate.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/angular-resource.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/js/angular/ui-bootstrap-tpls-2.2.0.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/js/bootstrap/bootstrap.min.js" type="text/javascript" charset="UTF-8" language="javascript"></script>
<script src="<%=resourcePath%>/rongyun/RongIMWidget.min.js" type="text/javascript"></script>
<script src="<%=resourcePath%>/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=resourcePath%>/js/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var username = '<%=user.getUsername()%>';

    function isLogin() {
        if (username) {
            return true;
        } else {
            showConfirm('尚未登录，现在？', function (result) {
                if (result) {
                    window.location.href = "<%=path%>/login/index.htm";
                }
            });
        }
    }

    function showConfirm(message, callback) {
        bootbox.confirm({
            message: message,
            buttons: {
                confirm: {
                    label: '确认',
                    className: 'btn-success'
                },
                cancel: {
                    label: '取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                callback(result);
            }
        });
    }

    function showMessage(message, callback) {
        bootbox.alert({
            size: "small",
            message: message,
            buttons: {
                ok: {
                    label: '确定',
                    className: 'btn-success'
                }
            },
            callback: callback
        });
    }
</script>

