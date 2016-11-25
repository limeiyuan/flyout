package com.flyout.common;

import org.apache.log4j.Logger;
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
    private static Logger logger = Logger.getLogger(ApplicationProperties.class);

    private Map<String, Object> map;
    private Properties properties;

    @Override
    public void afterPropertiesSet() throws Exception {
        ResourceLoader resourceLoader = new DefaultResourceLoader();

        properties = new Properties();
        properties.load(resourceLoader.getResource("classpath:application.properties").getInputStream());
        if (properties.stringPropertyNames() != null && properties.stringPropertyNames().size() > 0) {
            map = new HashMap<>(properties.stringPropertyNames().size());
            for (String key : properties.stringPropertyNames()) {
                map.put(key, properties.get(key));
            }
        }
        properties.load(resourceLoader.getResource("classpath:flyout.properties").getInputStream());
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public String getValue(String key){
        return properties.get(key).toString();
    }
}
