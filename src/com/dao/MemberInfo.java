package com.dao;

import java.sql.Timestamp;

public class MemberInfo {
    private String id;
    private String pass;
    private String name;
    private String birthday;
    private String phone;
    private String email;
    private Timestamp reg_date;
    private Timestamp mod_date;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String string) {
		this.birthday = string;
	}
	public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp timestamp) {
		this.reg_date = timestamp;
	}
	public Timestamp getMod_date() {
		return mod_date;
	}
	public void setMod_date(Timestamp timestamp) {
		this.mod_date = timestamp;
	}
    
}
