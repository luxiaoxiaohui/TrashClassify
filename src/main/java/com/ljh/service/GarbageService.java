package com.ljh.service;

import com.ljh.model.Garbage;


public interface GarbageService {
    Garbage selectByName(String name);
}
