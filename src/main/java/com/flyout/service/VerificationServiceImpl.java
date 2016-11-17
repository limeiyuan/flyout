package com.flyout.service;

import com.flyout.common.ApplicationProperties;
import com.flyout.common.cache.MemcachedManager;
import com.flyout.common.constance.Constance;
import com.flyout.common.constance.MemcachedConstance;
import com.flyout.common.dto.BasicDto;
import com.flyout.common.util.IPUtil;
import com.flyout.common.util.LogUtil;
import com.flyout.common.util.RandomUtil;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/11/17 16:39.
 * description:
 */
@Service
public class VerificationServiceImpl {
    @Autowired
    private MemcachedManager memcachedManager;

    @Autowired
    private ApplicationProperties properties;

    @Autowired
    private SMSHistoryServiceImpl smsHistoryService;

    private static final String SHORTMESSAGE_CONTENT = "您的验证码是：%s 。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
    private static final String SHORTMESSAGE_CONTENT_GJ = "Welcome to flybroad, your authorize code is %s. Please keep it carefully.";

    private static final String ipKeyMinPre = "yonten_sms_ip_min_";
    private static final String telKeyMinPre = "yonten_sms_tel_min_";

    public BasicDto sendVerificationNum(HttpServletRequest request, String phoneArea, String phoneNum) {
        BasicDto dto = validSend(phoneNum, request);
        if (!dto.getResult()) {
            return dto;
        }
        dto.setResult(false);

        if (phoneNum.startsWith("0")) {
            phoneNum = phoneNum.substring(1);
        }
        // 账户由国际码和电话号码组成
        String accountFull = phoneArea + phoneNum;

        //获取配置文件中的短信用户名、密码、URL
        String nu = properties.getValue("SHORTMESSAGE_INTERFACE_UNAME");//用户名
        String static_message;
        if (!Constance.PHONE_AREA_CN.equals(phoneArea)) {
            // 国际短信
            nu = properties.getValue("SHORTMESSAGE_INTERFACE_UNAME_GJ");//用户名
            static_message = SHORTMESSAGE_CONTENT_GJ;//发送的短信内容模板
        } else {
            // 国内短信
            static_message = SHORTMESSAGE_CONTENT;//发送的短信内容模板
        }
        String pwd = properties.getValue("SHORTMESSAGE_INTERFACE_PASSWORD");//密码
        String msg_url = properties.getValue("SHORTMESSAGE_INTERFACE_URL");//URL
        String verification = RandomUtil.genRandomChar(6, RandomUtil.RandomType.NUMBER);//生成6位数字验证码

        //短信内容
        String message = String.format(static_message, verification);
        StringBuilder document = new StringBuilder();
        try {
            //最终短信URL
            String final_url;
            if (Constance.PHONE_AREA_CN.equals(phoneArea)) {
                // 国内短信
                final_url = String.format(msg_url, nu, pwd, phoneNum, URLEncoder.encode(message, "gb2312"));
            } else {
                // 国际短信
                final_url = String.format(msg_url, nu, pwd, phoneArea + "%20" + phoneNum, URLEncoder.encode(message, "gb2312"));
            }

            URL url = new URL(final_url);//远程调用URL
            URLConnection conn = url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                document.append(line).append(" ");
            }
            reader.close();
        } catch (Exception e) {
            LogUtil.getLogger().error(e);
            dto.setMessage("服务器错误");
            return dto;
        }
        String xml = document.toString();//xml形式的返回值
        System.err.println(phoneNum + "短信返回值：" + xml);
        Map<String, Object> resMap = readStringXml(xml);
        Integer backNum = (Integer) resMap.get("code");
        String msg = (String) resMap.get("msg");
        if (backNum == 2) {
            String key = MemcachedConstance.sms_key + accountFull;//组装短信key
            memcachedManager.del(key);//先删除memcache中的该手机号码的缓存数据
            //重新保存当前手机的手机验证码
            memcachedManager.add(key, MemcachedConstance.sms_expire, verification);//把生成的验证码放入到memcache中，有效期10分钟
            dto.setResult(true);
            dto.setMessage("短信发送成功");
            return dto;
        } else {
            dto.setMessage(msg);
            dto.setResult(false);
            return dto;
        }
    }

    /**
     * 验证是否可以发送短信
     *
     * @param tel      电话号码
     * @param request  请求体
     * @return 是否可以发送短信
     */
    private BasicDto validSend(String tel, HttpServletRequest request) {
        String ip = IPUtil.getClientIP(request);
        BasicDto dto = new BasicDto();
        dto.setResult(false);
        try {
            if (memcachedManager.get(ipKeyMinPre + ip) != null) {
                dto.setMessage("同一ip地址60秒内仅能请求一次");
                return dto;
            }
            Integer count = smsHistoryService.getCountByIp(ip);
            if (count != null && count > 20) {
                dto.setMessage("同一ip地址一天内仅能发送20条短信");
                return dto;
            }
            if (memcachedManager.get(telKeyMinPre + tel) != null) {
                dto.setMessage("同一电话60秒内仅能请求一次");
                return dto;
            }
            count = smsHistoryService.getCountByTel(tel);
            if (count != null && count > 20) {
                dto.setMessage("同一电话一天内仅能发送20条短信");
                return dto;
            }
            smsHistoryService.save(ip, tel);
            dto.setResult(true);
            return dto;
        } catch (Exception e) {
            LogUtil.getLogger().error("校验是否可发送短信时发生错误", e);
            dto.setMessage("校验错误");
            return dto;
        }
    }

    /**
     * 方法描述：解析短信返回的XML字符串
     */
    private static Map<String, Object> readStringXml(String xml) {
        Map<String, Object> res_map = new HashMap<>();
        try {
            Document doc;
            doc = DocumentHelper.parseText(xml);
            Element root = doc.getRootElement();
            Element Result = root.element("msg");
            String u8 = Result.getTextTrim();
            res_map.put("msg", u8);
            Element SendNum = root.element("code");
            res_map.put("code", Integer.valueOf(SendNum.getTextTrim()));
            return res_map;
        } catch (Exception e) {
            LogUtil.getLogger().error("解析短信返回值异常", e);
            return new HashMap<>(0);
        }
    }
}
