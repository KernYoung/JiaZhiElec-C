package com.jiazhielec.order.service.impl;

import com.jiazhielec.order.domain.PrintDataDetail;
import com.jiazhielec.order.mapper.PrintDataDetailMapper;
import com.jiazhielec.order.service.IPrintDataDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IPrintDataDetailServiceImpl implements IPrintDataDetailService {
    @Autowired
    private PrintDataDetailMapper printDataDetailMapper;
    @Override
    public int insertIntoDataBase(PrintDataDetail data) {
        return printDataDetailMapper.insertIntoDataBase(data);
    }
}
