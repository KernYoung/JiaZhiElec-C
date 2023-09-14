package com.jiazhielec.order.domain;



import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;


/**
 * 打印数据明细表
 * 
 * @author Kern
 */
public class PrintDataDetail extends BaseEntity
{

    /** ID */
    private Integer id;

    /**订单号码  */
    private String bstkd;

    /**行项目号  */
    private Integer posnr;

//    /**交货单号  */
    private String subVBELN;

    /**客户料号  */
    private String kdmat;

    /**数量  */
    private BigDecimal lfimg;

    /**单位  */
    private String meins;

    /**二维码  */
    private String qrcode;

    /**产品编码  */
    private String matnr;

    /**客户物料描述  */
    private String postx;

    /**有效日期  */
    private String charg;

    /**仓位  */
    private String lgobe;

    /**未交量  */
    private BigDecimal wjsl;

    /**
     * 品名
     * @return
     */
    private String name;

    /**
     * 序号
     * @return
     */
    private Integer item;

    /**
     * 备注
     * @return
     */
    private String remark;

    /**
     * 箱数
     */
    private Integer cartons;

    /**
     * 有效日期
     * @return
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date effectiveDate;

    /**
     * 单号
     * @return
     */
    private String printNumber;

    /**公司代码  */
    @Excel(name = "公司代码")
    private String WERKS;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getBstkd() {
        return bstkd;
    }

    public void setBstkd(String bstkd) {
        this.bstkd = bstkd;
    }

    public Integer getPosnr() {
        return posnr;
    }

    public void setPosnr(Integer posnr) {
        this.posnr = posnr;
    }

    public String getSubVBELN() {
        return subVBELN;
    }

    public void setSubVBELN(String subVBELN) {
        this.subVBELN = subVBELN;
    }

    public String getKdmat() {
        return kdmat;
    }

    public void setKdmat(String kdmat) {
        this.kdmat = kdmat;
    }

    public BigDecimal getLfimg() {
        return lfimg;
    }

    public void setLfimg(BigDecimal lfimg) {
        this.lfimg = lfimg;
    }

    public String getMeins() {
        return meins;
    }

    public void setMeins(String meins) {
        this.meins = meins;
    }

    public String getMatnr() {
        return matnr;
    }

    public void setMatnr(String matnr) {
        this.matnr = matnr;
    }

    public String getPostx() {
        return postx;
    }

    public void setPostx(String postx) {
        this.postx = postx;
    }

    public String getCharg() {
        return charg;
    }

    public void setCharg(String charg) {
        this.charg = charg;
    }

    public String getLgobe() {
        return lgobe;
    }

    public void setLgobe(String lgobe) {
        this.lgobe = lgobe;
    }

    public BigDecimal getWjsl() {
        return wjsl;
    }

    public void setWjsl(BigDecimal wjsl) {
        this.wjsl = wjsl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getItem() {
        return item;
    }

    public void setItem(Integer item) {
        this.item = item;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getCartons() {
        return cartons;
    }

    public void setCartons(Integer cartons) {
        this.cartons = cartons;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }

    public String getPrintNumber() {
        return printNumber;
    }

    public void setPrintNumber(String printNumber) {
        this.printNumber = printNumber;
    }

    public String getWERKS() {
        return WERKS;
    }

    public void setWERKS(String WERKS) {
        this.WERKS = WERKS;
    }
}
