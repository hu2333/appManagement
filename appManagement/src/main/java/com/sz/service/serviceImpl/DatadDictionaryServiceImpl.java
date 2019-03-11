package com.sz.service.serviceImpl;

import com.sz.mapper.DataDictionaryMapper;
import com.sz.pojo.DataDictionary;
import com.sz.service.DatadDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("datadDictionaryService")
public class DatadDictionaryServiceImpl implements DatadDictionaryService {

    @Autowired
    DataDictionaryMapper dataDictionaryMapper;

    @Override
    public List<DataDictionary> queryAllFlatform() {
        List<DataDictionary>  flatForm = dataDictionaryMapper.queryAllFlatForm();
        return flatForm;
    }

    @Override
    public List<DataDictionary> queryAllAppStatus() {
        List<DataDictionary>  appStatus = dataDictionaryMapper.queryAllAppStatus();
        return appStatus;
    }
}
