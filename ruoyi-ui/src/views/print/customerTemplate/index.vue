<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="客户id" prop="customerId">
        <el-input
          v-model="queryParams.customerId"
          placeholder="请输入客户id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模版id" prop="templateId">
        <el-input
          v-model="queryParams.templateId"
          placeholder="请输入模版id"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['print:customerTemplate:add']"
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
          v-hasPermi="['print:customerTemplate:edit']"
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
          v-hasPermi="['print:customerTemplate:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['print:customerTemplate:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="customerTemplateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="客户id" align="center" prop="customerId">
      </el-table-column>
      <el-table-column label="模版id" align="center" prop="templateId">
      </el-table-column>
      <el-table-column label="id" align="center" prop="pingtCustomerTemplateId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['print:customerTemplate:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['print:customerTemplate:remove']"
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

    <!-- 添加或修改客户模板映射对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="客户" prop="customerId">
          <el-select v-model="form.customerId" placeholder="请选择客户" clearable no-data-text="暂无需要绑定的客户">
            <el-option
              v-for="data in customerListExt"
              :key="data.id"
              :label="data.customerName+'('+data.customerCode+')'"
              :value="data.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="模版" prop="templateId">
          <el-select v-model="form.templateId" placeholder="请选择模版" clearable no-data-text="暂无需要绑定的客户">
            <el-option
              v-for="data in templateListExt"
              :key="data.id"
              :label="data.templateName+'('+data.id+')'"
              :value="data.id" disabled>
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCustomerTemplate, getCustomerTemplate, delCustomerTemplate, addCustomerTemplate, updateCustomerTemplate } from "@/api/print/customerTemplate";
import {listCustomerAll} from "@/api/print/customer";
import {listTemplateAll} from "@/api/print/template";

export default {
  name: "CustomerTemplate",
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
      // 客户模板映射表格数据
      customerTemplateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        customerId: null,
        templateId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        customerId: [
          { required: true, message: "客户id不能为空", trigger: "blur" }
        ],
        templateId: [
          { required: true, message: "模版id不能为空", trigger: "blur" }
        ],
      },
      customerListExt:[],
      templateListExt:[],
    };
  },
  created() {
    this.queryParams.templateId = this.$route.query.templateId;
    this.form.templateId = parseInt(this.$route.query.templateId);
    this.getList();
  },
  activated() {
    if (this.$route.query.templateId) {
      this.queryParams.templateId = this.$route.query.templateId;
      this.form.templateId = parseInt(this.$route.query.templateId);
      this.getList();
    }
  },
  methods: {
    /** 查询客户模板映射列表 */
    getList() {
      this.loading = true;
      listCustomerTemplate(this.queryParams).then(response => {
        this.customerTemplateList = response.rows;
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
        customerId: null,
        templateId:this.form.templateId,
        pingtCustomerTemplateId: null
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
      this.ids = selection.map(item => item.pingtCustomerTemplateId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.changeCustomerListExt();
      this.changeTemplateListExt();
      this.open = true;
      this.title = "添加客户模板映射";

    },
    changeCustomerListExt(){
      listCustomerAll().then(response => {
        this.customerListExt = response.rows;
      });
    },
    changeTemplateListExt(){
      listTemplateAll().then(response => {
        if(response.code == 200){
          this.templateListExt = response.data
        }
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const pingtCustomerTemplateId = row.pingtCustomerTemplateId || this.ids
      getCustomerTemplate(pingtCustomerTemplateId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改客户模板映射";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.pingtCustomerTemplateId != null) {
            updateCustomerTemplate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCustomerTemplate(this.form).then(response => {
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
      const pingtCustomerTemplateIds = row.pingtCustomerTemplateId || this.ids;
      this.$modal.confirm('是否确认删除客户模板映射编号为"' + pingtCustomerTemplateIds + '"的数据项？').then(function() {
        return delCustomerTemplate(pingtCustomerTemplateIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('print/customerTemplate/export', {
        ...this.queryParams
      }, `customerTemplate_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
