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

    /** 客户id */
    @Excel(name = "客户id")
    private Long customerId;

    /** 模版id */
    @Excel(name = "模版id")
    private Long templateId;

    /** id */
    private Long pingtCustomerTemplateId;

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
    public void setPingtCustomerTemplateId(Long pingtCustomerTemplateId) 
    {
        this.pingtCustomerTemplateId = pingtCustomerTemplateId;
    }

    public Long getPingtCustomerTemplateId() 
    {
        return pingtCustomerTemplateId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customerId", getCustomerId())
            .append("templateId", getTemplateId())
            .append("pingtCustomerTemplateId", getPingtCustomerTemplateId())
            .toString();
    }
}
