<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="交货单号" prop="VBELN">
        <el-input
          v-model="queryParams.VBELN"
          placeholder="请输入交货单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户名称" prop="NAME1">
        <el-input
          v-model="queryParams.NAME1"
          placeholder="请输入客户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户料号" prop="KDMAT">
        <el-input
          v-model="queryParams.KDMAT"
          placeholder="请输入客户料号"
          clearable
          @keyup.enter.native="getDetailList"
        />
      </el-form-item>
      <el-form-item label="产品编码" prop="MATNR">
        <el-input
          v-model="queryParams.MATNR"
          placeholder="请输入产品编码"
          clearable
          @keyup.enter.native="getDetailList"
        />
      </el-form-item>
      <el-form-item label="打印模版" prop="templateName">
        <el-select v-model="queryParams.templateName" placeholder="打印模版" clearable @change="getInfo">
          <el-option
            v-for="(item,index) in templateList"
            :key="index"
            :label="item.templateName"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button type="primary" icon="el-icon-download" size="mini" @click="printView">打印</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="deliveryList" @selection-change="handleSelectionChange" @row-click="getDetailList">
      <el-table-column label="交货日期" align="center" prop="deliveryDate" />
      <el-table-column label="交货单号" align="center" prop="vbeln">
        <template slot-scope="scope">
          <el-input v-model="scope.row.vbeln" clearable placeholder="交货单号" @input="handleInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="公司代码" align="center" prop="werks" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.werks" clearable placeholder="公司代码" @input="handleInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="客户代码" align="center" prop="kunnr" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.kunnr" clearable placeholder="客户代码" @input="handleInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="客户名称" align="center" prop="name1">
        <template slot-scope="scope">
          <el-input v-model="scope.row.name1" clearable placeholder="客户名称" @input="handleInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime">
        <template slot-scope="scope">
          <el-date-picker clearable
            v-model="scope.row.createTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择创建时间" @change="handleInput(scope.row)">
          </el-date-picker>
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
      <el-table-column label="交货单号" align="center" prop="subVBELN">
        <template slot-scope="scope">
          <el-input v-model="scope.row.subVBELN" clearable placeholder="交货单号" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="行项目号" align="center" prop="posnr">
        <template slot-scope="scope">
          <el-input v-model="scope.row.posnr" clearable placeholder="行项目号" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="产品编码" align="center" prop="matnr">
        <template slot-scope="scope">
          <el-input v-model="scope.row.matnr" clearable placeholder="产品编码" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="客户料号" align="center" prop="kdmat">
        <template slot-scope="scope">
          <el-input v-model="scope.row.kdmat" clearable placeholder="客户料号" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="客户物料描述" align="center" prop="postx">
        <template slot-scope="scope">
          <el-input v-model="scope.row.postx" clearable placeholder="客户物料描述" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="有效日期" align="center" prop="effectiveDate" width="180">
        <template slot-scope="scope">
          <el-date-picker clearable
            v-model="scope.row.effectiveDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择有效日期" @change="handleItemInput(scope.row)">
          </el-date-picker>
        </template>
      </el-table-column>
      <el-table-column label="数量" align="center" prop="lfimg">
        <template slot-scope="scope">
          <el-input v-model="scope.row.lfimg" clearable placeholder="数量" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="单位" align="center" prop="meins">
        <template slot-scope="scope">
          <el-input v-model="scope.row.meins" clearable placeholder="单位" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="仓位" align="center" prop="lgobe">
        <template slot-scope="scope">
          <el-input v-model="scope.row.lgobe" clearable placeholder="仓位" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="订单号码" align="center" prop="bstkd">
        <template slot-scope="scope">
          <el-input v-model="scope.row.bstkd" clearable placeholder="订单号码" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
      <el-table-column label="未交量" align="center" prop="wjsl">
        <template slot-scope="scope">
          <el-input v-model="scope.row.wjsl" clearable placeholder="未交量" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
     <el-table-column label="箱数" align="center" prop="cartons">
        <template slot-scope="scope">
          <el-input v-model.number="scope.row.cartons" clearable placeholder="箱数" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
     <el-table-column label="备注" align="center" prop="charg">
        <template slot-scope="scope">
          <el-input v-model="scope.row.charg" clearable placeholder="备注" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
     <el-table-column label="品名" align="center" prop="name">
        <template slot-scope="scope">
          <el-input v-model="scope.row.name" clearable placeholder="品名" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
     <el-table-column label="序号" align="center" prop="item">
        <template slot-scope="scope">
          <el-input v-model.number="scope.row.item" clearable placeholder="序号" @input="handleItemInput(scope.row)" />
        </template>
      </el-table-column>
    </el-table>

    <!-- 预览 -->
    <div style="opacity: 0;" id="PrintElementOptionSetting"></div>
    <div style="opacity: 0;" id="hiprint-printTemplate" class="hiprint-printTemplate"></div>
    <print-preview ref="preView"/>
  </div>

