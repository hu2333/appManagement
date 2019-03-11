package com.sz.service;

import com.sz.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {

    List<AppCategory> queryLevelOne();

    List<AppCategory> queryLevelTwo(Long levelOneId);

}
