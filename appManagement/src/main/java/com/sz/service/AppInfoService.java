package com.sz.service;

import com.github.pagehelper.PageInfo;
import com.sz.dto.AppInfoDTO;
import com.sz.pojo.AppInfo;
import com.sz.pojo.DataDictionary;

import java.util.List;

public interface AppInfoService {
    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo);

    boolean delete(Long id);

    AppInfo queryDetail(Long id);

    void update(AppInfo appInfo);
}
