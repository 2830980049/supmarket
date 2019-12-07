package com.edu.Pojo;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:25
 */
public class Trade {
    private String trade_type_id;//商品类型编号
    private String trade_id;     //商品编号
    private String trade_name;   //商品名称
    private String trade_type;   //商品类型
    private String trade_value;  //商品价格
    private Integer trade_number;//商品数量

    public String getTrade_id() {
        return trade_id;
    }

    public String getTrade_type_id() {
        return trade_type_id;
    }

    public void setTrade_type_id(String trade_type_id) {
        this.trade_type_id = trade_type_id;
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

    public String getTrade_value() {
        return trade_value;
    }

    public void setTrade_value(String trade_value) {
        this.trade_value = trade_value;
    }

    public Integer getTrade_number() {
        return trade_number;
    }

    public void setTrade_number(Integer trade_number) {
        this.trade_number = trade_number;
    }

    @Override
    public String toString() {
        return "Trade{" +
                "trade_type_id='" + trade_type_id + '\'' +
                ", trade_id='" + trade_id + '\'' +
                ", trade_name='" + trade_name + '\'' +
                ", trade_type='" + trade_type + '\'' +
                ", trade_value='" + trade_value + '\'' +
                ", trade_number=" + trade_number +
                '}';
    }
}
