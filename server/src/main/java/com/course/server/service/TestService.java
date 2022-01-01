package com.course.server.service;

import org.springframework.stereotype.Service;
import com.course.server.domain.Test;
import com.course.server.mapper.TestMapper;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TestService {
    @Resource
    private TestMapper testMapper;
    public List<Test> list(){
        return testMapper.list();
    }
}
