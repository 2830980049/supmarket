package com.edu.Pojo;

import java.util.Date;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:25
 */
public class User {
    private String account;    //帐户
    private String username;   //姓名
    private String password;   //密码
    private String sex;        //性别
    private Date birthday;     //出生日期
    private String phone;      //电话
    private String positions;  //职位

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPositions() {
        return positions;
    }

    public void setPositions(String positions) {
        this.positions = positions;
    }

    @Override
    public String toString() {
        return "User{" +
                "account='" + account + '\'' +
                ", name='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", phone='" + phone + '\'' +
                ", positions='" + positions + '\'' +
                '}';
    }
}
