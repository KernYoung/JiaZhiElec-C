import request from '@/utils/request'

// 查询打印模版列表
export function listCustomer(query) {
  return request({
    url: '/print/customer/list',
    method: 'get',
    params: query
  })
}

// 查询打印模版详细
export function getCustomer(id) {
  return request({
    url: '/print/customer/' + id,
    method: 'get'
  })
}

// 新增打印模版
export function addCustomer(data) {
  return request({
    url: '/print/customer',
    method: 'customer',
    data: data
  })
}

// 修改打印模版
export function updateCustomer(data) {
  return request({
    url: '/print/customer',
    method: 'put',
    data: data
  })
}

// 删除打印模版
export function delCustomer(id) {
  return request({
    url: '/print/customer/' + id,
    method: 'delete'
  })
}
