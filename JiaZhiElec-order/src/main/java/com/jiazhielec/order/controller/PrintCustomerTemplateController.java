package com.jiazhielec.order.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jiazhielec.common.annotation.Log;
import com.jiazhielec.common.core.controller.BaseController;
import com.jiazhielec.common.core.domain.AjaxResult;
import com.jiazhielec.common.enums.BusinessType;
import com.jiazhielec.order.domain.PrintCustomerTemplate;
import com.jiazhielec.order.service.IPrintCustomerTemplateService;
import com.jiazhielec.common.utils.poi.ExcelUtil;
import com.jiazhielec.common.core.page.TableDataInfo;

/**
 * 客户模板映射Controller
 * 
 * @author ruoyi
 * @date 2023-09-13
 */
@RestController
@RequestMapping("/print/customerTemplate")
public class PrintCustomerTemplateController extends BaseController
{
    @Autowired
    private IPrintCustomerTemplateService printCustomerTemplateService;

    /**
     * 查询客户模板映射列表
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:list')")
    @GetMapping("/list")
    public TableDataInfo list(PrintCustomerTemplate printCustomerTemplate)
    {
        startPage();
        List<PrintCustomerTemplate> list = printCustomerTemplateService.selectPrintCustomerTemplateList(printCustomerTemplate);
        return getDataTable(list);
    }

    /**
     * 导出客户模板映射列表
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:export')")
    @Log(title = "客户模板映射", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PrintCustomerTemplate printCustomerTemplate)
    {
        List<PrintCustomerTemplate> list = printCustomerTemplateService.selectPrintCustomerTemplateList(printCustomerTemplate);
        ExcelUtil<PrintCustomerTemplate> util = new ExcelUtil<PrintCustomerTemplate>(PrintCustomerTemplate.class);
        util.exportExcel(response, list, "客户模板映射数据");
    }

    /**
     * 获取客户模板映射详细信息
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:query')")
    @GetMapping(value = "/{pingtCustomerTemplateId}")
    public AjaxResult getInfo(@PathVariable("pingtCustomerTemplateId") Long pingtCustomerTemplateId)
    {
        return success(printCustomerTemplateService.selectPrintCustomerTemplateByPingtCustomerTemplateId(pingtCustomerTemplateId));
    }

    /**
     * 新增客户模板映射
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:add')")
    @Log(title = "客户模板映射", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PrintCustomerTemplate printCustomerTemplate)
    {
        return toAjax(printCustomerTemplateService.insertPrintCustomerTemplate(printCustomerTemplate));
    }

    /**
     * 修改客户模板映射
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:edit')")
    @Log(title = "客户模板映射", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PrintCustomerTemplate printCustomerTemplate)
    {
        return toAjax(printCustomerTemplateService.updatePrintCustomerTemplate(printCustomerTemplate));
    }

    /**
     * 删除客户模板映射
     */
    @PreAuthorize("@ss.hasPermi('print:customerTemplate:remove')")
    @Log(title = "客户模板映射", businessType = BusinessType.DELETE)
	@DeleteMapping("/{pingtCustomerTemplateIds}")
    public AjaxResult remove(@PathVariable Long[] pingtCustomerTemplateIds)
    {
        return toAjax(printCustomerTemplateService.deletePrintCustomerTemplateByPingtCustomerTemplateIds(pingtCustomerTemplateIds));
    }
}
