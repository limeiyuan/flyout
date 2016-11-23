package com.flyout.common.util;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by LiMeiyuan on 2016/11/23 15:45.
 * description:
 */
public class HtmlUtil {
    public static String getPlainText(String html) {
        if (StringUtils.isEmpty(html)) {
            return "";
        }
        String regScript = "<script[^>]*?>[\\s\\S]*?</script>"; // 定义script的正则表达式
        String regStyle = "<style[^>]*?>[\\s\\S]*?</style>"; // 定义style的正则表达式
        String regW = "<w:[\\s\\S]*?[^>]*?>[\\s\\S]*?</w:[\\s\\S]*?>"; // 定义w标签的正则表达式
        String regHtml = "<[^>]*?>"; // 定义HTML标签的正则表达式
        String regSpace = "\\s*|\t|\r|\n";// 定义空格回车换行符
        return html.replaceAll(regHtml, "").replaceAll(regScript, "")
                .replaceAll(regStyle, "").replaceAll(regW, "").replaceAll(regSpace, "");
    }
}
