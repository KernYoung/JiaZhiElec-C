package com.jiazhielec.order.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson2.JSONObject;
import com.jiazhielec.common.annotation.DataSource;
import com.jiazhielec.common.enums.DataSourceType;
import com.jiazhielec.order.domain.DeliveryOrder;
import com.jiazhielec.order.domain.DeliveryOrderDetail;
import com.jiazhielec.order.domain.PrintData;
import com.jiazhielec.order.domain.PrintDataDetail;
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
            printData.setNAME1(item.getNAME1());
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
                printDataDetail.setBSTKD(itemDetail.getBSTKD());
                printDataDetail.setPOSNR(itemDetail.getPOSNR());
                printDataDetail.setKDMAT(itemDetail.getKDMAT());
                printDataDetail.setLFIMG(itemDetail.getLFIMG());
                printDataDetail.setMEINS("ST".equals(itemDetail.getMEINS()) ? "PCS" : itemDetail.getMEINS());

                codeQC = codeWork + "_" + sdf.format(printData.getDeliveryDate()) + "_" + printDataDetail.getBSTKD() + "_" + printDataDetail.getPOSNR() + "_" +
                        printDataDetail.getKDMAT() + "_" + printDataDetail.getMEINS();

                printDataDetail.setQrcode(codeQC);
                printDataDetails.add(printDataDetail);
            }
            printData.setTable(printDataDetails);
            printDataList.add(printData);
        }
        return printDataList;
    }

}
