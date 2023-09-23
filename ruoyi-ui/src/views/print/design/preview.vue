<template>
  <a-modal :visible="visible" :maskClosable="false"
           @cancel="hideModal" :width="width+'mm'">
    <a-spin :spinning="spinning" style="min-height: 100px">
      <div id="preview_content_design"></div>
    </a-spin>
    <template slot="title">
      <a-space>
        <div style="margin-right: 20px">打印预览</div>
        <a-button :loading="waitShowPrinter" type="primary" icon="printer" @click.stop="print">打印</a-button>
        <a-button type="primary" icon="printer" @click.stop="toPdf">pdf</a-button>
      </a-space>
    </template>
    <template slot="footer">
      <a-button key="close" type="info" @click="hideModal">
        关闭
      </a-button>
    </template>
  </a-modal>
</template>

<script>
export default {
  name: "printPreview",
  props: {},
  data() {
    return {
      visible: false,
      spinning: true,
      waitShowPrinter: false,
      // 纸张宽 mm
      width: 0,
      // 模板
      hiprintTemplate: {},
      // 数据
      printData: {}
    }
  },
  computed: {},
  watch: {},
  created() {
  },
  mounted() {
  },
  methods: {
    hideModal() {
      this.visible = false
    },
    show(hiprintTemplate, printData, type, width = '210') {
      console.log(hiprintTemplate)
      this.visible = true
      this.spinning = true
      this.width = hiprintTemplate.editingPanel ? hiprintTemplate.editingPanel.width : width;
      this.hiprintTemplate = hiprintTemplate
      this.printData = printData
      this.type = type
      setTimeout(() => {
        // eslint-disable-next-line no-undef
        $('#preview_content_design').html(hiprintTemplate.getHtml(printData))
        this.spinning = false
      }, 500)
    },
    print() {
      this.waitShowPrinter = true
      if (this.type == 1) {

      } else {
        this.hiprintTemplate.print(this.printData, {}, {
          callback: () => {
            console.log('callback')
            this.waitShowPrinter = false
          }
        })
      }
    },
    toPdf() {
      this.hiprintTemplate.toPdf(this.printData, '打印预览');


    },

    function1(data, col, colIndex, rowIndex, tableData, printData) {
     if(tableData===undefined){
       return [1, 1];
     }
      if (colIndex === 0 && rowIndex === 0) {
        let  spanArr= [];
        let spanIdx = 0;
        tableData.forEach((row, idx) => {
          let b = row ;
          if(!row.list){
            let list =[];
            list.push(b);
            row.list = list;
          }
          if (idx === 0) {
            spanArr.push(1)
            spanIdx = 0

          } else {
            if (row.kdmat === tableData[idx - 1].kdmat) {
              spanArr[spanIdx] += 1
              spanArr.push(0)
              let list2  =  tableData[idx - 1].list;
              list2.push(b);
              for(var idx2  =idx-spanArr[spanIdx]+1;idx2<=idx;idx2++){
                tableData[idx2].list = list2;
              }
            } else {
              spanArr.push(1)
              spanIdx = idx
            }
          }
        })
        printData['spanArr'] =spanArr;
      }



      if (colIndex === 7) {

        let _row =  printData['spanArr'][rowIndex];
        let _col = 1;
        return [_row, _col];
      }
      return [1, 1];
    },
    function2(data, col, colIndex, rowIndex, tableData, printData) {

      if (colIndex === 0 && rowIndex === 0) {
        let  spanArr= [];
        let spanIdx = 0;
        tableData.forEach((row, idx) => {
          if (idx === 0) {
            spanArr.push(1);
            spanIdx = 0;

          } else {
            if (row.kdmat === tableData[idx - 1].kdmat) {
              spanArr[spanIdx] += 1;
              spanArr.push(0);

            } else {
              spanArr.push(1);
              spanIdx = idx;
            }
          }
        })
        printData['spanArr'] =spanArr;
      }

      if (colIndex === 7) {

        let _row =  printData['spanArr'][rowIndex];
        let _col = 1;
        return [_row, _col];
      }
      return [1, 1];
    },
  }
}

</script>
<style lang="less" scoped>
/deep/ .ant-modal-body {
  padding: 0px;
}

/deep/ .ant-modal-content {
  margin-bottom: 24px;
}
</style>
