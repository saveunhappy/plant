package com.course.server.service;

import com.course.server.domain.Section;
import com.course.server.domain.SectionExample;
import com.course.server.dto.SectionDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.SectionMapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
@Service
public class SectionService {
    @Resource
    private SectionMapper sectionMapper;
    public void list(PageDto pageDto){
        PageHelper.startPage(pageDto.getPage(),pageDto.getSize());
        SectionExample sectionExample = new SectionExample();
        sectionExample.setOrderByClause("sort asc");
        List<Section> sectionList = sectionMapper.selectByExample(sectionExample);
        PageInfo pageInfo = new PageInfo(sectionList);
        pageDto.setTotal(pageInfo.getTotal());

        List<SectionDto> sectionDtoList = CopyUtil.copyList(sectionList, SectionDto.class);
        pageDto.setList(sectionDtoList);
    }

    public void save(SectionDto sectionDto){
        Section section = CopyUtil.copy(sectionDto, Section.class);

        if(StringUtils.isEmpty(sectionDto.getId())){
            this.insert(section);
        }else{
            this.update(section);
        }
    }

    private void insert(Section section){
        Date now = new Date();
        section.setCreatedAt(now);
        section.setUpdatedAt(now);
        section.setId(UuidUtil.getShortUuid());
        sectionMapper.insert(section);
    }
    private void update(Section section){
        section.setUpdatedAt(new Date());
        sectionMapper.updateByPrimaryKey(section);
    }

    public void delete(String id) {
        sectionMapper.deleteByPrimaryKey(id);
    }
}
