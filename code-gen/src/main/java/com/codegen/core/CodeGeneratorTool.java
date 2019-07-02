package com.codegen.core;


import com.codegen.core.model.ClassInfo;
import com.codegen.core.util.TableParseUtil;
import lombok.SneakyThrows;

/**
 * 根据sql语句生成类信息类
 *
 * @author dingzhenggang
 */
public class CodeGeneratorTool {

  /**
   * process Table Into ClassInfo
   *
   * @param tableSql
   * @return
   */
  @SneakyThrows
  public static ClassInfo processTableIntoClassInfo(String tableSql) {
    return TableParseUtil.processTableIntoClassInfo(tableSql);
  }

}