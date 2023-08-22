package com.jiazhielec.order.service;

import com.jiazhielec.order.domain.PrintCustomer;

import java.util.List;

/**
 * 打印客户信息 服务层
 * 
 * @author Kern
 */
public interface IPrintCustomerService
{
    /**
     * 查询打印客户信息集合
     * 
     * @param printMapping 打印客户信息
     * @return 打印客户列表
     */
    public List<PrintCustomer> selectPrintCustomerList(PrintCustomer printMapping);

    /**
     * 查询所有打印客户
     * 
     * @return 打印客户列表
     */
    public List<PrintCustomer> selectPrintCustomerAll();

    /**
     * 通过打印客户ID查询打印客户信息
     * 
     * @param printMappingId 打印客户ID
     * @return 角色对象信息
     */
    public PrintCustomer selectPrintCustomerById(Long printMappingId);

//    /**
//     * 根据用户ID获取打印客户选择框列表
//     *
//     * @param userId 用户ID
//     * @return 选中打印客户ID列表
//     */
//    public List<Long> selectPrintCustomerListByUserId(Long userId);

    /**
     * 校验打印客户名称
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public boolean checkPrintCustomerNameUnique(PrintCustomer printMapping);

    /**
     * 校验打印客户编码
     *
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public boolean checkPrintCustomerCodeUnique(PrintCustomer printMapping);

//    /**
//     * 通过打印客户ID查询打印客户使用数量
//     *
//     * @param printMappingId 打印客户ID
//     * @return 结果
//     */
//    public int countUserPrintCustomerById(Long printMappingId);

    /**
     * 删除打印客户信息
     * 
     * @param printMappingId 打印客户ID
     * @return 结果
     */
    public int deletePrintCustomerById(Long printMappingId);

    /**
     * 批量删除打印客户信息
     * 
     * @param printMappingIds 需要删除的打印客户ID
     * @return 结果
     */
    public int deletePrintCustomerByIds(Long[] printMappingIds);

    /**
     * 新增保存打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public int insertPrintCustomer(PrintCustomer printMapping);

    /**
     * 修改保存打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public int updatePrintCustomer(PrintCustomer printMapping);
}
