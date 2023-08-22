package com.jiazhielec.order.controller;

import com.jiazhielec.common.annotation.Log;
import com.jiazhielec.common.core.controller.BaseController;
import com.jiazhielec.common.core.domain.AjaxResult;
import com.jiazhielec.common.core.page.TableDataInfo;
import com.jiazhielec.common.enums.BusinessType;
import com.jiazhielec.common.utils.poi.ExcelUtil;
import com.jiazhielec.order.domain.PrintTemplate;
import com.jiazhielec.order.service.IPrintTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 打印模板信息操作处理
 * 
 * @author Kern
 */
@RestController
@RequestMapping("/print/template")
public class PrintTemplateController extends BaseController
{
    @Autowired
    private IPrintTemplateService printTemplateService;

    /**
     * 获取打印模板列表
     */
    @PreAuthorize("@ss.hasPermi('print:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(PrintTemplate printTemplate)
    {
        startPage();
        List<PrintTemplate> list = printTemplateService.selectPrintTemplateList(printTemplate);
        return getDataTable(list);
    }
    
    @Log(title = "打印模板管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('print:template:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, PrintTemplate printTemplate)
    {
        List<PrintTemplate> list = printTemplateService.selectPrintTemplateList(printTemplate);
        ExcelUtil<PrintTemplate> util = new ExcelUtil<PrintTemplate>(PrintTemplate.class);
        util.exportExcel(response, list, "打印模板数据");
    }

    /**
     * 根据打印模板编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('print:template:query')")
    @GetMapping(value = "/{printTemplateId}")
    public AjaxResult getInfo(@PathVariable Long printTemplateId)
    {
        return success(printTemplateService.selectPrintTemplateById(printTemplateId));
    }

    /**
     * 新增打印模板
     */
    @PreAuthorize("@ss.hasPermi('print:template:add')")
    @Log(title = "打印模板管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody PrintTemplate printTemplate)
    {
        if (!printTemplateService.checkPrintTemplateNameUnique(printTemplate))
        {
            return error("新增打印模板'" + printTemplate.getTemplateName() + "'失败，打印模板名称已存在");
        }

        printTemplate.setCreateBy(getUsername());
        return toAjax(printTemplateService.insertPrintTemplate(printTemplate));
    }

    /**
     * 修改打印模板
     */
    @PreAuthorize("@ss.hasPermi('print:template:edit')")
    @Log(title = "打印模板管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody PrintTemplate printTemplate)
    {
        if (!printTemplateService.checkPrintTemplateNameUnique(printTemplate))
        {
            return error("修改打印模板'" + printTemplate.getTemplateName() + "'失败，打印模板名称已存在");
        }

        printTemplate.setUpdateBy(getUsername());
        return toAjax(printTemplateService.updatePrintTemplate(printTemplate));
    }

    /**
     * 删除打印模板
     */
    @PreAuthorize("@ss.hasPermi('print:template:remove')")
    @Log(title = "打印模板管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{printTemplateIds}")
    public AjaxResult remove(@PathVariable Long[] printTemplateIds)
    {
        return toAjax(printTemplateService.deletePrintTemplateByIds(printTemplateIds));
    }

//    /**
//     * 获取打印模板选择框列表
//     */
//    @GetMapping("/optionselect")
//    public AjaxResult optionselect()
//    {
//        List<PrintTemplate> printTemplates = printTemplateService.selectPrintTemplateAll();
//        return success(printTemplates);
//    }
}
