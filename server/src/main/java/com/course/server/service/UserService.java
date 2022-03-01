package com.course.server.service;

import com.course.server.domain.User;
import com.course.server.domain.UserExample;
import com.course.server.dto.UserDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.UserMapper;
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
@Service
public class UserService {
    @Resource
    private UserMapper userMapper;
    public void list(PageDto pageDto){
        PageHelper.startPage(pageDto.getPage(),pageDto.getSize());
        UserExample userExample = new UserExample();
        List<User> userList = userMapper.selectByExample(userExample);
        PageInfo pageInfo = new PageInfo(userList);
        pageDto.setTotal(pageInfo.getTotal());

        List<UserDto> userDtoList = CopyUtil.copyList(userList, UserDto.class);
        pageDto.setList(userDtoList);
    }

    public void save(UserDto userDto){
        User user = CopyUtil.copy(userDto, User.class);

        if(StringUtils.isEmpty(userDto.getId())){
            this.insert(user);
        }else{
            this.update(user);
        }
    }

    private void insert(User user){
        user.setId(UuidUtil.getShortUuid());
        userMapper.insert(user);
    }
    private void update(User user){
        userMapper.updateByPrimaryKey(user);
    }

    public void delete(String id) {
        userMapper.deleteByPrimaryKey(id);
    }
}
