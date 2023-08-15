package com.jiazhielec.order.controller;

import java.util.List;

import com.jiazhielec.common.core.page.TableDataInfo;
import com.jiazhielec.common.utils.poi.ExcelUtil;
import com.jiazhielec.order.domain.DeliveryOrder;
import com.jiazhielec.order.domain.DeliveryOrderDetail;
import com.jiazhielec.order.service.IDeliveryOrderService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jiazhielec.common.annotation.Log;
import com.jiazhielec.common.constant.UserConstants;
import com.jiazhielec.common.core.controller.BaseController;
import com.jiazhielec.common.core.domain.AjaxResult;
import com.jiazhielec.common.core.domain.entity.SysDept;
import com.jiazhielec.common.enums.BusinessType;
import com.jiazhielec.common.utils.StringUtils;

import javax.servlet.http.HttpServletResponse;

/**
 * 出货单信息
 * 
 * @author Kern
 */
@RestController
@RequestMapping("/order/delivery")
public class DeliveryOrderController extends BaseController
{
    @Autowired
    private IDeliveryOrderService deliveryOrderService;

    /**
     * 获取出货单列表
     */
//    @PreAuthorize("@ss.hasPermi('system:dept:list')")
//    @GetMapping("/list")
//    public AjaxResult list(DeliveryOrder deliveryOrder)
//    {
//        startPage();
//        List<DeliveryOrder> list = deliveryOrderService.selectDeliveryOrderList(deliveryOrder);
//        return getDataTable(list);
////        List<DeliveryOrder> deliveryOrders = deliveryOrderService.selectDeliveryOrderList(deliveryOrder);
////        return success(deliveryOrders);
//    }

    /**
     * 获取出货单列表
     */
//    @PreAuthorize("@ss.hasPermi('system:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(DeliveryOrder deliveryOrder)
    {
        startPage();
        List<DeliveryOrder> list = deliveryOrderService.selectDeliveryOrderList(deliveryOrder);
        return getDataTable(list);
    }

    /**
     * 获取出货单明细列表
     */
//    @PreAuthorize("@ss.hasPermi('system:post:list')")
    @GetMapping("/listDetail")
    public TableDataInfo listDetail(DeliveryOrderDetail deliveryOrderDetail)
    {
        List<DeliveryOrderDetail> list = deliveryOrderService.selectDeliveryOrderListDetail(deliveryOrderDetail);
        return getDataTable(list);
    }

}
