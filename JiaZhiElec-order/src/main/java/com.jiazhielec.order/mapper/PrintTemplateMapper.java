package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.PrintTemplate;

import java.util.List;

/**
 * 打印模版 数据层
 * 
 * @author Kern
 */
public interface PrintTemplateMapper
{
    /**
     * 查询打印模版
     * 
     * @param printTemplate 打印模版
     * @return 打印模版数据集合
     */
    public List<PrintTemplate> selectPrintTemplateList(PrintTemplate printTemplate);

    /**
     * 查询所有模板
     * 
     * @return 模板列表
     */
    public List<PrintTemplate> selectPrintTemplateAll();

    /**
     * 通过模板ID查询模板信息
     * 
     * @param printTemplateId 模版id
     * @return 模板对象信息
     */
    public PrintTemplate selectPrintTemplateById(Long printTemplateId);


    /**
     * 删除模板信息
     * 
     * @param printTemplateId 模板ID
     * @return 结果
     */
    public int deletePrintTemplateById(Long printTemplateId);

    /**
     * 批量删除模板信息
     * 
     * @param printTemplateIds 需要删除的模板ID
     * @return 结果
     */
    public int deletePrintTemplateByIds(Long[] printTemplateIds);

    /**
     * 修改模板信息
     * 
     * @param printTemplate 模板信息
     * @return 结果
     */
    public int updatePrintTemplate(PrintTemplate printTemplate);

    /**
     * 新增模板信息
     * 
     * @param printTemplate 模板信息
     * @return 结果
     */
    public int insertPrintTemplate(PrintTemplate printTemplate);

    /**
     * 校验模版名称
     * 
     * @param templateName 岗位名称
     * @return 结果
     */
    public PrintTemplate checkPrintTemplateNameUnique(String templateName);

}
