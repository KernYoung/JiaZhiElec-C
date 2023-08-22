package com.jiazhielec.order.domain;

import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

/**
 * 打印客户表 print_customer
 * 
 * @author Kern
 */
public class PrintCustomer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /**客户名称  */
    private String customerName;

    /**客户代码  */
    private String customerCode;

    /** 映射的模板 */
    private String templateMapping;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public String getTemplateMapping() {
        return templateMapping;
    }

    public void setTemplateMapping(String templateMapping) {
        this.templateMapping = templateMapping;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PrintCustomer{" +
                "id=" + id +
                ", customerName='" + customerName + '\'' +
                ", customerCode='" + customerCode + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
