package com.codegen.controller;

import com.codegen.core.CodeGeneratorTool;
import com.codegen.core.model.ClassInfo;
import com.codegen.core.util.ResultUtil;
import com.codegen.model.Result;
import com.codegen.util.CommonPropertyUtil;
import com.codegen.util.FreemarkerTool;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 生成Code的主Controller
 *
 * @author dingzhenggang
 */
@Controller
@Slf4j
public class IndexController {


  private String author = CommonPropertyUtil.getProperty("gen.author.info");

  @Resource
  private FreemarkerTool freemarkerTool;

  @RequestMapping("/")
  public String index() {
    return "index";
  }

  /**
   * 生成代码
   *
   * @param tableSql
   * @return
   */
  @RequestMapping("/codeGenerate")
  @ResponseBody
  public Result<Map<String, String>> codeGenerate(String tableSql) {

    try {
      if (StringUtils.isEmpty(tableSql)) {
        return new ResultUtil<Map<String, String>>().setErrorMsg("表结构信息不可为空");
      }

      // parse table
      ClassInfo classInfo = CodeGeneratorTool.processTableIntoClassInfo(tableSql);

      // code genarete
      Map<String, Object> params = new HashMap<String, Object>();
      params.put("classInfo", classInfo);

      params.put("authorInfo", author);

      // result
      Map<String, String> result = new HashMap<String, String>();

      result.put("controller_code", freemarkerTool.processString("code-format/controller.ftl", params));
      result.put("service_code", freemarkerTool.processString("code-format/service.ftl", params));
      result.put("service_impl_code", freemarkerTool.processString("code-format/service_impl.ftl", params));

      result.put("dao_code", freemarkerTool.processString("code-format/dao.ftl", params));
      result.put("mybatis_code", freemarkerTool.processString("code-format/mybatis.ftl", params));
      result.put("model_code", freemarkerTool.processString("code-format/model.ftl", params));

      result.put("page_model_code", freemarkerTool.processString("code-format/page_model.ftl", params));

      // 计算,生成代码行数
      int lineNum = 0;
      for (Map.Entry<String, String> item : result.entrySet()) {
        if (item.getValue() != null) {
          lineNum += StringUtils.countMatches(item.getValue(), "\n");
        }
      }
      log.info("生成代码行数：{}", lineNum);

      return new ResultUtil<Map<String, String>>().setData(result);
    } catch (IOException | TemplateException e) {
      log.error(e.getMessage(), e);
      return new ResultUtil<Map<String, String>>().setErrorMsg("表结构解析失败");
    }

  }

}