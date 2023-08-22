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
