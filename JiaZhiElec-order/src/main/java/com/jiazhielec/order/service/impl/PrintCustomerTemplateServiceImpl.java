package com.jiazhielec.order.service.impl;

import java.util.List;

import com.jiazhielec.common.constant.UserConstants;
import com.jiazhielec.common.utils.StringUtils;
import com.jiazhielec.order.domain.PrintTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiazhielec.order.mapper.PrintCustomerTemplateMapper;
import com.jiazhielec.order.domain.PrintCustomerTemplate;
import com.jiazhielec.order.service.IPrintCustomerTemplateService;

/**
 * 客户模板映射Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-09-13
 */
@Service
public class PrintCustomerTemplateServiceImpl implements IPrintCustomerTemplateService 
{
    @Autowired
    private PrintCustomerTemplateMapper printCustomerTemplateMapper;

    /**
     * 查询客户模板映射
     * 
     * @param pingtCustomerTemplateId 客户模板映射主键
     * @return 客户模板映射
     */
    @Override
    public PrintCustomerTemplate selectPrintCustomerTemplateByPingtCustomerTemplateId(Long pingtCustomerTemplateId)
    {
        return printCustomerTemplateMapper.selectPrintCustomerTemplateByPingtCustomerTemplateId(pingtCustomerTemplateId);
    }

    /**
     * 查询客户模板映射列表
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 客户模板映射
     */
    @Override
    public List<PrintCustomerTemplate> selectPrintCustomerTemplateList(PrintCustomerTemplate printCustomerTemplate)
    {
        return printCustomerTemplateMapper.selectPrintCustomerTemplateList(printCustomerTemplate);
    }

    /**
     * 新增客户模板映射
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 结果
     */
    @Override
    public int insertPrintCustomerTemplate(PrintCustomerTemplate printCustomerTemplate)
    {
        return printCustomerTemplateMapper.insertPrintCustomerTemplate(printCustomerTemplate);
    }

    /**
     * 修改客户模板映射
     * 
     * @param printCustomerTemplate 客户模板映射
     * @return 结果
     */
    @Override
    public int updatePrintCustomerTemplate(PrintCustomerTemplate printCustomerTemplate)
    {
        return printCustomerTemplateMapper.updatePrintCustomerTemplate(printCustomerTemplate);
    }

    /**
     * 批量删除客户模板映射
     * 
     * @param printCustomerTemplateIds 需要删除的客户模板映射主键
     * @return 结果
     */
    @Override
    public int deletePrintCustomerTemplateByPingtCustomerTemplateIds(Long[] printCustomerTemplateIds)
    {
        return printCustomerTemplateMapper.deletePrintCustomerTemplateByPingtCustomerTemplateIds(printCustomerTemplateIds);
    }

    /**
     * 删除客户模板映射信息
     * 
     * @param printCustomerTemplateId 客户模板映射主键
     * @return 结果
     */
    @Override
    public int deletePrintCustomerTemplateByPingtCustomerTemplateId(Long printCustomerTemplateId)
    {
        return printCustomerTemplateMapper.deletePrintCustomerTemplateByPingtCustomerTemplateId(printCustomerTemplateId);
    }

    @Override
    public boolean checkPrintCustomerTemplateCustomerIdUnique(PrintCustomerTemplate printCustomerTemplate) {
        Long printCustomerTemplateId = StringUtils.isNull(printCustomerTemplate.getPrintCustomerTemplateId()) ? -1L : printCustomerTemplate.getPrintCustomerTemplateId();
        PrintCustomerTemplate info = printCustomerTemplateMapper.checkPrintCustomerTemplateCustomerIdUnique(printCustomerTemplate);
        if (StringUtils.isNotNull(info) && info.getPrintCustomerTemplateId().longValue() != printCustomerTemplateId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
