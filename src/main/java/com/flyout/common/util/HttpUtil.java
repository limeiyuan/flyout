package com.flyout.common.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/11/25 15:33.
 * description:
 */
public class HttpUtil {
    public static String request(String url, Map<String, String> params, Map<String, String> headers) {
        if (headers == null) {
            headers = new HashMap<>();
        }
        headers.put("Content-Type", "application/x-www-form-urlencoded");
        String paramStr = "";
        for (String s : params.keySet()) {
            paramStr += s + "=" + params.get(s) + "&";
        }
        paramStr = paramStr.substring(0, paramStr.length() - 1);
        return request(url, paramStr, headers);
    }

    public static String request(String url, String data, Map<String, String> headers) {
        try {
            HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
            if (headers != null) {
                for (String s : headers.keySet()) {
                    con.addRequestProperty(s, headers.get(s));
                }
            }
            con.setDoOutput(true);
            con.setRequestMethod("POST");
            OutputStream out = con.getOutputStream();
            out.write(data.getBytes());
            out.flush();
            InputStream in;
            if (con.getResponseCode() != HttpURLConnection.HTTP_OK) {
                in = con.getErrorStream();
            } else {
                in = con.getInputStream();
            }
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            StringBuilder builder = new StringBuilder("");
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line).append("\r\n");
            }
            return builder.toString();
        } catch (MalformedURLException | ProtocolException e) {
            LogUtil.getLogger().error("连接服务器异常", e);
        } catch (IOException e) {
            LogUtil.getLogger().error("通信异常", e);
        }
        return null;
    }
}
