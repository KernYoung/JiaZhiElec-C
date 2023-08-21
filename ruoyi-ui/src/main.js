import Vue from 'vue'

import Cookies from 'js-cookie'

import Element from 'element-ui'
import './assets/styles/element-variables.scss'

import '@/assets/styles/index.scss' // global css
import '@/assets/styles/ruoyi.scss' // ruoyi css
import App from './App'
import store from './store'
import router from './router'
import directive from './directive' // directive
import plugins from './plugins' // plugins
import { download } from '@/utils/request'

import './assets/icons' // icon
import './permission' // permission control
import { getDicts } from "@/api/system/dict/data";
import { getConfigKey } from "@/api/system/config";
import { parseTime, resetForm, addDateRange, selectDictLabel, selectDictLabels, handleTree } from "@/utils/ruoyi";
// 分页组件
import Pagination from "@/components/Pagination";
// 自定义表格工具组件
import RightToolbar from "@/components/RightToolbar"
// 富文本组件
import Editor from "@/components/Editor"
// 文件上传组件
import FileUpload from "@/components/FileUpload"
// 图片上传组件
import ImageUpload from "@/components/ImageUpload"
// 图片预览组件
import ImagePreview from "@/components/ImagePreview"
// 字典标签组件
import DictTag from '@/components/DictTag'
// 头部标签组件
import VueMeta from 'vue-meta'
// 字典数据组件
import DictData from '@/components/DictData'
// 需要先引入 Vue 和 Element-UI 依赖库, 并在 <el-table></el-table> 组件下使用该组件
import AFTableColumn from 'af-table-column'

// import { hiPrintPlugin } from 'vue-plugin-hiprint'
// hiPrintPlugin.disAutoConnect() // 取消自动连接直接打印客户端，如果设置了取消自动连接，后续是获取不到打印机列表的
// Vue.use(hiPrintPlugin, '$pluginName')

import {hiPrintPlugin} from './views/index'
Vue.use(hiPrintPlugin)
// hiPrintPlugin.disAutoConnect();

import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
Vue.use(Antd);

import Storage from 'vue-ls'
let options = {
  namespace: 'hiPrint-',
  name: 'ls',
  storage: 'local',
};
Vue.use(Storage, options);


Vue.use(AFTableColumn)

// 全局方法挂载
Vue.prototype.getDicts = getDicts
Vue.prototype.getConfigKey = getConfigKey
Vue.prototype.parseTime = parseTime
Vue.prototype.resetForm = resetForm
Vue.prototype.addDateRange = addDateRange
Vue.prototype.selectDictLabel = selectDictLabel
Vue.prototype.selectDictLabels = selectDictLabels
Vue.prototype.download = download
Vue.prototype.handleTree = handleTree

// 全局组件挂载
Vue.component('DictTag', DictTag)
Vue.component('Pagination', Pagination)
Vue.component('RightToolbar', RightToolbar)
Vue.component('Editor', Editor)
Vue.component('FileUpload', FileUpload)
Vue.component('ImageUpload', ImageUpload)
Vue.component('ImagePreview', ImagePreview)

Vue.use(directive)
Vue.use(plugins)
Vue.use(VueMeta)
DictData.install()

/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online! ! !
 */

Vue.use(Element, {
  size: Cookies.get('size') || 'medium' // set element-ui default size
})

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})

// 带有斑马纹
Element.Table.props.stripe = {
  default:true,
  type:Boolean
}

// 带有边框
Element.Table.props.border = {
  default:true,
  type:Boolean
}

// 表格单元格内容溢出不换行隐藏
Element.TableColumn.props.showOverflowTooltip = {
  default: true,
  type:Boolean
}

// 表格单元格默认居中属性
Element.TableColumn.props.align = {
  type: String,
  default: 'center'
}

//模态框点击空白不消失
Element.Dialog.props.closeOnClickModal.default = false
