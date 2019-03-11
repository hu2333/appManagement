package com.sz.service;

import com.sz.pojo.DataDictionary;

import java.util.List;

public interface DatadDictionaryService {
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatform();
}
