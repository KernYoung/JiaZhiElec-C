package com.jiazhielec.order.service;

import java.util.List;
import com.jiazhielec.order.domain.PrintCustomerTemplate;

/**
 * 客户模板映射Service接口
 * 
 * @author ruoyi
 * @date 2023-09-13
 */
public interface IPrintCustomerTemplateService 
{
    /**
     * 查询客户模板映射
     * 
     * @param pingtCustomerTemplateId 客户模板映射主键
     * @return 客户模板映射
     */
    public PrintCustomerTemplate selectPrintCustomerTemplateByPrintCustomerTemplateId(Long pingtCustomerTemplateId);

    /**
     * 查询客户模板映射列表
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 客户模板映射集合
     */
    public List<PrintCustomerTemplate> selectPrintCustomerTemplateList(PrintCustomerTemplate printCustomerTemplate);

    /**
     * 新增客户模板映射
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 结果
     */
    public int insertPrintCustomerTemplate(PrintCustomerTemplate printCustomerTemplate);

    /**
     * 修改客户模板映射
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 结果
     */
    public int updatePrintCustomerTemplate(PrintCustomerTemplate printCustomerTemplate);

    /**
     * 批量删除客户模板映射
     * 
     * @param printCustomerTemplateIds 需要删除的客户模板映射主键集合
     * @return 结果
     */
    public int deletePrintCustomerTemplateByPrintCustomerTemplateIds(Long[] printCustomerTemplateIds);

    /**
     * 删除客户模板映射信息
     * 
     * @param printCustomerTemplateId 客户模板映射主键
     * @return 结果
     */
    public int deletePrintCustomerTemplateByPrintCustomerTemplateId(Long printCustomerTemplateId);

    public boolean checkPrintCustomerTemplateCustomerIdUnique(PrintCustomerTemplate printCustomerTemplate);
}
