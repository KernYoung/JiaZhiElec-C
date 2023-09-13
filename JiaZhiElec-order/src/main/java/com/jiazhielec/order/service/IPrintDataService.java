package com.jiazhielec.order.service;

import com.jiazhielec.order.domain.PrintData;

/**
 * @author djj-01
 */
public interface IPrintDataService {
    /**
     * 存储数据
     */
    public int insertIntoDataBase(PrintData data);
}
