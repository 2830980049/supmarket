package com.edu.Pojo;

import java.util.Date;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:25
 */
public class Checker {
    private String checker_account; //收营员帐户
    private String checker_name;    //收营员姓名
    private String checker_password;//收营员密码
    private String checker_sex;     //收营员性别
    private Date checker_birthday;  //收营员出生日期
    private Integer checker_phone;      //收营员电话
    private String position;        //职位

    public String getChecker_account() {
        return checker_account;
    }

    public void setChecker_account(String checker_account) {
        this.checker_account = checker_account;
    }

    public String getChecker_name() {
        return checker_name;
    }

    public void setChecker_name(String checker_name) {
        this.checker_name = checker_name;
    }

    public String getChecker_password() {
        return checker_password;
    }

    public void setChecker_password(String checker_password) {
        this.checker_password = checker_password;
    }

    public String getChecker_sex() {
        return checker_sex;
    }

    public void setChecker_sex(String checker_sex) {
        this.checker_sex = checker_sex;
    }

    public Date getChecker_birthday() {
        return checker_birthday;
    }

    public void setChecker_birthday(Date checker_birthday) {
        this.checker_birthday = checker_birthday;
    }

    public Integer getChecker_phone() {
        return checker_phone;
    }

    public void setChecker_phone(Integer checker_phone) {
        this.checker_phone = checker_phone;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "Checker{" +
                "checker_account='" + checker_account + '\'' +
                ", checker_name='" + checker_name + '\'' +
                ", checker_password='" + checker_password + '\'' +
                ", checker_sex='" + checker_sex + '\'' +
                ", checker_birthday=" + checker_birthday +
                ", checker_phone=" + checker_phone +
                ", position='" + position + '\'' +
                '}';
    }
}
