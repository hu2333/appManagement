package com.sz.service.serviceImpl;

import com.sz.controller.DevUserController;
import com.sz.mapper.DevUserMapper;
import com.sz.pojo.DevUser;
import com.sz.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {
    @Autowired
    DevUserMapper devUserMapper;

    @Override
    public DevUser login(DevUser devUser) {
        List<DevUser> users = devUserMapper.queryByNamePassword(devUser);
        if(users != null && users.size()==1){
            return users.get(0);
        }else {
            return null;
        }
    }
}
