package com.edu.mapper.test;

import com.edu.Mapper.base.AdminBaseMapper;
import com.edu.Mapper.base.CheckerBaseMapper;
import com.edu.Pojo.Trade;
import com.edu.Pojo.User;
import com.edu.Pojo.Goods_records;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.util.ResourceUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.util.Date;
import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 13:06
 */
public class test {
    private InputStream in;
    private SqlSession session;
    private CheckerBaseMapper checkerBaseMapper;
    private AdminBaseMapper adminBaseMapper;


    @Before //用于在测试方法执行之前执行
    public void init() throws Exception {
        //1 读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");

        //2 创建SqlSessionFactory工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);

        //3 使用工厂生产SqlSession对象
        session = factory.openSession();

        //4 使用SqlSession创建Dao接口的代理对象
        checkerBaseMapper = session.getMapper(CheckerBaseMapper.class);
        adminBaseMapper = session.getMapper(AdminBaseMapper.class);
    }

    @After//用于测试方法执行之后执行
    public void destory() throws Exception {
        //提交事务
        session.commit();
        session.close();
        in.close();
    }

    /**
     * 测试staff保存
     */
    @Test
    public void testSave() {
        //5 使用代理对象执行方法
        Trade trade = new Trade();
        trade.setTrade_id("1234");


        adminBaseMapper.deleteTrade(trade);
    }

    @Test
    public void datelets() {
        //5 使用代理对象执行方法
        Trade trade = new Trade();
        trade.setTrade_id("123");
        List<Trade> list = adminBaseMapper.queryTradeAll(trade);
        System.out.println(list.get(0));
    }

    @Test
    public void Checkss() throws FileNotFoundException {
        //5 使用代理对象执行方法
        Goods_records goods_records = null;
        File sourceFile = ResourceUtils.getFile("classpath:discount1");
        //File file = null;
        Integer num = 100;

        String str = null;
        StringBuffer buf = new StringBuffer();
        try {
            Reader in = new FileReader(sourceFile);
            char[] cs = new char[1];
            int len = -1;

            while ((len = in.read(cs)) != -1) {
                buf.append(new String(cs, 0, len));
            }
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        str = buf.toString();
        System.out.println(str);
        //System.out.println(this.getClass().getResource("config.properties").getPath()+'\n');
        //System.out.println(this.getClass().getResource("CheckerBaseMapper.xml").getPath()+'\n');
       // System.out.println(goods_records.discounts(100,request,response));
    }

}

