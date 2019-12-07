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

import java.io.InputStream;
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
        User user = new User();
        user.setAccount("12352");
        adminBaseMapper.deleteChecker(user);
    }

    @Test
    public void Checkss() {
        //5 使用代理对象执行方法
        List<Trade> user = null;
        //执行保存方法
        user = adminBaseMapper.queryTrade_TypeAll();
        for (Trade s:user)
            System.out.println(s);
    }

}

