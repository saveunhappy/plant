package com.course.server.service;

import com.course.server.domain.Chapter;
import com.course.server.domain.ChapterExample;
import com.course.server.mapper.ChapterMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ChapterService {
    @Resource
    private ChapterMapper chapterMapper;
    public List<Chapter> list(){
        ChapterExample example = new ChapterExample();
        ChapterExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo("1");
        return chapterMapper.selectByExample(example);
    }
}
