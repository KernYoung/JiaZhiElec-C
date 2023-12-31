package com.jiazhielec.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * 打印数据表
 * 
 * @author Kern
 */
public class PrintData extends BaseEntity
{
    /**
     * id
     */
    private Integer id;
    /**交货单号  */
    private String vbeln;

    /**公司代码  */
    private String werks;

    /**客户代码  */
    private String kunnr;

    /**客户名称  */
    private String name1;

    /** 交货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deliveryDate;

    /**
     * 打印日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date printDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

    /**订单号码  */
    private String BSTKD;

    /**
     * 模板号
     */
    private String template;

    /**单据号  */
    private String printNumber;

    /**产品编码  */
    private String MATNR;

    /**客户料号  */
    private String KDMAT;

    /** 出货单明细 */
    private List<PrintDataDetail> table;

    private String deliveryOrderDetailList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVbeln() {
        return vbeln;
    }

    public void setVbeln(String vbeln) {
        this.vbeln = vbeln;
    }

    public String getWerks() {
        return werks;
    }

    public void setWerks(String werks) {
        this.werks = werks;
    }

    public String getKunnr() {
        return kunnr;
    }

    public void setKunnr(String kunnr) {
        this.kunnr = kunnr;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public Date getPrintDate() {
        return printDate;
    }

    public void setPrintDate(Date printDate) {
        this.printDate = printDate;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
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

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDeliveryOrderDetailList() {
        return deliveryOrderDetailList;
    }

    public void setDeliveryOrderDetailList(String deliveryOrderDetailList) {
        this.deliveryOrderDetailList = deliveryOrderDetailList;
    }

    public String getBSTKD() {
        return BSTKD;
    }

    public void setBSTKD(String BSTKD) {
        this.BSTKD = BSTKD;
    }

    public String getMATNR() {
        return MATNR;
    }

    public void setMATNR(String MATNR) {
        this.MATNR = MATNR;
    }

    public String getKDMAT() {
        return KDMAT;
    }

    public void setKDMAT(String KDMAT) {
        this.KDMAT = KDMAT;
    }
}
