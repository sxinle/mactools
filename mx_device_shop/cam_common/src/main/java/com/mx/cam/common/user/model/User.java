package com.mx.cam.common.user.model;


import com.mx.cam.common.common.SearchPageUtil;

public class User extends SearchPageUtil {

    private static final long serialVersionUID = 1L;

    private String user_id;
    private String user_name;
    private String user_fullname;
    private String user_pwd;
    private String start_time;
    private String update_time;
    private String enable;
//    private String role_id;
//    private String role_name;
//    private String user_pwd_old;
    private String mail;
    private String phone;
    private String address;
    private String gender;

    private String roleIDs="";
    private String roleNames="";
    private String groupIDs="";
    private String groupNames="";
    private String urls="";
    private String oem="";

    private String user_pwd_old;

   /* @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_fullname='" + user_fullname + '\'' +
                ", user_pwd='" + user_pwd + '\'' +
                ", start_time='" + start_time + '\'' +
                ", update_time='" + update_time + '\'' +
                ", enable='" + enable + '\'' +
//                ", role_id='" + role_id + '\'' +
//                ", role_name='" + role_name + '\'' +
//                ", user_pwd_old='" + user_pwd_old + '\'' +
                ", mail='" + mail + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }*/


	public String getUser_pwd_old() {
		return user_pwd_old;
	}

	public void setUser_pwd_old(String user_pwd_old) {
		this.user_pwd_old = user_pwd_old;
	}

	public String getOem() {
		return oem;
	}

	public void setOem(String oem) {
		this.oem = oem;
	}

	public String getUser_id() {
        return user_id;
    }

	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	public String getRoleIDs() {
		return roleIDs;
	}

	public void setRoleIDs(String roleIDs) {
		this.roleIDs = roleIDs;
	}

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

	public String getGroupIDs() {
		return groupIDs;
	}

	public void setGroupIDs(String groupIDs) {
		this.groupIDs = groupIDs;
	}

	public String getGroupNames() {
		return groupNames;
	}

	public void setGroupNames(String groupNames) {
		this.groupNames = groupNames;
	}

	public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_fullname() {
        return user_fullname;
    }

    public void setUser_fullname(String user_fullname) {
        this.user_fullname = user_fullname;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

//    public String getRole_id() {
//        return role_id;
//    }
//
//    public void setRole_id(String role_id) {
//        this.role_id = role_id;
//    }
//
//    public String getRole_name() {
//        return role_name;
//    }
//
//    public void setRole_name(String role_name) {
//        this.role_name = role_name;
//    }
//
//    public String getUser_pwd_old() {
//        return user_pwd_old;
//    }
//
//    public void setUser_pwd_old(String user_pwd_old) {
//        this.user_pwd_old = user_pwd_old;
//    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
