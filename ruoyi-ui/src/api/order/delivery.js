import request from '@/utils/request'

// 查询出货单列表
export function listDelivery(query) {
  return request({
    url: '/order/delivery/list',
    method: 'get',
    params: query
  })
}

// 查询出货单明细列表
export function listDeliveryDetail(query) {
  return request({
    url: '/order/delivery/listDetail',
    method: 'get',
    params: query
  })
}

// 查询历史打印列表
export function listPrintData(query) {
  return request({
    url: '/order/delivery/listPrintData',
    method: 'get',
    params: query
  })
}

// 查询历史打印明细列表
export function listPrintDataDetail(query) {
  return request({
    url: '/order/delivery/listPrintDataDetail',
    method: 'get',
    params: query
  })
}

// 获取打印数据
export function listPrintDataPrint(query) {
  return request({
    url: '/order/delivery/listPrintDataPrint',
    method: 'get',
    params: query
  })
}
