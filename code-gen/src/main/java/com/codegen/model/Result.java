package com.codegen.model;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 返回值
 *
 * @param <T>
 * @author dingzhenggang
 */
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Result<T> implements Serializable {

  private static final long serialVersionUID = 1L;

  /**
   * 成功标志
   */
  private boolean success;

  /**
   * 返回消息
   */
  private String message;

  /**
   * 返回代码 200 400 500
   */
  private Integer code;

  /**
   * 时间戳
   */
  private long timestamp = System.currentTimeMillis();

  /**
   * 结果对象
   */
  private T data;
}
