package com.sk.ppk.model;

import java.util.Date;

public class Role {
    private Integer id;

    private Integer roletype;

    private String rolename;
    
    private Integer status;

    private String createuser;

    private Date createtime;

    private String authority;
    
    private String systemconfigure;
    
    private String basicconfigure;

    private String authorityconfigure;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getStatus() {
        return status;
    }

    public Integer getRoletype() {
		return roletype;
	}

	public void setRoletype(Integer roletype) {
		this.roletype = roletype;
	}

	public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser == null ? null : createuser.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority == null ? null : authority.trim();
    }
    
    public String getRoleName() {
        return rolename;
    }

    public void setRoleName(String rolename) {
        this.rolename = rolename;
    }
    
    public String getSystemConfigure() {
        return systemconfigure;
    }

    public void setSystemConfigure(String systemconfigure) {
        this.systemconfigure = systemconfigure;
    }
    
    public String BasicConfigure() {
        return basicconfigure;
    }

    public void setBasicConfigure(String basicconfigure) {
        this.basicconfigure = basicconfigure;
    }
    
    public String AuthorityConfigure() {
        return authorityconfigure;
    }

    public void setAuthorityConfigure(String authorityconfigure) {
        this.authorityconfigure = authorityconfigure;
    }
    
}