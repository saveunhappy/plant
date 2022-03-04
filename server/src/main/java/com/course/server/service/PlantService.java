package com.course.server.service;

import com.course.server.domain.Plant;
import com.course.server.domain.PlantExample;
import com.course.server.dto.PlantDto;
import com.course.server.dto.PageDto;
import com.course.server.dto.PlantPageDto;
import com.course.server.enums.PlantStatusEnum;
import com.course.server.mapper.PlantMapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Date;
@Service
public class PlantService {
    @Resource
    private PlantMapper plantMapper;
    public void list(PlantPageDto plantPageDto){
        PageHelper.startPage(plantPageDto.getPage(),plantPageDto.getSize());
        PlantExample plantExample = new PlantExample();
        PlantExample.Criteria criteria = plantExample.createCriteria();
        if(!StringUtils.isEmpty(plantPageDto.getStatus())){
            criteria.andStatusEqualTo(plantPageDto.getStatus());
        }
        List<Plant> plantList = plantMapper.selectByExample(plantExample);
        PageInfo pageInfo = new PageInfo(plantList);
        plantPageDto.setTotal(pageInfo.getTotal());

        List<PlantDto> plantDtoList = CopyUtil.copyList(plantList, PlantDto.class);
        plantPageDto.setList(plantDtoList);
    }

    public void save(PlantDto plantDto){
        Plant plant = CopyUtil.copy(plantDto, Plant.class);

        if(StringUtils.isEmpty(plantDto.getId())){
            this.insert(plant);
        }else{
            this.update(plant);
        }
    }

    public Plant findOne(String id){
        return plantMapper.selectByPrimaryKey(id);
    }

    private void insert(Plant plant){
        Date now = new Date();
        plant.setCreatedAt(now);
        plant.setUpdatedAt(now);
        plant.setId(UuidUtil.getShortUuid());
        plantMapper.insert(plant);
    }
    private void update(Plant plant){
        plant.setUpdatedAt(new Date());
        plantMapper.updateByPrimaryKey(plant);
    }

    public void delete(String id) {
        plantMapper.deleteByPrimaryKey(id);
    }

    public void listNew(PageDto pageDto){
        PageHelper.startPage(pageDto.getPage(),pageDto.getSize());
        PlantExample plantExample = new PlantExample();
        plantExample.createCriteria().andStatusEqualTo(PlantStatusEnum.NO.getCode());
        plantExample.setOrderByClause("created_at desc");
        List<Plant> plantList = plantMapper.selectByExample(plantExample);
        PageInfo pageInfo = new PageInfo(plantList);
        pageDto.setTotal(pageInfo.getTotal());

        List<PlantDto> plantDtoList = CopyUtil.copyList(plantList, PlantDto.class);
        pageDto.setList(plantDtoList);
    }

    public PlantDto findPlant(String id){
        Plant plant = plantMapper.selectByPrimaryKey(id);
        if(plant == null || !PlantStatusEnum.NO.getCode().equals(plant.getStatus())){
            return null;
        }
        return CopyUtil.copy(plant,PlantDto.class);
    }
}
