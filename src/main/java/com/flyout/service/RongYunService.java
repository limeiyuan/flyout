package com.flyout.service;

import com.flyout.common.ApplicationProperties;
import com.flyout.common.dto.CustomServiceDto;
import com.flyout.common.util.AuthUtil;
import com.flyout.common.util.HttpUtil;
import com.flyout.common.util.LogUtil;
import com.flyout.common.util.RandomUtil;
import com.flyout.domain.Account;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/11/25 10:47.
 * description:
 */
@Service
public class RongyunService {
    @Autowired
    private ApplicationProperties properties;

    public CustomServiceDto getToken(Account account) {
        return getToken(account.getScreenname(), account.getId().toString(), properties.getValue("SERVER_PIC_PATH") + account.getPhoto().getPath());
    }

    public CustomServiceDto getToken(String username, String userId, String avatarUrl) {
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("name", username);
        params.put("portraitUri", avatarUrl);
        String result = HttpUtil.request(properties.getValue("RONGYUN_TOKEN_ADDRESS"), params, getRequestHeader());
        JsonParser parser = new JsonParser();
        String token = null;
        try {
            JsonObject json = parser.parse(result).getAsJsonObject();
            if (json.get("code").getAsInt() == 200) {
                token = json.get("token").getAsString();
            } else {
                LogUtil.getLogger().debug("获取token错误，返回值=" + result);
            }
        } catch (JsonSyntaxException e) {
            LogUtil.getLogger().error(e);
            LogUtil.getLogger().debug("解析token返回值异常" + e.getMessage());
        }
        CustomServiceDto dto = new CustomServiceDto();
        dto.setToken(token);
        dto.setUserId(userId);
        dto.setName(username);
        return dto;
    }

    private Map<String, String> getRequestHeader() {
        String appKey = properties.getValue("RONGYUN_APP_KEY");
        String appSecret = properties.getValue("RONGYUN_APP_SECRET");

        Map<String, String> headers = new HashMap<>();
        String random = RandomUtil.genRandomChar(6, RandomUtil.RandomType.NUMBER);
        String timestamp = String.valueOf((int) (new Date().getTime() / 1000));
        String sign = AuthUtil.gen(appSecret + random + timestamp, AuthUtil.SHA1);

        headers.put("App-Key", appKey);
        headers.put("Nonce", random);
        headers.put("Timestamp", timestamp);
        headers.put("Signature", sign);
        return headers;
    }
}
