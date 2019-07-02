package com.codegen.core.util;


import com.codegen.model.Result;

/**
 * 返回的Result设定结果
 *
 * @param <T>
 * @author dingzhenggang
 */
public class ResultUtil<T> {

  public static final int SUCCESS_CODE = 200;
  public static final int FAIL_CODE = 500;

  private Result<T> data;

  public ResultUtil() {
    data = new Result<>();
  }

  public Result<T> setData(T t) {
    this.data.setSuccess(true);
    this.data.setData(t);
    this.data.setCode(SUCCESS_CODE);
    return this.data;
  }

  public Result<T> setDataAndMsg(T t, String msg) {
    this.data.setSuccess(true);
    this.data.setData(t);
    this.data.setCode(SUCCESS_CODE);
    this.data.setMessage(msg);
    return this.data;
  }

  public Result<T> setSuccessMsg(String msg) {
    this.data.setSuccess(true);
    this.data.setMessage(msg);
    this.data.setCode(SUCCESS_CODE);
    this.data.setData(null);
    return this.data;
  }

  public Result<T> setErrorMsg(String msg) {
    this.data.setSuccess(false);
    this.data.setMessage(msg);
    this.data.setCode(FAIL_CODE);
    return this.data;
  }

  public Result<T> setErrorMsgAndDiyCode(Integer code, String msg) {
    this.data.setSuccess(false);
    this.data.setMessage(msg);
    this.data.setCode(code);
    return this.data;
  }
}
