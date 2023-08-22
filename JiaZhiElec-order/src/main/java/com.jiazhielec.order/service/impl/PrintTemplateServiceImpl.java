package com.jiazhielec.order.service.impl;

import com.jiazhielec.common.constant.UserConstants;
import com.jiazhielec.common.exception.ServiceException;
import com.jiazhielec.common.utils.StringUtils;
import com.jiazhielec.order.domain.PrintTemplate;
import com.jiazhielec.order.mapper.PrintTemplateMapper;
import com.jiazhielec.order.service.IPrintTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 打印模板信息 服务层处理
 * 
 * @author Kern
 */
@Service
public class PrintTemplateServiceImpl implements IPrintTemplateService
{
    @Autowired
    private PrintTemplateMapper printTemplateMapper;

    /**
     * 查询打印模板信息集合
     * 
     * @param printTemplate 打印模板信息
     * @return 打印模板信息集合
     */
    @Override
    public List<PrintTemplate> selectPrintTemplateList(PrintTemplate printTemplate)
    {
        return printTemplateMapper.selectPrintTemplateList(printTemplate);
    }

    /**
     * 查询所有打印模板
     * 
     * @return 打印模板列表
     */
    @Override
    public List<PrintTemplate> selectPrintTemplateAll()
    {
        return printTemplateMapper.selectPrintTemplateAll();
    }

    /**
     * 通过打印模板ID查询打印模板信息
     * 
     * @param printTemplateId 打印模板ID
     * @return 角色对象信息
     */
    @Override
    public PrintTemplate selectPrintTemplateById(Long printTemplateId)
    {
        return printTemplateMapper.selectPrintTemplateById(printTemplateId);
    }

//    /**
//     * 根据用户ID获取打印模板选择框列表
//     * 
//     * @param userId 用户ID
//     * @return 选中打印模板ID列表
//     */
//    @Override
//    public List<Long> selectPrintTemplateListByUserId(Long userId)
//    {
//        return printTemplateMapper.selectPrintTemplateListByUserId(userId);
//    }

    /**
     * 校验打印模板名称是否唯一
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    @Override
    public boolean checkPrintTemplateNameUnique(PrintTemplate printTemplate)
    {
        Long printTemplateId = StringUtils.isNull(printTemplate.getId()) ? -1L : printTemplate.getId();
        PrintTemplate info = printTemplateMapper.checkPrintTemplateNameUnique(printTemplate.getTemplateName());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != printTemplateId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

//    /**
//     * 校验打印模板编码是否唯一
//     *
//     * @param printTemplate 打印模板信息
//     * @return 结果
//     */
//    @Override
//    public boolean checkPrintTemplateCodeUnique(PrintTemplate printTemplate)
//    {
//        Long printTemplateId = StringUtils.isNull(printTemplate.getId()) ? -1L : printTemplate.getId();
//        PrintTemplate info = printTemplateMapper.checkPrintTemplateCodeUnique(printTemplate.getPrintTemplateCode());
//        if (StringUtils.isNotNull(info) && info.getId().longValue() != printTemplateId.longValue())
//        {
//            return UserConstants.NOT_UNIQUE;
//        }
//        return UserConstants.UNIQUE;
//    }

//    /**
//     * 通过打印模板ID查询打印模板使用数量
//     *
//     * @param printTemplateId 打印模板ID
//     * @return 结果
//     */
//    @Override
//    public int countUserPrintTemplateById(Long printTemplateId)
//    {
//        return userPrintTemplateMapper.countUserPrintTemplateById(printTemplateId);
//    }

    /**
     * 删除打印模板信息
     * 
     * @param printTemplateId 打印模板ID
     * @return 结果
     */
    @Override
    public int deletePrintTemplateById(Long printTemplateId)
    {
        //todo 校验客户与模版的映射关系需先删除
        return printTemplateMapper.deletePrintTemplateById(printTemplateId);
    }

    /**
     * 批量删除打印模板信息
     * 
     * @param printTemplateIds 需要删除的打印模板ID
     * @return 结果
     */
    @Override
    public int deletePrintTemplateByIds(Long[] printTemplateIds)
    {
        //todo 校验客户与模版的映射关系需先删除
//        for (Long printTemplateId : printTemplateIds)
//        {
//            PrintTemplate printTemplate = selectPrintTemplateById(printTemplateId);
//            if (countUserPrintTemplateById(printTemplateId) > 0)
//            {
//                throw new ServiceException(String.format("%1$s已分配,不能删除", printTemplate.getTemplateName()));
//            }
//        }
        return printTemplateMapper.deletePrintTemplateByIds(printTemplateIds);
    }

    /**
     * 新增保存打印模板信息
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    @Override
    public int insertPrintTemplate(PrintTemplate printTemplate)
    {
        return printTemplateMapper.insertPrintTemplate(printTemplate);
    }

    /**
     * 修改保存打印模板信息
     * 
     * @param printTemplate 打印模板信息
     * @return 结果
     */
    @Override
    public int updatePrintTemplate(PrintTemplate printTemplate)
    {
        return printTemplateMapper.updatePrintTemplate(printTemplate);
    }
}
