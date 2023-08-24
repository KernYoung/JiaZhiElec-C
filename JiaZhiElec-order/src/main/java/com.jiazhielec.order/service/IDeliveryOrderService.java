package com.jiazhielec.order.service;

import java.util.List;
import com.jiazhielec.order.domain.DeliveryOrder;
import com.jiazhielec.order.domain.DeliveryOrderDetail;

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
    List<DeliveryOrder> selectDeliveryOrderListWithDetail(String[] VBELNs);
}
