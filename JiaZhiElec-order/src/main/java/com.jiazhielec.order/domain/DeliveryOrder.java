package com.jiazhielec.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.core.domain.BaseEntity;
import java.util.Date;
import java.util.List;

/**
 * 出货单主表 A8X_SAP_JZ_LIKP
 * 
 * @author Kern
 */
public class DeliveryOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;

    /**交货单号  */
    private String VBELN;

    /**公司代码  */
    private String WERKS;

    /**客户代码  */
    private String KUNNR;

    /**客户名称  */
    private String NAME1;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

    /** 交货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deliveryDate;

    
    /** 出货单明细 */
    private List<DeliveryOrderDetail> deliveryOrderDetails;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVBELN() {
        return VBELN;
    }

    public void setVBELN(String VBELN) {
        this.VBELN = VBELN;
    }

    public String getWERKS() {
        return WERKS;
    }

    public void setWERKS(String WERKS) {
        this.WERKS = WERKS;
    }

    public String getKUNNR() {
        return KUNNR;
    }

    public void setKUNNR(String KUNNR) {
        this.KUNNR = KUNNR;
    }

    public String getNAME1() {
        return NAME1;
    }

    public void setNAME1(String NAME1) {
        this.NAME1 = NAME1;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public List<DeliveryOrderDetail> getDeliveryOrderDetails() {
        return deliveryOrderDetails;
    }

    public void setDeliveryOrderDetails(List<DeliveryOrderDetail> deliveryOrderDetails) {
        this.deliveryOrderDetails = deliveryOrderDetails;
    }

    @Override
    public String toString() {
        return "DeliveryOrder{" +
                "id=" + id +
                ", VBELN='" + VBELN + '\'' +
                ", WERKS='" + WERKS + '\'' +
                ", KUNNR='" + KUNNR + '\'' +
                ", NAME1='" + NAME1 + '\'' +
                ", createTime=" + createTime +
                ", deliveryDate=" + deliveryDate +
                ", deliveryOrderDetails=" + deliveryOrderDetails +
                '}';
    }
}
