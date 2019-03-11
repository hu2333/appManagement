package com.sz.controller;

import com.github.pagehelper.PageInfo;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.sz.dto.AppInfoDTO;
import com.sz.pojo.AppCategory;
import com.sz.pojo.AppInfo;
import com.sz.pojo.DataDictionary;
import com.sz.service.AppCategoryService;
import com.sz.service.AppInfoService;
import com.sz.service.DatadDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/app")
public class DveAppController {
    @Autowired
    AppInfoService appInfoService;

    @Autowired
    DatadDictionaryService datadDictionaryService;

    @Autowired
    AppCategoryService appCategoryService;

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") Long id, Model model, HttpSession Session){
        Session.setAttribute("id",id);
        AppInfoDTO appInfoDTO = new AppInfoDTO();
        appInfoDTO.setDevUserId(id);
        appInfoDTO.setPageNum(1);
        PageInfo<AppInfo> pageInfo =appInfoService.query(appInfoDTO);
        model.addAttribute("page",pageInfo);
        List<DataDictionary> appStatus = datadDictionaryService.queryAllAppStatus();
        List<DataDictionary> flatform = datadDictionaryService.queryAllFlatform();
        List<AppCategory>   levelOne = appCategoryService.queryLevelOne();
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("flatform",flatform);
        model.addAttribute("levelOne",levelOne);
        return "app/index";
    }
    @RequestMapping("/query")
    public String query(AppInfoDTO appInfoDTO,Model model,HttpSession Session){
        Object id = Session.getAttribute("id");
        if(id != null ){
            Long userId = (Long) id;
            appInfoDTO.setDevUserId(userId);
            PageInfo<AppInfo> page =appInfoService.query(appInfoDTO);
            List<DataDictionary> appStatus = datadDictionaryService.queryAllAppStatus();
            List<DataDictionary> flatform = datadDictionaryService.queryAllFlatform();
            List<AppCategory>   levelOne = appCategoryService.queryLevelOne();
            model.addAttribute("appStatus",appStatus);
            model.addAttribute("flatform",flatform);
            model.addAttribute("levelOne",levelOne);
            model.addAttribute("page",page);
            model.addAttribute("appInfoDTO",appInfoDTO);
            return "app/index";
        }else {
            return "redirect:/";
        }

    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model){
        List<DataDictionary> appStatus = datadDictionaryService.queryAllAppStatus();
        List<DataDictionary> flatform = datadDictionaryService.queryAllFlatform();
        List<AppCategory>   levelOne = appCategoryService.queryLevelOne();
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("flatform",flatform);
        model.addAttribute("levelOne",levelOne);
        return "app/add";
    }


    @RequestMapping("/add")
    public String add(AppInfo appInfo,HttpSession session){
        Object id = session.getAttribute("id");
        if(id != null ){
            Long userId = (Long) id;
            appInfo.setDevId(userId);
            boolean flag = appInfoService.add(appInfo);
        return "redirect:/app/index/devId/"+userId;
    }else {
        return "redirect:/";
        }
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id")Long id,Model model,HttpSession session){
        Object Id = session.getAttribute("id");
        Long userId = (Long) Id;
        boolean flat = appInfoService.delete(id);
        return "redirect:/app/index/devId/"+userId;
    }


    @RequestMapping("/toUpdata/{id}")
    public String toUpdata(@PathVariable("id")Long id,Model model){
        AppInfo app= appInfoService.queryDetail(id);
        model.addAttribute("app",app);
        List<DataDictionary> appStatus = datadDictionaryService.queryAllAppStatus();
        List<DataDictionary> flatform = datadDictionaryService.queryAllFlatform();
        List<AppCategory>   levelOne = appCategoryService.queryLevelOne();
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("flatform",flatform);
        model.addAttribute("levelOne",levelOne);
        return "app/updata";
    }
    @RequestMapping("/updata/{id}")
    public String updata(@PathVariable("id")Long id,AppInfo appInfo,Model model,HttpSession session){
        Object Id = session.getAttribute("id");
        Long userId = (Long) Id;
        appInfo.setId(id);
        appInfoService.update(appInfo);
        return "redirect:/app/index/devId/"+userId;
    }
    @RequestMapping("/queryAll/{id}")
    public String queryAll(@PathVariable("id")Long id,Model model){
        AppInfo app= appInfoService.queryDetail(id);
        model.addAttribute("app",app);
        List<DataDictionary> appStatus = datadDictionaryService.queryAllAppStatus();
        List<DataDictionary> flatform = datadDictionaryService.queryAllFlatform();
        List<AppCategory>   levelOne = appCategoryService.queryLevelOne();
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("flatform",flatform);
        model.addAttribute("levelOne",levelOne);
        return "app/queryAll";
    }

}
