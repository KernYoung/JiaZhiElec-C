<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="模版名称" prop="templateName">
        <el-input
          v-model="queryParams.templateName"
          placeholder="请输入模版名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="模版状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['print:template:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['print:template:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['print:template:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['print:template:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="templateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="模版编号" align="center" prop="id" />
      <el-table-column label="模版名称" align="center" prop="templateName" />
      <el-table-column label="排序规则" align="center" prop="dataCollation" />
      <!-- <el-table-column label="排序规则" align="center" prop="collation">
        <template slot-scope="scope">
          <span v-if="scope.row.collation == 0">无</span>
          <span v-if="scope.row.collation == 1">升序</span>
          <span v-if="scope.row.collation == 2">降序</span>
        </template>
      </el-table-column> -->
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="260px" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleSort(scope.row)"
            v-hasPermi="['print:template:edit']"
          >排序规则</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleTemplate(scope.row)"
            v-hasPermi="['print:template:edit']"
          >设计模板</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['print:template:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['print:template:remove']"
          >删除</el-button>
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

    <!-- 添加或修改模版对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="模版名称" prop="templateName">
          <el-input v-model="form.templateName" placeholder="请输入模版名称" />
        </el-form-item>
<!--        <el-form-item label="模版编码" prop="templateCode">-->
<!--          <el-input v-model="form.templateCode" placeholder="请输入编码名称" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="模版顺序" prop="templateSort">-->
<!--          <el-input-number v-model="form.templateSort" controls-position="right" :min="0" />-->
<!--        </el-form-item>-->
        <el-form-item label="模版状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加模板规则 -->
    <el-dialog title="排序规则" :visible.sync="openSort" width="600px" append-to-body>
      <!-- <el-form ref="sortForm" :model="sortForm" :rules="sortRules" label-width="100px"> -->
        <!-- 方法一 -->
        <!-- <el-form-item label="排序规则" prop="status">
          <el-radio-group v-model="sortForm.status">
            <el-radio key="无" label="无"></el-radio>
            <el-radio key="升序" label="升序"></el-radio>
            <el-radio key="降序" label="降序"></el-radio>
          </el-radio-group>
        </el-form-item> -->

        <!-- 方法二 -->
        <!-- <el-form-item label="升序排序字段" prop="ascendField">
          <el-select v-model="sortForm.ascendField" multiple placeholder="升序排序字段" clearable>
            <el-option
              v-for="(item, index) in fieldList"
              :key="index"
              :label="item.name"
              :value="item.name"/>
          </el-select>
        </el-form-item>
        <el-form-item label="降序排序字段" prop="descendField">
          <el-select v-model="sortForm.descendField" multiple placeholder="降序排序字段" clearable>
            <el-option
              v-for="(item, index) in fieldList"
              :key="index"
              :label="item.name"
              :value="item.name"/>
          </el-select>
        </el-form-item> -->

        <!-- 方法三 -->
        <el-button type="primary" @click="AddCollate">添加排序</el-button>
        <el-table :data="tableData" style="width: 100%; margin-top: 10px;">
          <el-table-column prop="date" label="排序规则"  width="180">
            <template slot-scope="scope">
              <el-select v-model="scope.row.collation" placeholder="选择排序字段" clearable>
                <el-option
                  v-for="(item, index) in fieldList"
                  :key="index"
                  :label="item.name"
                  :value="item.name"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column prop="name" label="排序方式" width="180">
            <template slot-scope="scope">
              <el-select v-model="scope.row.sort" placeholder="选择排序方式" clearable>
                <el-option label="升序" value="升序"/>
                <el-option label="降序" value="降序"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button type="text" size="small" @click="delCollate(scope.row,scope.$index)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      <!-- </el-form> -->
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitSortForm">确 定</el-button>
        <el-button @click="cancelSort">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTemplate, getTemplate, delTemplate, addTemplate, updateTemplate } from "@/api/print/template";

export default {
  name: "Template",
  dicts: ['sys_normal_disable'],
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
      // 模版表格数据
      templateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        templateName: undefined,
        status: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        templateName: [
          { required: true, message: "模版名称不能为空", trigger: "blur" }
        ]
      },
      // 排序规则
      openSort: false,
      fieldList: [{name:'ID'},{name:'交货单号'},{name:'行项目号'},{name:'产品编码'},{name:'客户料号'},{name:'客户物料描述'},{name:'有效日期'},{name:'数量'}
      ,{name:'单位'},{name:'仓位'},{name:'订单号码'},{name:'未交量'},{name:'箱数'},{name:'序号'}],
      sortForm: {
        status: '无',
      },
      sortRules:{
        templateName: [
          { required: true, message: "模版名称不能为空", trigger: "blur" }
        ]
      },
      tableData: [], // 动态表格
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询模版列表 */
    getList() {
      this.loading = true;
      listTemplate(this.queryParams).then(response => {
        this.templateList = response.rows;
        this.total = response.total;
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
        id: undefined,
        templateName: undefined,
        status: "0",
        remark: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加模版";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTemplate(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改模版";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != undefined) {
            updateTemplate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTemplate(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除模版编号为"' + ids + '"的数据项？').then(function() {
        return delTemplate(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('print/template/export', {
        ...this.queryParams
      }, `template_${new Date().getTime()}.xlsx`)
    },

    // 设计模板
    handleTemplate(row){
      this.$router.push("/print/design/index/" + row.id);
    },

    // 排序规则
    handleSort(row){
      this.resetSort()
      this.sortForm.id = row.id
      let dataCollation = row.dataCollation && row.dataCollation.split(';') || []
      // let ascendField = dataCollation[0] && dataCollation[0].split(':')
      // let descendField = dataCollation[1] && dataCollation[1].split(':')
      // this.sortForm.ascendField = ascendField && ascendField[1].split(',')
      // this.sortForm.descendField = descendField && descendField[1].split(',')
      if(dataCollation.length>0){
        let tableData = []
        dataCollation.map(k=>{
          let obj = {}
          let list = k.split(':')
          obj.collation = list[0]
          obj.sort = list[1]
          tableData.push(obj)
        })
        // console.log(tableData)
        this.tableData = tableData
      }
      this.openSort = true
    },
    // 表单重置
    resetSort() {
      this.sortForm = {
        id: undefined,
        ascendField: undefined,
        descendField: undefined,
        status: "无"
      };
      this.resetForm("sortForm");
      this.tableData = []
    },
    cancelSort(){
      this.resetSort()
      this.openSort = false
    },
    submitSortForm(){
      let that = this
      // let dataCollation = '升序:'+ that.sortForm.ascendField +';'+'降序:'+ that.sortForm.descendField
      let tableData = []
      that.tableData.map(k=>{
        tableData.push(k.collation+':'+k.sort)
      })
      let dataCollation = tableData.join(';')
      let data = {
        id: that.sortForm.id,
        dataCollation: dataCollation,
      }
      updateTemplate(data).then(response => {
        if(response.code == 200){
          that.$modal.msgSuccess("提交成功");
          that.openSort = false;
          that.getList();
        }
      });
    },

    // 添加行
    AddCollate(){
      let data = {
        collation: null,
        sort: null
      }
      this.tableData.push(data)
    },

    // 删除
    delCollate(row,i){
      this.tableData.splice(i, 1)
    }
  }
};
</script>
