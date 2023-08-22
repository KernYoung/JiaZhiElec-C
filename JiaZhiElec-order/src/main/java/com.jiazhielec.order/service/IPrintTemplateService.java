package com.jiazhielec.order.service;

import com.jiazhielec.order.domain.PrintTemplate;

import java.util.List;

/**
 * 打印模板信息 服务层
 * 
 * @author Kern
 */
public interface IPrintTemplateService
{
    /**
     * 查询打印模板信息集合
     * 
     * @param printTemplate 打印模板信息
     * @return 打印模板列表
     */
    public List<PrintTemplate> selectPrintTemplateList(PrintTemplate printTemplate);

    /**
     * 查询所有打印模板
     * 
     * @return 打印模板列表
     */
    public List<PrintTemplate> selectPrintTemplateAll();

    /**
     * 通过打印模板ID查询打印模板信息
     * 
     * @param printTemplateId 打印模板ID
     * @return 角色对象信息
     */
    public PrintTemplate selectPrintTemplateById(Long printTemplateId);

//    /**
//     * 根据用户ID获取打印模板选择框列表
//     *
//     * @param userId 用户ID
//     * @return 选中打印模板ID列表
//     */
//    public List<Long> selectPrintTemplateListByUserId(Long userId);

    /**
     * 校验打印模板名称
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    public boolean checkPrintTemplateNameUnique(PrintTemplate printTemplate);

//    /**
//     * 校验打印模板编码
//     *
//     * @param printTemplate 打印模板信息
//     * @return 结果
//     */
//    public boolean checkPrintTemplateCodeUnique(PrintTemplate printTemplate);

//    /**
//     * 通过打印模板ID查询打印模板使用数量
//     *
//     * @param printTemplateId 打印模板ID
//     * @return 结果
//     */
//    public int countUserPrintTemplateById(Long printTemplateId);

    /**
     * 删除打印模板信息
     * 
     * @param printTemplateId 打印模板ID
     * @return 结果
     */
    public int deletePrintTemplateById(Long printTemplateId);

    /**
     * 批量删除打印模板信息
     * 
     * @param printTemplateIds 需要删除的打印模板ID
     * @return 结果
     */
    public int deletePrintTemplateByIds(Long[] printTemplateIds);

    /**
     * 新增保存打印模板信息
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    public int insertPrintTemplate(PrintTemplate printTemplate);

    /**
     * 修改保存打印模板信息
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    public int updatePrintTemplate(PrintTemplate printTemplate);
}
