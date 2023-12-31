import request from '@/utils/request'

// 查询打印模版列表
export function listTemplate(query) {
  return request({
    url: '/print/template/list',
    method: 'get',
    params: query
  })
}

// 查询打印模版详细
export function getTemplate(id) {
  return request({
    url: '/print/template/' + id,
    method: 'get'
  })
}

// 新增打印模版
export function addTemplate(data) {
  return request({
    url: '/print/template',
    method: 'post',
    data: data
  })
}

// 修改打印模版
export function updateTemplate(data) {
  return request({
    url: '/print/template',
    method: 'put',
    data: data
  })
}

// 删除打印模版
export function delTemplate(id) {
  return request({
    url: '/print/template/' + id,
    method: 'delete'
  })
}

// 获取单个模版详细
export function getPrintQuery(id) {
  return request({
    url: '/print/template/' + id,
    method: 'get'
  })
}

// 获取打印数据
export function deliveryPrint(id) {
  return request({
    url: '/order/delivery/listAll/' + id,
    method: 'get'
  })
}

// 获取新的打印数据
export function deliveryPrintData(id,data) {
  return request({
    url: '/order/delivery/storePrintDataIntoDatabase/'+ id,
    method: 'post',
    data: data
  })
}

// 获取新的打印数据
export function deliveryPrintData2(id,data) {
  return request({
    url: '/order/delivery/storePrintDataIntoDatabase2/'+ id,
    method: 'post',
    data: data
  })
}

// 查询打印模版所有列表
export function listTemplateAll(query) {
  return request({
    url: '/print/template/optionSelect',
    method: 'get',
    params: query
  })
}
