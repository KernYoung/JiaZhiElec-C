package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.PrintCustomer;

import java.util.List;

/**
 * 打印客户 数据层
 * 
 * @author Kern
 */
public interface PrintCustomerMapper
{
    /**
     * 查询打印客户
     * 
     * @param printMapping 打印客户
     * @return 打印客户数据集合
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
     * @param printMappingId 打印客户id
     * @return 打印客户对象信息
     */
    public PrintCustomer selectPrintCustomerById(Long printMappingId);


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
     * 修改打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public int updatePrintCustomer(PrintCustomer printMapping);

    /**
     * 新增打印客户信息
     * 
     * @param printMapping 打印客户信息
     * @return 结果
     */
    public int insertPrintCustomer(PrintCustomer printMapping);

    /**
     * 校验客户名称
     * 
     * @param customerName 客户名称
     * @return 结果
     */
    public PrintCustomer checkPrintCustomerNameUnique(String customerName);

    /**
     * 校验客户代码
     *
     * @param customerCode 客户代码
     * @return 结果
     */
    public PrintCustomer checkPrintCustomerCodeUnique(String customerCode);

}
