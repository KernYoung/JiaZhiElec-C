package com.jiazhielec.order.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

/**
 * 客户模板映射对象 print_customer_template
 * 
 * @author ruoyi
 * @date 2023-09-13
 */
public class PrintCustomerTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long printCustomerTemplateId;

    /** 客户id */
    @Excel(name = "客户id")
    private Long customerId;

    @Excel(name = "客户名称")
    private String customerName;


    @Excel(name = "客户编码")
    private String customerCode;

    /** 模版id */
    @Excel(name = "模版id")
    private Long templateId;

    @Excel(name = "模版名称")
    private String templateName;

    public Long getPrintCustomerTemplateId() {
        return printCustomerTemplateId;
    }

    public void setPrintCustomerTemplateId(Long printCustomerTemplateId) {
        this.printCustomerTemplateId = printCustomerTemplateId;
    }

    public void setCustomerId(Long customerId)
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setTemplateId(Long templateId) 
    {
        this.templateId = templateId;
    }

    public Long getTemplateId() 
    {
        return templateId;
    }


    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customerId", getCustomerId())
            .append("customerName", getCustomerName())
            .append("customerCode", getCustomerCode())
            .append("templateId", getTemplateId())
            .append("templateName", getTemplateName())
            .append("printCustomerTemplateId", getPrintCustomerTemplateId())
            .toString();
    }
}
