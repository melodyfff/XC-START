package com.xinchen.Exception;

/**
 * 自定义异常
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:57.
 * @see 2017/4/30 20:57 Created
 ****************************************/
public class ApplicationException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
    private String msg;
    private int code = 500;
    
    public ApplicationException(String msg) {
		super(msg);
		this.msg = msg;
	}
	
	public ApplicationException(String msg, Throwable e) {
		super(msg, e);
		this.msg = msg;
	}
	
	public ApplicationException(int code,String msg) {
		super(msg);
		this.msg = msg;
		this.code = code;
	}
	
	public ApplicationException(int code,String msg, Throwable e) {
		super(msg, e);
		this.msg = msg;
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	
}
