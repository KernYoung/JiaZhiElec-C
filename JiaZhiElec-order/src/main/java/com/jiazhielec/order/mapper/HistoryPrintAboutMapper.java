package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.HistoryPrintAbout;
import org.apache.ibatis.annotations.Param;

public interface HistoryPrintAboutMapper {
    public int insertIntoDataBase(HistoryPrintAbout historyPrintAbout);

    public HistoryPrintAbout selectHistoryPrintBykey(@Param("key")String key);

    public int updateIntoDataBase(HistoryPrintAbout historyPrintAbout);
}
