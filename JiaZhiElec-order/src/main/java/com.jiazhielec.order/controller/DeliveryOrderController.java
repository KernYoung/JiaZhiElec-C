package com.jiazhielec.order.controller;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson2.JSONObject;
import com.jiazhielec.common.core.domain.R;
import com.jiazhielec.common.core.page.TableDataInfo;
import com.jiazhielec.common.utils.poi.ExcelUtil;
import com.jiazhielec.order.domain.*;
import com.jiazhielec.order.service.*;
import org.apache.commons.lang3.ArrayUtils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import javax.validation.Valid;

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

    @Autowired
    private IPrintTemplateService printTemplateService;

    @Autowired
    private IPrintDataService printDataService;

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

    /**
     * 查询出货单带明细用于预览打印的输出数据
     * VBELN 交货单号
     */
//    @PreAuthorize("@ss.hasPermi('system:post:list')")
    @GetMapping("/listAll/{VBELNs}/{templateId}")
    public TableDataInfo listAll(@PathVariable String[] VBELNs, @PathVariable Long templateId)
    {
        String dataCollation = printTemplateService.getDataCollation(templateId);
        List<DeliveryOrder> list = deliveryOrderService.selectDeliveryOrderListWithDetail(VBELNs, dataCollation);
        List<PrintData> printDataList = deliveryOrderService.printDataConverter(list);
        return getDataTable(printDataList);
    }

    /**
     * 存入打印的数据
     */
    @PostMapping("/storePrintDataIntoDatabase/{templateId}")
    public TableDataInfo storePrintDataIntoDatabase(@RequestBody List<PrintData>  printDataList,@PathVariable Long templateId){
        //排序
        printTemplateService.orderByprintDataList(templateId,printDataList);

        deliveryOrderService.storePrintDataIntoDatabase(printDataList,templateId);

        // todo 返回形式如下
//        List<PrintData> printDataList = printDataService.selectHistoryDataAll();
//        return getDataTable(printDataList);
        return  getDataTable(printDataList);
    }

    @GetMapping("/listPrintData")
    public TableDataInfo listPrintData(FindPrintLikp findPrintLikp)
    {
        startPage();
        List<PrintData> list = deliveryOrderService.selectPrintDataList(findPrintLikp);
        return getDataTable(list);
    }

    @GetMapping("/listPrintDataDetail")
    public TableDataInfo listPrintDataDetail(PrintDataDetail printDataDetail)
    {
        List<PrintDataDetail> list = deliveryOrderService.selectPrintDataDetailList(printDataDetail);
        return getDataTable(list);
    }

    @GetMapping("/listPrintDataPrint")
    public TableDataInfo listPrintDataPrint(PrintData PrintData)
    {
        List<PrintData> list = deliveryOrderService.selectPrintDataListByPrintData(PrintData);
        for (PrintData printData:list) {
            PrintDataDetail printDataDetail = new PrintDataDetail();
            printDataDetail.setPrintNumber(printData.getPrintNumber());
            List<PrintDataDetail> lists = deliveryOrderService.selectPrintDataDetailList(printDataDetail);
            printData.setTable(lists);
        }
        return getDataTable(list);
    }

}
