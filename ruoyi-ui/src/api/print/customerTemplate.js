import request from '@/utils/request'

// 查询客户模板映射列表
export function listCustomerTemplate(query) {
  return request({
    url: '/print/customerTemplate/list',
    method: 'get',
    params: query
  })
}

// 查询客户模板映射详细
export function getCustomerTemplate(pingtCustomerTemplateId) {
  return request({
    url: '/print/customerTemplate/' + pingtCustomerTemplateId,
    method: 'get'
  })
}

// 新增客户模板映射
export function addCustomerTemplate(data) {
  return request({
    url: '/print/customerTemplate',
    method: 'post',
    data: data
  })
}

// 修改客户模板映射
export function updateCustomerTemplate(data) {
  return request({
    url: '/print/customerTemplate',
    method: 'put',
    data: data
  })
}

// 删除客户模板映射
export function delCustomerTemplate(pingtCustomerTemplateId) {
  return request({
    url: '/print/customerTemplate/' + pingtCustomerTemplateId,
    method: 'delete'
  })
}
