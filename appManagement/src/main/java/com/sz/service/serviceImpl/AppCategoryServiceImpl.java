package com.sz.service.serviceImpl;

import com.sz.mapper.AppCategoryMapper;
import com.sz.pojo.AppCategory;
import com.sz.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("appCategoryService ")
public class AppCategoryServiceImpl implements AppCategoryService {
  @Autowired
    AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryLevelOne() {
        List<AppCategory>   levelOne = appCategoryMapper.queryLevelOne();
        return levelOne;
    }

    @Override
    public List<AppCategory> queryLevelTwo(Long levelOneId) {
        List<AppCategory>   levelTwo = appCategoryMapper.queryLevelTwo(levelOneId);
        return levelTwo;
    }

}



