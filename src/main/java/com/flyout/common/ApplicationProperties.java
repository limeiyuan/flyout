package com.flyout.common;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by LiMeiyuan on 2016/11/16 1:21.
 * description:
 */
public class ApplicationProperties implements InitializingBean {
    private Map<String, Object> map;

    @Override
    public void afterPropertiesSet() throws Exception {
        ResourceLoader resourceLoader = new DefaultResourceLoader();

        Properties properties = new Properties();
        properties.load(resourceLoader.getResource("classpath:application.properties").getInputStream());
        if (properties.stringPropertyNames() != null && properties.stringPropertyNames().size() > 0) {
            map = new HashMap<>(properties.stringPropertyNames().size());
            for (String key : properties.stringPropertyNames()) {
                map.put(key, properties.get(key));
            }
        }
    }

    public Map<String, Object> getMap() {
        return map;
    }
}
