package com.jiazhielec.order.service.impl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.alibaba.fastjson2.JSONObject;
import com.jiazhielec.common.annotation.DataSource;
import com.jiazhielec.common.enums.DataSourceType;
import com.jiazhielec.common.utils.DateUtils;
import com.jiazhielec.common.utils.StringUtils;
import com.jiazhielec.order.domain.*;
import com.jiazhielec.order.mapper.DeliveryOrderMapper;
import com.jiazhielec.order.mapper.HistoryPrintAboutMapper;
import com.jiazhielec.order.mapper.PrintDataDetailMapper;
import com.jiazhielec.order.mapper.PrintDataMapper;
import org.apache.poi.hpsf.Decimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jiazhielec.order.service.IDeliveryOrderService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.unit.DataUnit;

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

    @Autowired
    private PrintDataMapper printDataMapper;
    @Autowired
    private PrintDataDetailMapper printDataDetailMapper;
    @Autowired
    private HistoryPrintAboutMapper historyPrintAboutMapper;

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
    public List<DeliveryOrder> selectDeliveryOrderListWithDetail(String[] VBELNs, String dataCollation) {
        List<DeliveryOrder> deliveryOrders = deliveryOrderMapper.selectDeliveryOrderListWithDetail(VBELNs, dataCollation);
        return deliveryOrders;
    }

    @Override
    public List<PrintData> printDataConverter(List<DeliveryOrder> list) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        PrintData printData;
        PrintDataDetail printDataDetail;
        List<PrintDataDetail> printDataDetails = new ArrayList<>();
        Integer sortId = 1;
        String codeQC;
        String codeWork = "";
        List<PrintData> printDataList = new ArrayList<>();
        for (DeliveryOrder item : list){
            printData = new PrintData();
            printData.setName1(item.getNAME1());
            printData.setDeliveryDate(new Date());
            printData.setPrintNumber("test0001");

            if (!item.getWERKS().isEmpty()){
                if (item.getWERKS().equals("8000")){
                    codeWork = "JZ";
                }else if (item.getWERKS().equals("9000")){
                    codeWork = "YIBANG";
                }
            }

            for (DeliveryOrderDetail itemDetail : item.getDeliveryOrderDetailList()){
                printDataDetail = new PrintDataDetail();
                printDataDetail.setId(sortId);
                printDataDetail.setBstkd(itemDetail.getBSTKD());
                printDataDetail.setPosnr(itemDetail.getPOSNR());
                printDataDetail.setKdmat(itemDetail.getKDMAT());
                printDataDetail.setLfimg(itemDetail.getLFIMG());
                printDataDetail.setMeins("ST".equals(itemDetail.getMEINS()) ? "PCS" : itemDetail.getMEINS());

                codeQC = codeWork + "_" + sdf.format(printData.getDeliveryDate()) + "_" + printDataDetail.getBstkd() + "_" + printDataDetail.getPosnr() + "_" +
                        printDataDetail.getKdmat() + "_" + printDataDetail.getMeins();

                printDataDetail.setQrcode(codeQC);
                printDataDetails.add(printDataDetail);
            }
            printData.setTable(printDataDetails);
            printDataList.add(printData);
        }
        return printDataList;
    }

    @Override
    @DataSource(DataSourceType.SLAVE)
    @Transactional
    public int storePrintDataIntoDatabase(List<PrintData> printDataList,Long templateId) {

        for (PrintData printData :printDataList){
            printData.setCreateTime(new Date());
            printData.setId(null);
            //明细列表
            String printNumber = getSeq("");
            printData.setPrintNumber(printNumber);
            printData.setTemplate(String.valueOf(templateId));
            List<PrintDataDetail> child= printData.getTable();
            if (child!=null||child.size()>0){
                for (PrintDataDetail printDataDetail :child){
                    printDataDetail.setPrintNumber(printNumber);
                    printDataDetail.setCreateTime(new Date());
                    printDataDetail.setId(null);
                    printDataDetailMapper.insertIntoDataBase(printDataDetail);
                }
            }
            printDataMapper.insertIntoDataBase(printData);
        }

        return 0;
    }

    private  String getSeq(String prefix) {
        String key = DateUtils.dateTimeNow("yyMMdd");

        HistoryPrintAbout historyPrintAbout=historyPrintAboutMapper.selectHistoryPrintBykey(key);

        if(historyPrintAbout==null){
            historyPrintAbout = new HistoryPrintAbout();
            historyPrintAbout.setKey(key);
            historyPrintAbout.setValue(1);
            historyPrintAboutMapper.insertIntoDataBase(historyPrintAbout);
            return prefix+key+"001";
        }else {
            Integer value = historyPrintAbout.getValue();
            String s = String.valueOf(value + 1);
            while (s.length() < 3)
            {
                s = "0" + s;
            }
            historyPrintAbout.setValue(value + 1);
            historyPrintAboutMapper.updateIntoDataBase(historyPrintAbout);
            return prefix+key+s;
        }
    }

}
