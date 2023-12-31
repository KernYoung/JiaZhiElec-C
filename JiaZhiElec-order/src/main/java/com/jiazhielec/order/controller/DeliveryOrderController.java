package com.jiazhielec.order.controller;

import com.alibaba.fastjson2.util.DateUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiazhielec.common.core.controller.BaseController;
import com.jiazhielec.common.core.page.TableDataInfo;
import com.jiazhielec.common.exception.ServiceException;
import com.jiazhielec.order.domain.*;
import com.jiazhielec.order.service.IDeliveryOrderService;
import com.jiazhielec.order.service.IPrintCustomerTemplateService;
import com.jiazhielec.order.service.IPrintDataService;
import com.jiazhielec.order.service.IPrintTemplateService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

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
    private IPrintCustomerTemplateService printCustomerTemplateService;

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

        Long templateId = deliveryOrder.getParams().get("templateId") == null ? -1L : Long.valueOf(deliveryOrder.getParams().get("templateId").toString());
        if(templateId.longValue()!=-1L){
            PrintCustomerTemplate printCustomerTemplate = new PrintCustomerTemplate();
            printCustomerTemplate.setTemplateId(templateId);
            List<PrintCustomerTemplate> list = printCustomerTemplateService.selectPrintCustomerTemplateList(printCustomerTemplate);
            if (!list.isEmpty()){
                List<String> list1 = new ArrayList<>();
                for (PrintCustomerTemplate p: list) {
                    list1.add(p.getCustomerCode());
                }
                deliveryOrder.getParams().put("customerCodes",list1);
            }
        }
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
        //检验
        PrintCustomerTemplate printCustomerTemplate = new PrintCustomerTemplate();
        printCustomerTemplate.setTemplateId(templateId);
        List<PrintCustomerTemplate> list = printCustomerTemplateService.selectPrintCustomerTemplateList(printCustomerTemplate);
        if (!list.isEmpty()){
            List<String> list1 = new ArrayList<>();
            for (PrintCustomerTemplate p: list) {
                list1.add(p.getCustomerCode());
            }
            for (PrintData p: printDataList) {
                if(!list1.contains(p.getKunnr())){
                    throw new ServiceException("客户编码："+p.getKunnr()+"与该模版不匹配");
                }
            }
        }
        //排序
        printTemplateService.orderByprintDataList(templateId,printDataList);

        deliveryOrderService.storePrintDataIntoDatabase(printDataList,templateId);

        // todo 返回形式如下
