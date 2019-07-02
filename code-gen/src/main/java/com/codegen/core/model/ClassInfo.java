package com.codegen.core.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 实体类基本信息
 *
 * @author dingzhenggang
 */
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class ClassInfo {

  private String tableName;
  private String className;
  private String classComment;

  private List<FieldInfo> fieldList;


}