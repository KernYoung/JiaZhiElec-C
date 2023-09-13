package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.PrintDataDetail;

import java.util.List;

public interface PrintDataDetailMapper {
    int insertIntoDataBase(PrintDataDetail data);

    List<PrintDataDetail> selectPrintDataDetailList(PrintDataDetail printData);
}