//        List<PrintData> printDataList = printDataService.selectHistoryDataAll();
//        return getDataTable(printDataList);
        return  getDataTable(printDataList);
    }


    /**
     * 存入打印的数据
     */
    @PostMapping("/storePrintDataIntoDatabase2/{templateId}")
    public TableDataInfo storePrintDataIntoDatabase2(@RequestBody List<PrintData>  printDataList,@PathVariable Long templateId){
        //检验
        PrintCustomerTemplate printCustomerTemplate = new PrintCustomerTemplate();
        printCustomerTemplate.setTemplateId(templateId);
        List<PrintCustomerTemplate> list = printCustomerTemplateService.selectPrintCustomerTemplateList(printCustomerTemplate);
        if (!list.isEmpty()){
            List<String> list1 = new ArrayList<>();
            for (PrintCustomerTemplate p: list) {
                list1.add(p.getCustomerCode());
            }
            for (PrintData p: printDataList) {
                if(!list1.contains(p.getKunnr())){
                    throw new ServiceException("客户编码："+p.getKunnr()+"与该模版不匹配");
                }
            }
        }

        List<PrintData> printDataList1=sortPrintDataList(printDataList);

        //排序
        printTemplateService.orderByprintDataList(templateId,printDataList1);

        deliveryOrderService.storePrintDataIntoDatabase(printDataList1,templateId);

        // todo 返回形式如下
//        List<PrintData> printDataList = printDataService.selectHistoryDataAll();
//        return getDataTable(printDataList);
        return  getDataTable(printDataList1);
    }

    private List<PrintData> sortPrintDataList(List<PrintData> printDataList) {
        List<PrintData> printDataList1 = new ArrayList<>();
        printDataList1.add(printDataList.get(0));
        List<PrintDataDetail> printDataDetailList = new ArrayList<>();
        for (PrintData printData :printDataList){
            List<PrintDataDetail> list = printData.getTable();
            printDataDetailList.addAll(list);
        }
        printDataList1.get(0).setTable(printDataDetailList);
        return printDataList1;
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
            for (PrintDataDetail printDataDetail1: lists) {
                printDataDetail1.setDeliveryDate(printData.getDeliveryDate());
                printDataDetail1.setWERKS(printData.getWerks());
            }
            printData.setTable(lists);
        }
        return getDataTable(list);
    }



    @PostMapping("/export")
    public void export(HttpServletResponse response,  PrintData PrintData) {

        Workbook workbook = new XSSFWorkbook();
        try {

            Sheet sheet = workbook.createSheet("Sheet1");
            String  likps = PrintData.getKunnr();
            //String jsonString = "{\"data\":[{\"id\":1,\"name\":\"Tom\",\"age\":20},{\"id\":2,\"name\":\"Jerry\",\"age\":22},{\"id\":3,\"name\":\"Kate\",\"age\":18}]}";
            ObjectMapper mapper = new ObjectMapper();
            List<PrintData> printDataList = mapper.readValue(likps, new TypeReference<List<PrintData>>(){});
            // 4. 填充数据内容
            int rowNum = 0;
            for (PrintData data : printDataList) {
                // 3. 填充表头信息
                Row headerRow = sheet.createRow(rowNum);
                Cell cell1 = headerRow.createCell(0);
                cell1.setCellValue("Id");
                Cell cell2 = headerRow.createCell(1);
                cell2.setCellValue("交货日期");
                Cell cell3 = headerRow.createCell(2);
                cell3.setCellValue("交货单号");
                Cell cell4 = headerRow.createCell(3);
                cell4.setCellValue("公司代码");
                Cell cell5 = headerRow.createCell(4);
                cell5.setCellValue("客户代码");
                Cell cell6 = headerRow.createCell(5);
                cell6.setCellValue("客户名称");
                Cell cell7 = headerRow.createCell(6);
                cell7.setCellValue("创建时间");
                rowNum++;
                Row row = sheet.createRow(rowNum);
                row.createCell(0).setCellValue(data.getId());
                if (data.getDeliveryDate() != null) {
                    row.createCell(1).setCellValue(DateUtils.format(data.getDeliveryDate(), "yyyy-MM-dd"));
                }
                row.createCell(2).setCellValue(data.getVbeln());
                row.createCell(3).setCellValue(data.getWerks());
                row.createCell(4).setCellValue(data.getKunnr());
                row.createCell(5).setCellValue(data.getName1());
                if (data.getCreateTime() != null) {
                    row.createCell(6).setCellValue(DateUtils.format(data.getCreateTime(), "yyyy-MM-dd"));
                }
                rowNum++;
                if (!data.getTable().isEmpty()) {
                    Row headerRow2 = sheet.createRow(rowNum);
                    Cell cell11 = headerRow2.createCell(0);
                    cell11.setCellValue("交货单号");
                    Cell cell12 = headerRow2.createCell(1);
                    cell12.setCellValue("行项目号");
                    Cell cell13 = headerRow2.createCell(2);
                    cell13.setCellValue("产品编码");
                    Cell cell14 = headerRow2.createCell(3);
                    cell14.setCellValue("客户料号");
                    Cell cell15 = headerRow2.createCell(4);
                    cell15.setCellValue("客户物料描述");
                    Cell cell16 = headerRow2.createCell(5);
                    cell16.setCellValue("有效日期");
                    Cell cell17 = headerRow2.createCell(6);
                    cell17.setCellValue("数量");
                    Cell cell18 = headerRow2.createCell(7);
                    cell18.setCellValue("单位");
                    Cell cell19 = headerRow2.createCell(8);
                    cell19.setCellValue("仓位");
                    Cell cell20 = headerRow2.createCell(9);
                    cell20.setCellValue("订单号码");
                    Cell cell21 = headerRow2.createCell(10);
                    cell21.setCellValue("未交量");
                    Cell cell22 = headerRow2.createCell(11);
                    cell22.setCellValue("箱数");
                    Cell cell23 = headerRow2.createCell(12);
                    cell23.setCellValue("备注");
                    Cell cell24 = headerRow2.createCell(13);
                    cell24.setCellValue("品名");
                    Cell cell25 = headerRow2.createCell(14);
                    cell25.setCellValue("序号");
                    rowNum++;
                    for (PrintDataDetail jzOrderDetail : data.getTable()) {

                        Row row2 = sheet.createRow(rowNum);
                        row2.createCell(0).setCellValue(jzOrderDetail.getSubVBELN());
                        row2.createCell(1).setCellValue(jzOrderDetail.getPosnr());
                        row2.createCell(2).setCellValue(jzOrderDetail.getMatnr());
                        row2.createCell(3).setCellValue(jzOrderDetail.getKdmat());
                        row2.createCell(4).setCellValue(jzOrderDetail.getPostx());
                        if (jzOrderDetail.getEffectiveDate() != null) {
                            row2.createCell(5).setCellValue(DateUtils.format(jzOrderDetail.getEffectiveDate(), "yyyy-MM-dd"));
                        }
                        row2.createCell(6).setCellValue(jzOrderDetail.getLfimg().toString());
                        row2.createCell(7).setCellValue(jzOrderDetail.getMeins());
                        row2.createCell(8).setCellValue(jzOrderDetail.getLgobe());
                        row2.createCell(9).setCellValue(jzOrderDetail.getBstkd());
                        row2.createCell(10).setCellValue(jzOrderDetail.getWjsl().toString());
                        if (jzOrderDetail.getCartons() != null)
                            row2.createCell(11).setCellValue(jzOrderDetail.getCartons());
                        row2.createCell(12).setCellValue(jzOrderDetail.getCharg());
                        row2.createCell(13).setCellValue(jzOrderDetail.getName());
                        if (jzOrderDetail.getItem() != null)
                            row2.createCell(14).setCellValue(jzOrderDetail.getItem());

                        rowNum++;
                    }
                }

                rowNum++;
            }
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            workbook.write(response.getOutputStream());
        }catch (Exception e){
            logger.error(e.getMessage(),e);
        }finally {

            try {
                workbook.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

}
