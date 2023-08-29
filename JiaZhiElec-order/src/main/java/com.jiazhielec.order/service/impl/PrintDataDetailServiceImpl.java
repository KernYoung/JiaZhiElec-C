package com.jiazhielec.order.service.impl;

import com.jiazhielec.order.domain.PrintDataDetail;
import com.jiazhielec.order.mapper.PrintDataDetailMapper;
import com.jiazhielec.order.service.PrintDataDetailService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;

public class PrintDataDetailServiceImpl implements PrintDataDetailService {
    @Autowired
    private PrintDataDetailMapper printDataDetailMapper;
    @Override
    public int insertIntoDataBase(PrintDataDetail data) {
        return printDataDetailMapper.insertIntoDataBase(data);
    }
}
