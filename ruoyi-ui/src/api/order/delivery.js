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
