package com.jiazhielec.order.service;

import com.jiazhielec.order.domain.*;

import java.util.List;

/**
 * 部门管理 服务层
 * 
 * @author ruoyi
 */
public interface IDeliveryOrderService
{
    /**
     * 查询交货单
     * 
     * @param deliveryOrder 交货单信息
     * @return 交货单信息集合
     */
    public List<DeliveryOrder> selectDeliveryOrderList(DeliveryOrder deliveryOrder);

    /**
     * 查询交货单明细
     *
     * @param deliveryOrder 交货单号
     * @return 交货单信息集合
     */
    List<DeliveryOrderDetail> selectDeliveryOrderListDetail(DeliveryOrderDetail deliveryOrder);

    /**
     * 查询交货单带明细
     *
     * @param VBELNs 交货单号
     * @return 交货单信息集合
     */
    List<DeliveryOrder> selectDeliveryOrderListWithDetail(String[] VBELNs, String dataCollation);

    /**
     * 将数据转为打印数据
     *
     * @param list 交货单集合
     * @return 打印数据集合
     */
    List<PrintData> printDataConverter(List<DeliveryOrder> list);

    int storePrintDataIntoDatabase(List<PrintData> printDataList,Long templateId);

    List<PrintData> selectPrintDataList(FindPrintLikp findPrintLikp);

    List<PrintDataDetail> selectPrintDataDetailList(PrintDataDetail printData);

    List<PrintData> selectPrintDataListByPrintData(PrintData printData);
}
