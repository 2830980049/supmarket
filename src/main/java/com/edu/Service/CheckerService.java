package com.edu.Service;

import com.edu.Mapper.CheckerMapper;
import com.edu.Pojo.Checker;
import org.apache.logging.log4j.core.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSOutput;

import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 13:33
 */

@Service
public class CheckerService {
    @Autowired
    private CheckerMapper checkerMapper;

    public Checker selectOne(Checker checker){
        List<Checker> list = checkerMapper.queryChecker(checker);
        if(list != null && list.size() > 1){
            throw  new RuntimeException("查询到多组数组");
        }
        if(list == null || list.size() == 0)
            return null;
        return list.get(0);
    }

}
