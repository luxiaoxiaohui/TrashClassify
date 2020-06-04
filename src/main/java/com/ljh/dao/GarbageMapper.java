package com.ljh.dao;

import com.ljh.model.Garbage;

public interface GarbageMapper {
    //public Garbage selectByName();
    Garbage selectByName(String name);
}
