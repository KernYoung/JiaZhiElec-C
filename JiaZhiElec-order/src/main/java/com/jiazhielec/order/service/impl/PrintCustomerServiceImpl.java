package com.jiazhielec.order.service.impl;

import com.jiazhielec.common.constant.UserConstants;
import com.jiazhielec.common.utils.StringUtils;
import com.jiazhielec.order.domain.PrintCustomer;
import com.jiazhielec.order.mapper.PrintCustomerMapper;
import com.jiazhielec.order.service.IPrintCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 打印客户信息 服务层处理
 * 
 * @author Kern
 */
@Service
public class PrintCustomerServiceImpl implements IPrintCustomerService
{
    @Autowired
    private PrintCustomerMapper printCustomerMapper;

    /**
     * 查询打印客户信息集合
     * 
     * @param printMapping 打印客户信息
     * @return 打印客户信息集合
     */
    @Override
    public List<PrintCustomer> selectPrintCustomerList(PrintCustomer printMapping)
    {
        return printCustomerMapper.selectPrintCustomerList(printMapping);
    }

    /**
     * 查询所有打印客户
     * 
     * @return 打印客户列表
     */
    @Override
    public List<PrintCustomer> selectPrintCustomerAll()
    {
        return printCustomerMapper.selectPrintCustomerAll();
    }

    /**
     * 通过打印客户ID查询打印客户信息
     * 
     * @param printMappingId 打印客户ID
     * @return 角色对象信息
     */
    @Override
    public PrintCustomer selectPrintCustomerById(Long printMappingId)
    {
        return printCustomerMapper.selectPrintCustomerById(printMappingId);
    }

//    /**
//     * 根据用户ID获取打印客户选择框列表
//     * 
//     * @param userId 用户ID
//     * @return 选中打印客户ID列表
//     */
//    @Override
//    public List<Long> selectPrintCustomerListByUserId(Long userId)
//    {
//        return printCustomerMapper.selectPrintCustomerListByUserId(userId);
//    }

    /**
     * 校验打印客户是否唯一
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    @Override
    public boolean checkPrintCustomerNameUnique(PrintCustomer printMapping)
    {
        Long printMappingId = StringUtils.isNull(printMapping.getId()) ? -1L : printMapping.getId();
        PrintCustomer info = printCustomerMapper.checkPrintCustomerNameUnique(printMapping.getCustomerName());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != printMappingId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验打印客户编码是否唯一
     *
     * @param printMapping 打印客户信息
     * @return 结果
     */
    @Override
    public boolean checkPrintCustomerCodeUnique(PrintCustomer printMapping)
    {
        Long printMappingId = StringUtils.isNull(printMapping.getId()) ? -1L : printMapping.getId();
        PrintCustomer info = printCustomerMapper.checkPrintCustomerCodeUnique(printMapping.getCustomerCode());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != printMappingId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

//    /**
//     * 通过打印客户ID查询打印客户使用数量
//     *
//     * @param printMappingId 打印客户ID
//     * @return 结果
//     */
//    @Override
//    public int countUserPrintCustomerById(Long printMappingId)
//    {
//        return userPrintCustomerMapper.countUserPrintCustomerById(printMappingId);
//    }

    /**
     * 删除打印客户信息
     * 
     * @param printMappingId 打印客户ID
     * @return 结果
     */
    @Override
    public int deletePrintCustomerById(Long printMappingId)
    {
        //todo 校验客户与模版的打印客户需先删除
        return printCustomerMapper.deletePrintCustomerById(printMappingId);
    }

    /**
     * 批量删除打印客户信息
     * 
     * @param printMappingIds 需要删除的打印客户ID
     * @return 结果
     */
    @Override
    public int deletePrintCustomerByIds(Long[] printMappingIds)
    {
        //todo 校验客户与模版的打印客户需先删除
//        for (Long printMappingId : printMappingIds)
//        {
//            PrintCustomer printMapping = selectPrintCustomerById(printMappingId);
//            if (countUserPrintCustomerById(printMappingId) > 0)
//            {
//                throw new ServiceException(String.format("%1$s已分配,不能删除", printMapping.getMappingName()));
//            }
//        }
        return printCustomerMapper.deletePrintCustomerByIds(printMappingIds);
    }

    /**
     * 新增保存打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    @Override
    public int insertPrintCustomer(PrintCustomer printMapping)
    {
        return printCustomerMapper.insertPrintCustomer(printMapping);
    }

    /**
     * 修改保存打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    @Override
    public int updatePrintCustomer(PrintCustomer printMapping)
    {
        return printCustomerMapper.updatePrintCustomer(printMapping);
    }
}
