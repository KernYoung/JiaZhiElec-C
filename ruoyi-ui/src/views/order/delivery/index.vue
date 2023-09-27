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
<!--      <el-form-item label="打印模版" prop="printTemplate">-->
<!--        <el-input-->
<!--          v-model="queryParams.printTemplate"-->
<!--          placeholder="请选择打印模版"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <!-- <el-form-item label="打印模版" prop="printTemplate">
        <el-select v-model="queryParams.printTemplate" placeholder="打印模版" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item> -->
      <el-form-item label="打印模版" prop="templateName">
        <el-select v-model="queryParams.params.templateId" placeholder="打印模版" clearable filterable @change="getInfo">
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
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:post:export']"
        >导出Excel</el-button>
        <el-button type="primary" icon="el-icon-download" size="mini" @click="printView">打印</el-button>
        <el-button type="primary" icon="el-icon-download" size="mini" @click="printView2">明细合并打印</el-button>
        <el-button type="warning" size="mini" @click="printHistory" v-hasPermi="['order:delivery:history']">打印历史</el-button>
      </el-form-item>
    </el-form>

<!--    <el-row :gutter="10" class="mb8">-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['system:post:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['system:post:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['system:post:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:post:export']"-->
<!--        >导出Excel</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
<!--    </el-row>-->

    <el-table v-loading="loading" :data="deliveryList" @selection-change="handleSelectionChange" @row-click="getDetailList">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="交货日期" align="center" prop="deliveryDate">
        <template slot-scope="scope">
          <el-date-picker clearable
            v-model="scope.row.deliveryDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择交货日期" @change="handleInput(scope.row)">
          </el-date-picker>
        </template>
      </el-table-column>
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
      <el-table-column label="操作" width="120px" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-search"
            @click="getDetailList(scope.row)"
          >查看明细</el-button>
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['system:post:remove']"-->
<!--          >删除</el-button>-->
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

    <div style="">明细<el-button size="mini" type="primary" @click="addDelivery" style="margin:0 0 10px 10px;">添加行</el-button></div>

    <el-table v-loading="loading" :data="deliveryDetailList">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
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
      <el-table-column label="有效日期" align="center" prop="effectiveDate" width="250">
        <template slot-scope="scope">
          <el-date-picker clearable
            v-model="scope.row.effectiveDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择有效日期" @change="handleItemInput(scope.row)">
          </el-date-picker>
        </template>
      </el-table-column>
      <!-- <el-table-column label="有效日期" align="center" prop="charg" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column> -->
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
     <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleClear(scope.$index)" >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改岗位对话框 -->
<!--    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>-->
<!--      <el-form ref="form" :model="form" :rules="rules" label-width="80px">-->
<!--        <el-form-item label="岗位名称" prop="postName">-->
<!--          <el-input v-model="form.postName" placeholder="请输入岗位名称" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="岗位编码" prop="postCode">-->
<!--          <el-input v-model="form.postCode" placeholder="请输入编码名称" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="岗位顺序" prop="postSort">-->
<!--          <el-input-number v-model="form.postSort" controls-position="right" :min="0" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="岗位状态" prop="status">-->
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio-->
<!--              v-for="dict in dict.type.sys_normal_disable"-->
<!--              :key="dict.value"-->
<!--              :label="dict.value"-->
<!--            >{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--      <div slot="footer" class="dialog-footer">-->
<!--        <el-button type="primary" @click="submitForm">确 定</el-button>-->
<!--        <el-button @click="cancel">取 消</el-button>-->
<!--      </div>-->
<!--    </el-dialog>-->

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
import { listTemplateAll, getPrintQuery, deliveryPrint, deliveryPrintData ,deliveryPrintData2} from "@/api/print/template"

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
        params:{
          templateId: undefined,
        },
        templateName: undefined,
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

    // 添加行
    addDelivery(){
      let data = {
        subVBELN: null,
        posnr: null,
        matnr: null,
        kdmat: null,
        postx: null,
        effectiveDate: null,
        lfimg: null,
        meins: null,
        lgobe: null,
        bstkd: null,
        wjsl: null,
        cartons: null,
        charg: null,
        name: null,
        item: null,
      }
      this.deliveryDetailList.push(data)
    },

    // 删除行
    handleClear(index){
      this.deliveryDetailList.splice(index,1)
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
    /** 新增按钮操作 */
    // handleAdd() {
    //   this.reset();
    //   this.open = true;
    //   this.title = "添加岗位";
    // },
    /** 修改按钮操作 */
    // handleUpdate(row) {
    //   this.reset();
    //   const postId = row.postId || this.ids
    //   getPost(postId).then(response => {
    //     this.form = response.data;
    //     this.open = true;
    //     this.title = "修改岗位";
    //   });
    // },
    /** 提交按钮 */
    // submitForm: function() {
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.postId != undefined) {
    //         updatePost(this.form).then(response => {
    //           this.$modal.msgSuccess("修改成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       } else {
    //         addPost(this.form).then(response => {
    //           this.$modal.msgSuccess("新增成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       }
    //     }
    //   });
    // },
    /** 删除按钮操作 */
    // handleDelete(row) {
    //   const postIds = row.postId || this.ids;
    //   this.$modal.confirm('是否确认删除岗位编号为"' + postIds + '"的数据项？').then(function() {
    //     return delPost(postIds);
    //   }).then(() => {
    //     this.getList();
    //     this.$modal.msgSuccess("删除成功");
    //   }).catch(() => {});
    // },
    /** 导出按钮操作 */
    handleExport() {
      let that = this;
      let vbelnList = []
      that.allData.map(k=>{
        if(that.vbelns.indexOf(k.vbeln)>-1){
          vbelnList.push(k)
        }
      })
      let kunnr = JSON.stringify(vbelnList);
      let param = {
        kunnr:kunnr

      }
      this.download('/order/delivery/export', {
        ...param
      }, `post_${new Date().getTime()}.xlsx`)
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
      getPrintQuery(this.queryParams.params.templateId).then(response => {
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
      if(that.queryParams.params.templateId == undefined ||that.queryParams.params.templateId == ''){
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
        deliveryPrintData(that.queryParams.params.templateId, JSON.stringify(vbelnList)).then(response => {
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
    printView2(){
      let [that, printData] = [this, []]
      // console.log(that.vbelns)
      if(that.queryParams.params.templateId == undefined ||that.queryParams.params.templateId == ''){
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
        deliveryPrintData2(that.queryParams.params.templateId, JSON.stringify(vbelnList)).then(response => {
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
    },

    // 打印历史
    printHistory(){
      this.$router.push("/order/history2/index/1");
    }
  }
};
</script>
