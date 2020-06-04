package com.ljh.service.impl;

import com.ljh.dao.GarbageMapper;
import com.ljh.model.Garbage;
import com.ljh.service.GarbageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("garbageService")
public class GarbageServiceImpl implements GarbageService {
    @Autowired
    private GarbageMapper garbageMapper;

    @Override
    public Garbage selectByName(String name) {
        return garbageMapper.selectByName(name);
    }
}
