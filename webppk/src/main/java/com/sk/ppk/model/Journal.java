package com.sk.ppk.model;

import java.util.Date;

public class Journal
{

	private Integer id;

    private String user;

    private String columnname;
    
    private String operater;

    private String ipaddress;
    
    private Date creattime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getColumnname() {
        return columnname;
    }

    public void setColumn(String columnname) {
        this.columnname = columnname;
    }
    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    public String getOperater() {
        return operater;
    }

    public void setOperater(String operater) {
        this.operater = operater;
    }
    
    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }
    
    public Date getCreatetime() {
        return creattime;
    }

    public void setCreatetime(Date creattime) {
        this.creattime = creattime;
    }

}
