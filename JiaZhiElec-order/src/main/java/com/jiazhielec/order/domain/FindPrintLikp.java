package com.jiazhielec.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.core.domain.BaseEntity;

import java.util.Date;

public class FindPrintLikp extends BaseEntity {

    private static final long serialVersionUID = 1L;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date start;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date end ;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date delDateStart;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date delDateEnd ;
    private String printNo;
    private String vbeln ;
    private String kdmat;
    private String matnr ;
    private String bstkd ;

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Date getDelDateStart() {
        return delDateStart;
    }

    public void setDelDateStart(Date delDateStart) {
        this.delDateStart = delDateStart;
    }

    public Date getDelDateEnd() {
        return delDateEnd;
    }

    public void setDelDateEnd(Date delDateEnd) {
        this.delDateEnd = delDateEnd;
    }

    public String getPrintNo() {
        return printNo;
    }

    public void setPrintNo(String printNo) {
        this.printNo = printNo;
    }

    public String getVbeln() {
        return vbeln;
    }

    public void setVbeln(String vbeln) {
        this.vbeln = vbeln;
    }

    public String getKdmat() {
        return kdmat;
    }

    public void setKdmat(String kdmat) {
        this.kdmat = kdmat;
    }

    public String getMatnr() {
        return matnr;
    }

    public void setMatnr(String matnr) {
        this.matnr = matnr;
    }

    public String getBstkd() {
        return bstkd;
    }

    public void setBstkd(String bstkd) {
        this.bstkd = bstkd;
    }
}
