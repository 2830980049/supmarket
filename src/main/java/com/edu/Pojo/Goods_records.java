package com.edu.Pojo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:24
 */
public class Goods_records {
    private Integer goods_id;        //消费主编号
    private String trade_id;        //商品编号
    private String trade_name;      //商品名称
    private String trade_type;      //商品类型
    private String discount_type;    //打折类型
    private Integer trade_number;  //商品数量
    private String status;      //状态
    private Double total;       //消费总额

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getTrade_id() {
        return trade_id;
    }

    public void setTrade_id(String trade_id) {
        this.trade_id = trade_id;
    }

    public String getTrade_name() {
        return trade_name;
    }

    public void setTrade_name(String trade_name) {
        this.trade_name = trade_name;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getDiscount_type() {
        return discount_type;
    }

    public void setDiscount_type(String discount_type) {
        this.discount_type = discount_type;
    }

    public Integer getTrade_number() {
        return trade_number;
    }

    public void setTrade_number(Integer trade_number) {
        this.trade_number = trade_number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Goods_records{" +
                "goods_id='" + goods_id + '\'' +
                ", trade_id='" + trade_id + '\'' +
                ", trade_name='" + trade_name + '\'' +
                ", trade_type='" + trade_type + '\'' +
                ", discount_type='" + discount_type + '\'' +
                ", trade_number=" + trade_number +
                ", status='" + status + '\'' +
                '}';
    }
}
