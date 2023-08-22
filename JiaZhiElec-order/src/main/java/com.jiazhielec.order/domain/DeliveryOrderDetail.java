package com.jiazhielec.order.domain;


import com.jiazhielec.common.core.domain.BaseEntity;
import org.apache.poi.hpsf.Decimal;

import java.math.BigDecimal;


/**
 * 出货单明细表 A8X_SAP_JZ_LIKP
 * 
 * @author Kern
 */
public class DeliveryOrderDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /**交货单号  */
    private String subVBELN;

    /**行项目号  */
    private Integer POSNR;

    /**产品编码  */
    private String MATNR;

    /**客户料号  */
    private String KDMAT;

    /**客户物料描述  */
    private String POSTX;

    /**有效日期  */
    private String CHARG;

    /**数量  */
    private BigDecimal LFIMG;

    /**单位  */
    private String MEINS;

    /**仓位  */
    private String LGOBE;

    /**订单号码  */
    private String BSTKD;

    /**未交量  */
    private BigDecimal WJSL;


    public BigDecimal getLFIMG() {
        return LFIMG;
    }

    public void setLFIMG(BigDecimal LFIMG) {
        this.LFIMG = LFIMG;
    }

    public BigDecimal getWJSL() {
        return WJSL;
    }

    public void setWJSL(BigDecimal WJSL) {
        this.WJSL = WJSL;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSubVBELN() {
        return subVBELN;
    }

    public void setSubVBELN(String subVBELN) {
        this.subVBELN = subVBELN;
    }

    public Integer getPOSNR() {
        return POSNR;
    }

    public void setPOSNR(Integer POSNR) {
        this.POSNR = POSNR;
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

    public String getPOSTX() {
        return POSTX;
    }

    public void setPOSTX(String POSTX) {
        this.POSTX = POSTX;
    }

    public String getCHARG() {
        return CHARG;
    }

    public void setCHARG(String CHARG) {
        this.CHARG = CHARG;
    }


    public String getMEINS() {
        return MEINS;
    }

    public void setMEINS(String MEINS) {
        this.MEINS = MEINS;
    }

    public String getLGOBE() {
        return LGOBE;
    }

    public void setLGOBE(String LGOBE) {
        this.LGOBE = LGOBE;
    }

    public String getBSTKD() {
        return BSTKD;
    }

    public void setBSTKD(String BSTKD) {
        this.BSTKD = BSTKD;
    }

    @Override
    public String toString() {
        return "DeliveryOrderDetail{" +
                "id=" + id +
                ", VBELN='" + subVBELN + '\'' +
                ", POSNR=" + POSNR +
                ", MATNR='" + MATNR + '\'' +
                ", KDMAT='" + KDMAT + '\'' +
                ", POSTX='" + POSTX + '\'' +
                ", CHARG='" + CHARG + '\'' +
                ", LFIMG=" + LFIMG +
                ", MEINS='" + MEINS + '\'' +
                ", LGOBE='" + LGOBE + '\'' +
                ", BSTKD='" + BSTKD + '\'' +
                ", WJSL=" + WJSL +
                '}';
    }
}
