package com.jiazhielec.order.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jiazhielec.common.annotation.DataSource;
import com.jiazhielec.common.enums.DataSourceType;
import com.jiazhielec.order.domain.DeliveryOrder;
import com.jiazhielec.order.domain.DeliveryOrderDetail;
import com.jiazhielec.order.mapper.DeliveryOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiazhielec.order.service.IDeliveryOrderService;

/**
 * 出货单管理 服务实现
 * 
 * @author Kern
 */
@Service
public class DeliveryOrderServiceImpl implements IDeliveryOrderService
{
    @Autowired
    private DeliveryOrderMapper deliveryOrderMapper;

    /**
     * 查询交货单数据
     * 
     * @param deliveryOrder 交货单信息
     * @return 交货单信息集合
     */
    @Override
    @DataSource(DataSourceType.SLAVE)
    public List<DeliveryOrder> selectDeliveryOrderList(DeliveryOrder deliveryOrder)
    {
        List<DeliveryOrder> deliveryOrders = deliveryOrderMapper.selectDeliveryOrderList(deliveryOrder);
        for (DeliveryOrder item : deliveryOrders){
            item.setDeliveryDate(new Date());
        }
        return deliveryOrders;
    }

    /**
     * 查询交货单明细数据
     *
     * @param deliveryOrderDetail 交货单号
     * @return 交货单信息明细集合
     */
    @Override
    @DataSource(DataSourceType.SLAVE)
    public List<DeliveryOrderDetail> selectDeliveryOrderListDetail(DeliveryOrderDetail deliveryOrderDetail) {
        List<DeliveryOrderDetail> deliveryOrderDetails = deliveryOrderMapper.selectDeliveryOrderDetailList(deliveryOrderDetail);
        for (DeliveryOrderDetail item : deliveryOrderDetails){
            if ("ST".equals(item.getMEINS())){
                item.setMEINS("PCS");
            }
        }
        return deliveryOrderDetails;
    }

    /**
     * 查询交货单带明细
     *
     * @param VBELNs 交货单号集合
     * @return 交货单信息明细集合
     */
    @Override
    @DataSource(DataSourceType.SLAVE)
    public List<DeliveryOrder> selectDeliveryOrderListWithDetail(String[] VBELNs) {
        List<DeliveryOrder> deliveryOrders = deliveryOrderMapper.selectDeliveryOrderListWithDetail(VBELNs);
        return deliveryOrders;
    }

}
