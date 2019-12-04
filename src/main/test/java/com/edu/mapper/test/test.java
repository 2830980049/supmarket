package com.edu.mapper.test;

import com.edu.Mapper.base.CheckerBaseMapper;
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
        Goods_records goods_records = new Goods_records();
        goods_records.setDiscount_type("不打折");
        goods_records.setGoods_id("121233");
        goods_records.setGoods_second_id("1231235");
        goods_records.setTrade_id("1235");
        goods_records.setTrade_number(123);
        goods_records.setTrade_type("sd");
        goods_records.setTrade_name("42");
        //执行保存方法
        checkerBaseMapper.insert_goods_records(goods_records);
    }

    @Test
    public void datelets() {
        //5 使用代理对象执行方法
        Goods_records goods_records = new Goods_records();
        goods_records.setGoods_second_id("1231235");
        //执行保存方法
        checkerBaseMapper.delete_goods_records(goods_records);
    }

    @Test
    public void Checkss() {
        //5 使用代理对象执行方法
        User user = new User();
        user.setChecker_name("12");
        List<User> users = null;
        //执行保存方法
        users = checkerBaseMapper.queryChecker(user);
        for(User user1 : users)
            System.out.println(user1);
    }

}

