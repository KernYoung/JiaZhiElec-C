package com.jiazhielec.order.controller;

import com.jiazhielec.common.annotation.Log;
import com.jiazhielec.common.core.controller.BaseController;
import com.jiazhielec.common.core.domain.AjaxResult;
import com.jiazhielec.common.core.page.TableDataInfo;
import com.jiazhielec.common.enums.BusinessType;
import com.jiazhielec.common.utils.poi.ExcelUtil;
import com.jiazhielec.order.domain.PrintCustomer;
import com.jiazhielec.order.service.IPrintCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 打印客户信息操作处理
 * 
 * @author Kern
 */
@RestController
@RequestMapping("/print/customer")
public class PrintCustomerController extends BaseController
{
    @Autowired
    private IPrintCustomerService printCustomerService;

    /**
     * 获取打印客户列表
     */
    @PreAuthorize("@ss.hasPermi('print:customer:list')")
    @GetMapping("/list")
    public TableDataInfo list(PrintCustomer printCustomer)
    {
        startPage();
        List<PrintCustomer> list = printCustomerService.selectPrintCustomerList(printCustomer);
        return getDataTable(list);
    }

    /**
     * 获取打印客户列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAll(PrintCustomer printCustomer)
    {
        List<PrintCustomer> list = printCustomerService.selectPrintCustomerList(printCustomer);
        return getDataTable(list);
    }
    
    @Log(title = "打印客户管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('print:customer:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, PrintCustomer printCustomer)
    {
        List<PrintCustomer> list = printCustomerService.selectPrintCustomerList(printCustomer);
        ExcelUtil<PrintCustomer> util = new ExcelUtil<PrintCustomer>(PrintCustomer.class);
        util.exportExcel(response, list, "打印客户数据");
    }

    /**
     * 根据打印客户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('print:customer:query')")
    @GetMapping(value = "/{printCustomerId}")
    public AjaxResult getInfo(@PathVariable Long printCustomerId)
    {
        return success(printCustomerService.selectPrintCustomerById(printCustomerId));
    }

    /**
     * 新增打印客户
     */
    @PreAuthorize("@ss.hasPermi('print:customer:add')")
    @Log(title = "打印客户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody PrintCustomer printCustomer)
    {
        if (!printCustomerService.checkPrintCustomerNameUnique(printCustomer))
        {
            return error("新增客户'" + printCustomer.getCustomerName() + "'失败，客户名称已存在");
        }
        else if (!printCustomerService.checkPrintCustomerCodeUnique(printCustomer))
        {
            return error("新增客户'" + printCustomer.getCustomerCode() + "'失败，客户代码已存在");
        }
        printCustomer.setCreateBy(getUsername());
        return toAjax(printCustomerService.insertPrintCustomer(printCustomer));
    }

    /**
     * 修改打印客户
     */
    @PreAuthorize("@ss.hasPermi('print:customer:edit')")
    @Log(title = "打印客户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody PrintCustomer printCustomer)
    {
        if (!printCustomerService.checkPrintCustomerNameUnique(printCustomer))
        {
            return error("修改客户'" + printCustomer.getCustomerCode() + "'失败，客户代码已存在");
        }
        else if (!printCustomerService.checkPrintCustomerCodeUnique(printCustomer))
        {
            return error("修改客户'" + printCustomer.getCustomerCode() + "'失败，客户代码已存在");
        }

        printCustomer.setUpdateBy(getUsername());
        return toAjax(printCustomerService.updatePrintCustomer(printCustomer));
    }

    /**
     * 删除打印客户
     */
    @PreAuthorize("@ss.hasPermi('print:customer:remove')")
    @Log(title = "打印客户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{printCustomerIds}")
    public AjaxResult remove(@PathVariable Long[] printCustomerIds)
    {
        return toAjax(printCustomerService.deletePrintCustomerByIds(printCustomerIds));
    }

//    /**
//     * 获取打印客户选择框列表
//     */
//    @GetMapping("/optionselect")
//    public AjaxResult optionselect()
//    {
//        List<PrintCustomer> printCustomers = printCustomerService.selectPrintCustomerAll();
//        return success(printCustomers);
//    }
}
