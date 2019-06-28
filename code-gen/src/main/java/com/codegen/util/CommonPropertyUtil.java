package com.codegen.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取Common配置文件的方法
 */
public class CommonPropertyUtil {

  private static final Logger logger = LoggerFactory.getLogger(CommonPropertyUtil.class);
  private static Properties props;

  static {
    loadProps();
  }

  /**
   * 加载配置文件
   */
  synchronized static private void loadProps() {
    props = new Properties();
    InputStream in = null;
    try {
      in = CommonPropertyUtil.class.getResourceAsStream("/config/common.properties");
      props.load(in);
    } catch (Exception e) {
      logger.error("Load configuration file common.properties failed", e);
    } finally {
      try {
        if (null != in) {
          in.close();
        }
      } catch (IOException e) {
        logger.error("File common.properties  streams closes abnormality", e);
      }
    }
  }

  public static String getProperty(String key) {
    if (null == props) {
      loadProps();
    }
    return props.getProperty(key);
  }

  public static String getProperty(String key, String defaultValue) {
    if (null == props) {
      loadProps();
    }
    return props.getProperty(key, defaultValue);
  }
}
