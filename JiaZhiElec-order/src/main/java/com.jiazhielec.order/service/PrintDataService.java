package com.jiazhielec.order.service;

import com.jiazhielec.order.domain.PrintData;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
/**
 * @author djj-01
 */
public interface PrintDataService {
    /**
     * 存储数据
     */
    public int insertIntoDataBase(PrintData data);
}
