package com.jiazhielec.order.service.impl;

import com.jiazhielec.order.domain.PrintData;
import com.jiazhielec.order.mapper.PrintDataMapper;
import com.jiazhielec.order.service.PrintDataService;
import org.springframework.beans.factory.annotation.Autowired;

public class PrintDataServiceImpl implements PrintDataService {
    @Autowired
    private PrintDataMapper printDataMapper;
    @Override
    public int insertIntoDataBase(PrintData data) {
        return printDataMapper.insertIntoDataBase(data);
    }
}
