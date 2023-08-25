package com.jiazhielec.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * 打印数据表
 * 
 * @author Kern
 */
public class PrintData
{
//    /**交货单号  */
//    private String VBELN;
//
//    /**公司代码  */
//    private String WERKS;

//    /**客户代码  */
//    private String KUNNR;

    /**客户名称  */
    private String NAME1;

    /** 交货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deliveryDate;

    /**单据号  */
    private String printNumber;

    /** 出货单明细 */
    private List<PrintDataDetail> table;

    public String getNAME1() {
        return NAME1;
    }

    public void setNAME1(String NAME1) {
        this.NAME1 = NAME1;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getPrintNumber() {
        return printNumber;
    }

    public void setPrintNumber(String printNumber) {
        this.printNumber = printNumber;
    }

    public List<PrintDataDetail> getTable() {
        return table;
    }

    public void setTable(List<PrintDataDetail> table) {
        this.table = table;
    }
}
