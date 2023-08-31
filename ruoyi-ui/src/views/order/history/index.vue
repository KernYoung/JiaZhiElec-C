<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="打印开始日期" prop="start">
        <el-date-picker clearable
          v-model="queryParams.start"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择打印开始日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="打印结束日期" prop="end">
        <el-date-picker clearable
          v-model="queryParams.end"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择打印结束日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="交货开始日期" prop="delDateStart">
        <el-date-picker clearable
          v-model="queryParams.delDateStart"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择交货开始日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="交货结束日期" prop="delDateEnd">
        <el-date-picker clearable
          v-model="queryParams.delDateEnd"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择交货结束日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="打印单号" prop="printNo">
        <el-input
          v-model="queryParams.printNo"
          placeholder="请输入打印单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="交货单号" prop="vbeln">
        <el-input
          v-model="queryParams.vbeln"
          placeholder="请输入交货单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户料号" prop="kdmat">
        <el-input
          v-model="queryParams.kdmat"
          placeholder="请输入客户料号"
          clearable
          @keyup.enter.native="getDetailList"
        />
      </el-form-item>
      <el-form-item label="产品编码" prop="matnr">
        <el-input
          v-model="queryParams.matnr"
          placeholder="请输入产品编码"
          clearable
          @keyup.enter.native="getDetailList"
        />
      </el-form-item>
      <el-form-item label="订单号码" prop="bstkd">
        <el-input
          v-model="queryParams.bstkd"
          placeholder="请输入订单号码"
          clearable
          @keyup.enter.native="getDetailList"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="deliveryList" @row-click="getDetailList">
      <el-table-column label="交货单号" align="center" prop="vbeln" />
      <el-table-column label="打印单号" align="center" prop="printNumber" />
      <el-table-column label="公司代码" align="center" prop="werks" />
      <el-table-column label="客户代码" align="center" prop="kunnr" />
      <el-table-column label="客户名称" align="center" prop="name1" />
      <el-table-column label="交货日期" align="center" prop="deliveryDate" />
      <el-table-column label="template" align="center" prop="template" />
      <el-table-column label="打印日期" align="center" prop="printDate" />
      <el-table-column label="操作" width="100px" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            @click="getInfo(scope.row)"
          >重新打印</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <p style="">明细</p>
    <el-table v-loading="loading" :data="deliveryDetailList">
      <el-table-column label="交货单号" align="center" prop="subVBELN" />
      <el-table-column label="行项目号" align="center" prop="posnr" />
      <el-table-column label="产品编码" align="center" prop="matnr" />
      <el-table-column label="客户料号" align="center" prop="kdmat" />
      <el-table-column label="客户物料描述" align="center" prop="postx" />
      <el-table-column label="有效日期" align="center" prop="effectiveDate" width="180" />
      <el-table-column label="数量" align="center" prop="lfimg" />
      <el-table-column label="单位" align="center" prop="meins" />
      <el-table-column label="仓位" align="center" prop="lgobe" />
      <el-table-column label="订单号码" align="center" prop="bstkd" />
      <el-table-column label="未交量" align="center" prop="wjsl" />
     <el-table-column label="箱数" align="center" prop="cartons" />
     <el-table-column label="备注" align="center" prop="charg" />
     <el-table-column label="品名" align="center" prop="name" />
     <el-table-column label="序号" align="center" prop="item" />
    </el-table>

    <!-- 预览 -->
    <div style="opacity: 0;" id="PrintElementOptionSetting"></div>
    <div style="opacity: 0;" id="hiprint-printTemplate" class="hiprint-printTemplate"></div>
    <print-preview ref="preView"/>
  </div>

</template>

<script>
import { listPrintData, listPrintDataDetail, listPrintDataPrint } from "@/api/order/delivery";
import printPreview from '../../print/design/preview'
import fontSize from "../../print/design/font-size.js";
import scale from "../../print/design/scale.js";
import { defaultElementTypeProvider, hiprint } from '../../index'
import { getPrintQuery } from "@/api/print/template"

let hiprintTemplate;

