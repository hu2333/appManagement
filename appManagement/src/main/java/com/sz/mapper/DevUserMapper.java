package com.sz.mapper;

import com.sz.pojo.DevUser;

import java.util.List;

public interface DevUserMapper {

    List<DevUser> queryByNamePassword(DevUser devUser);
}