</template>

<script>
import { listDelivery, listDeliveryDetail } from "@/api/order/delivery";
import printPreview from '../../print/design/preview'
import fontSize from "../../print/design/font-size.js";
import scale from "../../print/design/scale.js";
import { defaultElementTypeProvider, hiprint } from '../../index'
import { listTemplateAll, getPrintQuery, deliveryPrint, deliveryPrintData } from "@/api/print/template"

let hiprintTemplate;

export default {
  name: "Post",
  dicts: ['sys_normal_disable'],
  components: { printPreview },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
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
        VBELN: undefined,//交货单号
        subVBELN: undefined,//交货单号（用于字表查询）
        NAME1: undefined,//客户名称
        KDMAT: undefined,//客户料号
        MATNR: undefined,//产品编号
        printTemplate: undefined,//打印模版
        templateName: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        // postName: [
        //   { required: true, message: "岗位名称不能为空", trigger: "blur" }
        // ],
        // postCode: [
        //   { required: true, message: "岗位编码不能为空", trigger: "blur" }
        // ],
        // postSort: [
        //   { required: true, message: "岗位顺序不能为空", trigger: "blur" }
        // ]
      },
      templateList: [],
      template: null,
      designInfo: '',
      vbelns: null,
      allData: null
    };
  },
  created() {
    this.getAllTemp()
    this.getList();
  },
  methods: {
    /** 查询出货单列表 */
    getList() {
      this.loading = true;
      listDelivery(this.queryParams).then(response => {
        this.deliveryList = response.rows;
        this.total = response.total;
        this.loading = false;
        this.allData = response.rows
        this.allData.map(k=>{
          k.table = []
        })
        this.getDetailList(response.rows[0])
      });
    },
    /** 查询出货单明细列表 */
    getDetailList(row) {
      this.allData.map((k,index)=>{
        if(k.vbeln == row.vbeln){
          if(k.table.length>0){
            this.deliveryDetailList = this.allData[index].table
          }else{
            this.loading = true;
            this.queryParams.subVBELN = row.vbeln;
            listDeliveryDetail(this.queryParams).then(response => {
              this.deliveryDetailList = new Array();
              this.deliveryDetailList = response.rows;
              this.allData[index].table = response.rows
              this.loading = false;
              // console.log(this.allData)
            });
          }
        }
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        // VBELN: undefined,
        // postCode: undefined,
        // postName: undefined,
        // postSort: 0,
        // status: "0",
        // remark: undefined
        VBELN: undefined,//交货单号
        NAME1: undefined,//客户名称
        KDMAT: undefined,//客户料号
        MATNR: undefined,//产品编号
        printTemplate: undefined//打印模版
      };
      this.resetForm("form");
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
      this.resetDetailTable();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.postId)
      this.vbelns = selection.map(item => item.vbeln)
      this.single = selection.length!=1
      this.multiple = !selection.length
      if(selection.length>0){
        this.getDetailList(selection[selection.length-1])
      }else{
        // this.getDetailList(this.deliveryList[0])
        this.deliveryDetailList = []
      }
    },

    // 获取所有列表
    getAllTemp(){
      listTemplateAll().then(response => {
        if(response.code == 200){
          this.templateList = response.data
        }
      });
    },

    // 打印
    getInfo(){
      getPrintQuery(this.queryParams.templateName).then(response => {
        if(response.code == 200){
          this.designInfo = response.data.templateJson && JSON.parse(response.data.templateJson)
          this.init()
        }
      });
    },
    init() {
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
    },
    printView(){
      let [that, printData] = [this, []]
      // console.log(that.vbelns)
      if(that.queryParams.templateName == undefined ||that.queryParams.templateName == ''){
        that.$message.error('请选择打印模版')
      }else if(that.vbelns.length == 0){
        that.$message.error('请选择出货单')
      }else{
        let vbelnList = []
        that.allData.map(k=>{
          if(that.vbelns.indexOf(k.vbeln)>-1){
            vbelnList.push(k)
          }
        })
        // console.log(vbelnList)
        deliveryPrintData(that.queryParams.templateName, JSON.stringify(vbelnList)).then(response => {
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
      }
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