export default {
  name: "Post",
  dicts: ['sys_normal_disable'],
  components: { printPreview },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 出货单表格数据
      deliveryList: [],
      // 出货单明细表格数据
      deliveryDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        start: undefined,  // 打印开始日期
        end: undefined,  // 打印结束日期
        delDateStart: undefined,  // 交货开始日期
        delDateEnd: undefined,  // 交货结束日期
        printNo: undefined,  // 打印单号
        vbeln: undefined,  // 交货单号
        kdmat: undefined,  // 客户料号
        matnr: undefined,  // 产品编码
        bstkd: undefined,  // 订单编号
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      template: null,
      designInfo: '',
      allData: null
    };
  },
  created() {
    this.todayDate()
    this.getList();
  },
  methods: {
    todayDate(){
      let today = new Date();
      let year = today.getFullYear(); //获取年份
      let month = today.getMonth() + 1; //获取月份
      let day = today.getDate(); //获取日期
      let date = year + "-" + month + "-" + day
      this.queryParams.start = date
      this.queryParams.end = date
    },

    /** 查询历史打印列表 */
    getList() {
      this.loading = true;
      listPrintData(this.queryParams).then(response => {
        if(response.code == 200){
          this.deliveryList = response.rows;
          this.total = response.total;
          this.allData = response.rows
          this.allData.map(k=>{
            k.table = []
          })
          this.getDetailList(response.rows[0])
        }
        this.loading = false;
      });
    },
    /** 查询历史打印明细列表 */
    getDetailList(row) {
      this.allData.map((k,index)=>{
        if(k.vbeln == row.vbeln){
          if(k.table.length>0){
            this.deliveryDetailList = this.allData[index].table
          }else{
            this.loading = true;
            listPrintDataDetail({printNumber:row.printNumber}).then(response => {
              if(response.code == 200){
                this.deliveryDetailList = new Array();
                this.deliveryDetailList = response.rows;
                this.allData[index].table = response.rows
              }
              this.loading = false;
            });
          }
        }
      })
    },

    // 表单重置
    resetDetailTable() {
      this.deliveryDetailList = undefined;
    },

    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
      this.resetDetailTable();
    },

    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },

    // 打印
    getInfo(row){
      getPrintQuery(row.template).then(response => {
        if(response.code == 200){
          if(response.data){
            this.designInfo = response.data.templateJson && JSON.parse(response.data.templateJson)
            this.init(row)
          }else{
            this.$message.warning(`没有此打印模板，请重新选择打印`)
          }
        }
      });
    },
    init(row) {
      hiprint.init({
        providers: [new defaultElementTypeProvider()]
      });
      // 还原配置
      hiprint.setConfig()
      // 替换配置
      hiprint.setConfig({
        optionItems: [
          fontSize,
          scale,
          function () {
            function t() {
              this.name = "zIndex";
            }

            return t.prototype.css = function (t, e) {
              if (t && t.length) {
                if (e) return t.css('z-index', e);
              }
              return null;
            }, t.prototype.createTarget = function () {
              return this.target = $('<div class="hiprint-option-item">\n        <div class="hiprint-option-item-label">\n        元素层级2\n        </div>\n        <div class="hiprint-option-item-field">\n        <input type="number" class="auto-submit"/>\n        </div>\n    </div>'), this.target;
            }, t.prototype.getValue = function () {
              var t = this.target.find("input").val();
              if (t) return parseInt(t.toString());
            }, t.prototype.setValue = function (t) {
              this.target.find("input").val(t);
            }, t.prototype.destroy = function () {
              this.target.remove();
            }, t;
          }(),
        ],
        movingDistance: 2.5,
        text: {
          tabs: [
            // 隐藏部分
            {
              // name: '测试', // tab名称 可忽略
              options: [] // 必须包含 options
            },// 当修改第二个 tabs 时,必须把他之前的 tabs 都列举出来.
            {
              name: '样式', options: [
                {
                  name: 'scale',
                  after: 'transform', // 自定义参数，插入在 transform 之后
                  hidden: false
                },
              ]
            }
          ],
          supportOptions: [
            {
              name: 'styler',
              hidden: true
            },
            {
              name: 'scale', // 自定义参数，supportOptions 必须得添加
              after: 'transform', // 自定义参数，插入在 transform 之后
              hidden: false
            },
            {
              name: 'formatter',
              hidden: true
            },
          ]
        },
        image: {
          tabs: [
            {
              // 整体替换
              replace: true,
              name: '基本', options: [
                {
                  name: 'field',
                  hidden: false
                },
                {
                  name: 'src',
                  hidden: false
                },
                {
                  name: 'fit',
                  hidden: false
                }
              ]
            },
          ],
        }
      })
      // eslint-disable-next-line no-undef
      // hiprint.PrintElementTypeManager.buildByHtml($('.ep-draggable-item'));
      $('#hiprint-printTemplate').empty()
      let that = this;
      this.template = hiprintTemplate = new hiprint.PrintTemplate({
        template: that.designInfo,
        // 图片选择功能
        onImageChooseClick: (target) => {
          // 测试 3秒后修改图片地址值
          setTimeout(() => {
            target.refresh("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAtAAAAIIAQMAAAB99EudAAAABlBMVEUmf8vG2O41LStnAAABD0lEQVR42u3XQQqCQBSAYcWFS4/QUTpaHa2jdISWLUJjjMpclJoPGvq+1WsYfiJCZ4oCAAAAAAAAAAAAAAAAAHin6pL9c6H/fOzHbRrP0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0u/SY9LS0tLS0tLS0tLS0n+edm+UlpaWlpaWlpaWlpaW/tl0Ndyzbno7/+tPTJdd1wal69dNa6abx+Lq6TSeYtK7BX/Diek0XULSZZrakPRtV0i6Hu/KIt30q4fM0pvBqvR9mvsQkZaW9gyJT+f5lsnzjR54xAk8mAUeJyMPwYFH98ALx5Jr0kRLLndT7b64UX9QR/0eAAAAAAAAAAAAAAAAAAD/4gpryzr/bja4QgAAAABJRU5ErkJggg==", {
              real: true // 根据图片实际尺寸调整(转pt)
            })
          }, 3000)
        },
        // 自定义可选字体
        // 或者使用 hiprintTemplate.setFontList([])
        // 或元素中 options.fontList: []
        fontList: [
          {title: '微软雅黑', value: 'Microsoft YaHei'},
          {title: '黑体', value: 'STHeitiSC-Light'},
          {title: '思源黑体', value: 'SourceHanSansCN-Normal'},
          {title: '王羲之书法体', value: '王羲之书法体'},
          {title: '宋体', value: 'SimSun'},
          {title: '华为楷体', value: 'STKaiti'},
          {title: 'cursive', value: 'cursive'},
        ],
        dataMode: 1, // 1:getJson 其他：getJsonTid 默认1
        history: true, // 是否需要 撤销重做功能
        onDataChanged: (type, json) => {
          console.log(type); // 新增、移动、删除、修改(参数调整)、大小、旋转
          console.log(json); // 返回 template
        },
        onUpdateError: (e) => {
          console.log(e);
        },
        settingContainer: '#PrintElementOptionSetting',
        paginationContainer: '.hiprint-printPagination'
      });
      hiprintTemplate.design('#hiprint-printTemplate', {grid: true});
      console.log(hiprintTemplate);
      // 获取当前放大比例, 当zoom时传true 才会有
      // this.scaleValue = hiprintTemplate.editingPanel.scale || 1;
      this.printView(row)
    },
    printView(row){
      let [that, printData] = [this, []]
      listPrintDataPrint({printNumber:row.printNumber}).then(response => {
        if(response.code == 200){
          printData = response.rows
          // 测试, 点预览更新拖拽元素
          // hiprint.updateElementType('defaultModule.text', (type) => {
          //   type.title = '这是更新后的元素';
          //   return type
          // })
          // 测试, 通过socket刷新打印机列表； 默认只有连接的时候才会获取到最新的打印机列表
          hiprint.refreshPrinterList((list) => {
            console.log('refreshPrinterList')
            console.log(list)
          });
          // 测试, 获取IP、IPV6、MAC地址、DNS
          // 参数格式：
          // 1. 类型（ip、ipv6、mac、dns、all、interface、vboxnet）
          // 2. 回调 data => {addr, e}  addr: 返回的数据 e:错误信息
          // 3. 其他参数 ...args
          hiprint.getAddress('ip', (data) => {
            console.log('ip')
            console.log(data)
          })
          hiprint.getAddress('ipv6', (data) => {
            console.log('ipv6')
            console.log(data)
          })
          hiprint.getAddress('mac', (data) => {
            console.log('mac')
            console.log(data)
          })
          hiprint.getAddress('dns', (data) => {
            console.log('dns')
            console.log(data)
          })
          hiprint.getAddress('all', (data) => {
            console.log('all')
            console.log(data)
          })
          // 各个平台不一样, 用法见: https://www.npmjs.com/package/address
          hiprint.getAddress('interface', (data) => {
            console.log('interface')
            console.log(data)
          }, 'IPv4', 'eth1')
          // console.log(printData)
          that.$refs.preView.show(hiprintTemplate, printData)
        }
      });
    },

    // 修改表格，缓存本地
    handleInput(val){
      this.allData.map(k=>{
        if(val.vbeln == k.vbeln){
          k = val
        }
      })
    },
    handleItemInput(val){
      this.allData.map(k=>{
        k.table.map(m=>{
          if(val.subVBELN == m.subVBELN){
            m = val
          }
        })
      })
    }
  }
};
</script>
