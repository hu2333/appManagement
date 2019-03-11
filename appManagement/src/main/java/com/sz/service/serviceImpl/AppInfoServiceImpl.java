package com.sz.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sz.constant.CommonCodeConstant;
import com.sz.dto.AppInfoDTO;
import com.sz.mapper.AppCategoryMapper;
import com.sz.mapper.AppInfoMapper;
import com.sz.mapper.DataDictionaryMapper;
import com.sz.pojo.AppInfo;
import com.sz.pojo.DataDictionary;
import com.sz.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    AppInfoMapper appInfoMapper;

    @Autowired
    AppCategoryMapper appCategoryMapper;

    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {
        PageHelper.startPage(appInfoDTO.getPageNum(),CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> list= appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public boolean add(AppInfo appInfo) {
        appInfo.setCreationDate(new Date());
        int row = appInfoMapper.add(appInfo);
        return row == 1 ? true : false;
    }

    @Override
    public boolean delete(Long id) {
        if (id!=null){
            int row = appInfoMapper.delete(id);
            return row == 1 ? true : false;
        }else {
            return  false;
        }

    }

    @Override
    public AppInfo queryDetail(Long id) {
        AppInfo app= appInfoMapper.queryDetail(id);
        return app;
    }

    @Override
    public void update(AppInfo appInfo) {
        appInfoMapper.updata(appInfo);
    }
}
