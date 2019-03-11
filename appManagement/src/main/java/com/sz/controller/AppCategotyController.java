package com.sz.controller;

import com.sz.pojo.AppCategory;
import com.sz.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class AppCategotyController {
    @Autowired
    AppCategoryService appCategoryService;
    //返回数据为json时 需要在requestmapping中加入  produces = "application/json;charset=utf-8"

    @RequestMapping(value="/queryLevelTwoByLevelOne/{levelOneId}",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOneId") Long levelOneId){
        List<AppCategory> levelTwoByLevelOne =  appCategoryService.queryLevelTwo(levelOneId);
        return  levelTwoByLevelOne;
    }

    @RequestMapping(value="/queryLevelThreeByLevelTwo/{levelTwoId}",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<AppCategory> queryLevelThreeByLevelTwo(@PathVariable("levelTwoId") Long levelTwoId){
        List<AppCategory> levelThreeByLevelTwo =  appCategoryService.queryLevelTwo(levelTwoId);
        return  levelThreeByLevelTwo;
    }

}
