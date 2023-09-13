package com.jiazhielec.order.domain;

import com.jiazhielec.common.annotation.Excel;
import com.jiazhielec.common.core.domain.BaseEntity;

/**
 * 打印模板表 print_template
 * 
 * @author Kern
 */
public class PrintTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    @Excel(name = "ID", cellType = Excel.ColumnType.NUMERIC)
    private Long id;

    /**模版名称  */
    @Excel(name = "模版名称")
    private String templateName;

    /**模板Json  */
    @Excel(name = "模板Json")
    private String templateJson;

    /** 排序规则（ 升序:id,数量;降序:客户名称 ） */
    @Excel(name = "排序规则")
    private String dataCollation;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public String getDataCollation() {
        return dataCollation;
    }

    public void setDataCollation(String dataCollation) {
        this.dataCollation = dataCollation;
    }

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
                ", dataCollation='" + dataCollation + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
