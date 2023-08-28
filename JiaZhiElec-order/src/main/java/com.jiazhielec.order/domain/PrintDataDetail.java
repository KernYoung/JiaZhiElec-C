package com.jiazhielec.order.domain;



import java.math.BigDecimal;


/**
 * 打印数据明细表
 * 
 * @author Kern
 */
public class PrintDataDetail
{

    /** ID */
    private Integer id;

    /**订单号码  */
    private String BSTKD;

    /**行项目号  */
    private Integer POSNR;

//    /**交货单号  */
//    private String subVBELN;

    /**客户料号  */
    private String KDMAT;

    /**数量  */
    private BigDecimal LFIMG;

    /**单位  */
    private String MEINS;

    /**二维码  */
    private String qrcode;

//    /**产品编码  */
//    private String MATNR;

//    /**客户物料描述  */
//    private String POSTX;

//    /**有效日期  */
//    private String CHARG;

//    /**仓位  */
//    private String LGOBE;
//
//    /**未交量  */
//    private BigDecimal WJSL;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBSTKD() {
        return BSTKD;
    }

    public void setBSTKD(String BSTKD) {
        this.BSTKD = BSTKD;
    }

    public Integer getPOSNR() {
        return POSNR;
    }

    public void setPOSNR(Integer POSNR) {
        this.POSNR = POSNR;
    }

    public String getKDMAT() {
        return KDMAT;
    }

    public void setKDMAT(String KDMAT) {
        this.KDMAT = KDMAT;
    }

    public BigDecimal getLFIMG() {
        return LFIMG;
    }

    public void setLFIMG(BigDecimal LFIMG) {
        this.LFIMG = LFIMG;
    }

    public String getMEINS() {
        return MEINS;
    }

    public void setMEINS(String MEINS) {
        this.MEINS = MEINS;
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }
}
