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
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:post:export']"
        >导出Excel</el-button>
        <el-button type="primary" icon="el-icon-download" size="mini" @click="printView">打印</el-button>
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

    <el-table v-loading="loading" :data="deliveryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="交货日期" align="center" prop="deliveryDate" />

<!--      <el-table-column label="交货单号" align="center" prop="vbeln" >-->
<!--        <template slot-scope="scope">-->
<!--          <div @click="getDetailList(scope.row)">{{ scope.row.vbeln }}</div>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="交货单号" align="center" prop="vbeln" @click="getDetailList(scope.row)" />


      <el-table-column label="公司代码" align="center" prop="werks" />
      <el-table-column label="客户代码" align="center" prop="kunnr" />
      <el-table-column label="客户名称" align="center" prop="name1"/>
      <el-table-column label="创建时间" align="center" prop="createTime" />
<!--      <el-table-column label="创建时间" align="center" prop="createTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.createTime) }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" width="200px" align="center" class-name="small-padding fixed-width">
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

    <p style="">明细</p>

    <el-table v-loading="loading" :data="deliveryDetailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="交货单号" align="center" prop="subVBELN" />
      <el-table-column label="行项目号" align="center" prop="posnr" />
      <el-table-column label="产品编码" align="center" prop="matnr" />
      <el-table-column label="客户料号" align="center" prop="kdmat" />
      <el-table-column label="客户物料描述" align="center" prop="postx"/>
      <el-table-column label="有效日期" align="center" prop="charg" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数量" align="center" prop="lfimg"/>
      <el-table-column label="单位" align="center" prop="meins"/>
      <el-table-column label="仓位" align="center" prop="lgobe"/>
      <el-table-column label="订单号码" align="center" prop="bstkd"/>
      <el-table-column label="未交量" align="center" prop="wjsl"/>
<!--      <el-table-column label="箱数" align="center" prop="name1"/>-->
<!--      <el-table-column label="备注" align="center" prop="name1"/>-->
<!--      <el-table-column label="品名" align="center" prop="name1"/>-->
<!--      <el-table-column label="序号" align="center" prop="name1"/>-->
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
import { listTemplateAll, getPrintQuery, deliveryPrint } from "@/api/print/template"

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
      });
    },
    /** 查询出货单明细列表 */
    getDetailList(row) {
      this.loading = true;
      // debugger;
      this.queryParams.subVBELN = row.vbeln;
      // console.info("subVBELN: " + row.vbeln);
      // console.info("KDMAT: " + this.queryParams.KDMAT);
      // console.info("MATNR: " + this.queryParams.MATNR);
      listDeliveryDetail(this.queryParams).then(response => {
        this.deliveryDetailList = new Array();
        this.deliveryDetailList = response.rows;
        // this.total = response.total;
        this.loading = false;
      });
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
      this.download('system/post/export', {
        ...this.queryParams
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
      console.log(that.vbelns)
      deliveryPrint(that.vbelns.join(',')).then(response => {
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
          console.log(printData)
          that.$refs.preView.show(hiprintTemplate, printData)
        }
      });
    },
  }
};
</script>
