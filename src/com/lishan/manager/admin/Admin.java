package com.lishan.manager.admin;

import java.util.Date;

import com.alibaba.fastjson.JSON;

public class Admin {

	
	//admin管理员表
	private String username;
	private String password;
	private Date createtime;
	private Integer state;
	private Integer rid;
	
	
	
	 
	public Admin() {
		
	}
	public Admin(String username, String password, Date createtime, Integer state, Integer rid) {
		super();
		this.username = username;
		this.password = password;
		this.createtime = createtime;
		this.state = state;
		this.rid = rid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	
	
	
	
	
	
}
