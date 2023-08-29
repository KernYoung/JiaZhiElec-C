package com.jiazhielec.order.mapper;

import com.jiazhielec.order.domain.DeliveryOrder;
import com.jiazhielec.order.domain.DeliveryOrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 出货单管理 数据层
 * 
 * @author Kern
 */
public interface DeliveryOrderMapper
{
    /**
     * 查询出货单数据
     * 
     * @param deliveryOrder 出货单信息
     * @return 出货单信息集合
     */
    List<DeliveryOrder> selectDeliveryOrderList(DeliveryOrder deliveryOrder);

    /**
     * 查询出货单明细数据
     *
     * @param deliveryOrderDetail 出货单号
     * @return 出货单信息明细集合
     */
    List<DeliveryOrderDetail> selectDeliveryOrderDetailList(DeliveryOrderDetail deliveryOrderDetail);

    /**
     * 查询出货单带明细数据
     *
     * @param vbelns 出货单号
     * @return 出货单信息明细集合
     */
    List<DeliveryOrder> selectDeliveryOrderListWithDetail(@Param("vbelns")String[] vbelns, @Param("dataCollation")String dataCollation);
}
