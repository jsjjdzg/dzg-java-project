package com.codegen.core.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 字段信息
 *
 * @author dingzhenggang
 */
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class FieldInfo {

  private String columnName;
  private String fieldName;
  private String fieldClass;
  private String fieldComment;

}
