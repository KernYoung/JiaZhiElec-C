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
    public int storePrintDataIntoDatabase(Map<String,Object> map) {
        HistoryPrintAbout historyPrintAbout=new HistoryPrintAbout();
        String key= StringUtils.substring(DateUtils.getDate(),2,4)+StringUtils.substring(DateUtils.getDate(),5,7)+StringUtils.substring(DateUtils.getDate(),8,10);
        historyPrintAbout.setKey(key);
        List<Map<String,Object>> list= (List<Map<String, Object>>) map.get("map");
        for (int i=0;i<list.size();i++){
            PrintData printData=new PrintData();
            Map<String,Object> map1=list.get(i);
            printData.setKunnr(map1.get("kunnr").toString());
            printData.setVbeln(map1.get("vbeln").toString());
            printData.setWerks(map1.get("werks").toString());
            printData.setName1(map1.get("name1").toString());
            printData.setDeliveryDate((Date) map1.get("deliveryDate"));
            printData.setTemplate(map.get("template").toString());
            // todo printNumber  后端生成
            printData.setPrintNumber(map.get("printNumber").toString());
            //明细列表
            List<Map<String,Object>> child= (List<Map<String, Object>>) map1.get("children");
            if (child.size()>0){
                for (int j=0;j<child.size();j++){
                    PrintDataDetail printDataDetail=new PrintDataDetail();
                    Map<String,Object> detail=child.get(i);
                    printDataDetail.setItem(Integer.parseInt(detail.get("item").toString()));
                    printDataDetail.setName(detail.get("name").toString());
                    printDataDetail.setCartons(Integer.parseInt(detail.get("cartons").toString()));
                    printDataDetail.setLgobe(detail.get("lgobe").toString());
                    printDataDetail.setCharg(detail.get("charg").toString());
                    printDataDetail.setPostx(detail.get("postx").toString());
                    printDataDetail.setMatnr(detail.get("matnr").toString());
                    printDataDetail.setWjsl(BigDecimal.valueOf(Long.parseLong(detail.get("wjsl").toString())));
                    printDataDetail.setLfimg(BigDecimal.valueOf(Long.parseLong(detail.get("lfimg").toString())));
                    printDataDetail.setKdmat(detail.get("kdmat").toString());
                    printDataDetail.setPosnr(Integer.parseInt(detail.get("posnr").toString()));
                    printDataDetail.setBstkd(detail.get("bstkd").toString());
                    printDataDetail.setMeins(detail.get("meins").toString());
                    printDataDetail.setSubVBELN(detail.get("subVBELN").toString());
                    printDataDetail.setRemark(detail.get("remark").toString());
                    printDataDetail.setKdmat(detail.get("kdmat").toString());
                    printDataDetailMapper.insertIntoDataBase(printDataDetail);
                }
            }
            printDataMapper.insertIntoDataBase(printData);
        }
        //todo，查看当日是否有其他打印
        historyPrintAboutMapper.selectHistoryPrintBykey();
        historyPrintAbout.setValue(list.size());
        historyPrintAboutMapper.insertIntoDataBase(historyPrintAbout);
        return 0;
    }

}
