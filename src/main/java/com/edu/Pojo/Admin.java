package com.edu.Pojo;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:24
 */
public class Admin {
    private String admin_account;  //管理员帐号
    private String admin_password; //管理员密码
    private String position;       //职位

    public String getAdmin_account() {
        return admin_account;
    }

    public void setAdmin_account(String admin_account) {
        this.admin_account = admin_account;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_account='" + admin_account + '\'' +
                ", admin_password='" + admin_password + '\'' +
                ", position='" + position + '\'' +
                '}';
    }
}
