package com.sz.mapper;

import com.sz.dto.AppInfoDTO;
import com.sz.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {
    List<AppInfo> queryBydevId(@Param("devUserId") Long id);

    List<AppInfo> query(AppInfoDTO appInfoDTO);

    int add(AppInfo appInfo);

    int delete(Long id);

    AppInfo queryDetail(Long id);

    void updata(AppInfo appInfo);
}