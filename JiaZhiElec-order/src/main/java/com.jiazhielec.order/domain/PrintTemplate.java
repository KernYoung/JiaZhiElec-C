package com.jiazhielec.order.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * 打印模板表 print_template
 * 
 * @author Kern
 */
public class PrintTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /**模版名称  */
    private String templateName;

    /**模板Json  */
    private String templateJson;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getTemplateJson() {
        return templateJson;
    }

    public void setTemplateJson(String templateJson) {
        this.templateJson = templateJson;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PrintTemplate{" +
                "id=" + id +
                ", templateName='" + templateName + '\'' +
                ", templateJson='" + templateJson + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
