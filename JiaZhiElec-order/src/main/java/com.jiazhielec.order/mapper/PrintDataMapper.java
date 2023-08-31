package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.FindPrintLikp;
import com.jiazhielec.order.domain.PrintData;

import java.util.List;

public interface PrintDataMapper {
    public int insertIntoDataBase(PrintData data);

    public List<PrintData> selectPrintDataList(FindPrintLikp findPrintLikp);

    List<PrintData> selectPrintDataListByPrintData(PrintData printData);
}
