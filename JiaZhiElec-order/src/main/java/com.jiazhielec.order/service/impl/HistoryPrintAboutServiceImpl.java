package com.jiazhielec.order.service.impl;

import com.jiazhielec.order.domain.HistoryPrintAbout;
import com.jiazhielec.order.mapper.HistoryPrintAboutMapper;
import com.jiazhielec.order.service.HistoryPrintAboutService;
import org.springframework.beans.factory.annotation.Autowired;

public class HistoryPrintAboutServiceImpl implements HistoryPrintAboutService {
    @Autowired
    private HistoryPrintAboutMapper historyPrintAboutMapper;
    @Override
    public int insertIntoDataBase(HistoryPrintAbout historyPrintAbout) {
        return historyPrintAboutMapper.insertIntoDataBase(historyPrintAbout);
    }
}
