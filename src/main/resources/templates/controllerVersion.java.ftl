/**
 * ${table.controllerName}.java
 * Created at ${date}
 * Created by ${author}
 * Copyright (C) 2019 SAIC VOLKSWAGEN, All rights reserved.
 */
package ${package.Controller};

import java.util.List;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;

import com.svw.ematrix.core.impexp.excel.model.ExportBody;
import com.svw.ematrix.core.impexp.excel.model.ImportOption;
import com.svw.ematrix.core.log.annotation.SystemLog;
import com.svw.ematrix.core.log.enums.LogType;
import com.svw.ematrix.core.log.enums.OperateType;
import com.svw.ematrix.core.sql.PageParam;
import com.svw.ematrix.core.sql.Page;
import com.svw.ematrix.core.util.ObjectConvertUtils;
import com.svw.ematrix.base.vo.Result;
import com.svw.ematrix.core.util.Constants;
import com.svw.ematrix.core.util.JsonMapper;



<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 *
 * <p>
 * ClassName: ${table.controllerName}
 * </p>
 * <p>
 * Description: ${table.comment!}控制器
 * </p>
 * <p>
 * Author: ${author}
 * </p>
 * <p>
 * Date: ${date}
 * </p>
 */
@Slf4j
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
@Api(value = "<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>", description = "${table.comment!}接口")
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    /**
     * <p>
     * Description: ${table.comment!}服务
     * </p>
     */
    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    /**
     *
     * <p>
     * Description: 分页查询
     * </p>
     *
     * @param paging 分页信息
     * @param ${entity?uncap_first} 查询条件
     * @return Result 分页数据
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.SELECT, valueIsTemplate = true, logContent = "分页查询${table.comment!},结果${r'${param2.success?string(\"成功\", \"失败\")}"'})
    @ApiOperation(value = "分页查询${table.comment!}", notes = "分页查询${table.comment!}")
    @GetMapping("/page")
    public Result page(PageParam paging, ${entity} ${entity?uncap_first}) {
        List<${entity}> list = this.${table.serviceName?uncap_first}.queryPage(paging, ${entity?uncap_first});
        Page<${entity}> page = new Page<${entity}>(list);
        Result result = new Result().successOk(page);
        return result;
    }

    /**
     *
     * <p>
     * Description: 新增${table.comment!}
     * </p>
     *
     * @param ${entity?uncap_first} 插入${table.comment!}属性
     * @return Result 是否成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.INSERT, valueIsTemplate = true, logContent = "新增${table.comment!}--ID【${r'${param0.id!}'}】添加,结果${r'${param1.success?string(\"成功\", \"失败\")}"'})
    @ApiOperation(value = "新增${table.comment!}接口", notes = "新增${table.comment!}接口")
    @PostMapping()
    public Result insert(@RequestBody ${entity} ${entity?uncap_first}) {
        Result result = new Result();
        Boolean isOk = this.${table.serviceName?uncap_first}.save(${entity?uncap_first});
        if (!isOk) {
            return result.errorInternalServer(Constants.SAVE_FAILURE);
        } else {
            return result.successOk(Constants.SAVE_SUCCESS);
        }
    }

    /**
     *
     * <p>
     * Description: 修改${table.comment!}
     * </p>
     *
     * @param ${entity?uncap_first} 要修改的${table.comment!}，必须包含id
     * @return Result 修改是否成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.UPDATE, valueIsTemplate = true, logContent = "修改${table.comment!}--ID【${r'${param0.id!}'}】修改,结果${r'${param1.success?string(\"成功\", \"失败\")}"'})
    @ApiOperation(value = "修改${table.comment!}接口", notes = "修改${table.comment!}接口")
    @PutMapping()
    public Result update(@RequestBody ${entity} ${entity?uncap_first}) {
        Result result = new Result();
        Boolean isOk = this.${table.serviceName?uncap_first}.updateById(${entity?uncap_first});
        if (!isOk) {
            return result.errorInternalServer(Constants.EDIT_FAILURE);
        } else {
            return result.successOk(Constants.EDIT_SUCCESS);
        }
    }

    /**
     *
     * <p>
     * Description: 删除${table.comment!}
     * </p>
     *
     * @param id id 根据id删除${table.comment!}
     * @return Result 是否删除成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.DELETE, valueIsTemplate = true, logContent = "删除${table.comment!}--ID【${r'${param0!}'}】删除,结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "删除${table.comment!}接口", notes = "删除${table.comment!}接口")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        Result result = new Result();
        Boolean isOk = this.${table.serviceName?uncap_first}.removeById(id);
        if (!isOk) {
            return result.errorInternalServer(Constants.DELETE_FAILURE);
        } else {
            return result.successOk(Constants.DELETE_SUCCESS);
        }
    }

    /**
     *
     * <p>
     * Description: 批量删除${table.comment!}
     * </p>
     *
     * @param id id 根据ids删除${table.comment!}
     * @return Result 是否删除成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.DELETE, valueIsTemplate = true, logContent = "批量删除${table.comment!}--ID【${r'${param0!}'}】删除, 结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "批量删除${table.comment!}接口", notes = "批量删除${table.comment!}接口")
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        Result result = new Result();
        if (ids == null || "".equals(ids.trim())) {
            result.errorInternalServer(Constants.DELETE_FAILURE);
                return result;
        } else {
                Boolean isOk = this.${table.serviceName?uncap_first}.removeByIds(Arrays.asList(ids.split(",")));
            if (!isOk) {
                    return result.errorInternalServer(Constants.DELETE_FAILURE);
                } else {
                    return result.successOk(Constants.DELETE_SUCCESS);
                }
        }
    }

    /**
     *
     * <p>
     * Description: 根据ID获取${table.comment!}接口
     * </p>
     *
     * @param id 用户ID
     * @return Result ${table.comment!}信息
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.SELECT, valueIsTemplate = true, logContent = "根据ID获取${table.comment!}--ID【${r'${param0!}'}】, 结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "根据ID获取${table.comment!}接口", notes = "根据ID获取${table.comment!}接口")
    @ApiImplicitParam(name = "id", value = "${table.comment!}信息id", required = true, dataType = "Int", paramType = "path")
    @GetMapping("/{id}")
    public Result get${entity}ById(@PathVariable Integer id) {
        Result result = new Result();
        ${entity} ${entity?uncap_first} = this.${table.serviceName?uncap_first}.getById(id);
        if (${entity?uncap_first} != null) {
            return result.successOk(${entity?uncap_first});
        }
        return result.errorInternalServer(Constants.NOT_FIND_VALUE);
    }

    /**
     *
     * <p>
     * Description: 升级${table.comment!}
     * </p>
     *
     * @param entity 要升级的${table.comment!}，必须包含id
     * @return Result 升级是否成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.VERSION_UPDATE, valueIsTemplate = true, logContent = "升级${table.comment!}--ID【${r'${param0!}'}】, 结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "升级${table.comment!}接口", notes = "升级${table.comment!}接口")
    @PutMapping("/upgrade")
    public Result upgrade(@RequestBody ${entity} entity) {
        Result result = new Result();
        ${entity} ${entity?uncap_first} = this.${table.serviceName?uncap_first}.upgrade(entity);
        if (${entity?uncap_first} != null) {
            return result.successOk(Constants.VERSION_UPGRADE_SUCCESS);
        } else {
            return result.errorInternalServer(Constants.VERSION_UPGRADE_ERROR);
        }
    }

    /**
     *
     * <p>
     * Description: 发布${table.comment!}
     * </p>
     *
     * @param entity 要发布的${table.comment!}，必须包含id
     * @return Result 发布是否成功
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.VERSION_PUBLISH, valueIsTemplate = true, logContent = "发布${table.comment!}--ID【${r'${param0!}'}】, 结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "发布${table.comment!}接口", notes = "发布${table.comment!}接口")
    @PutMapping("/publish")
    public Result publish(@RequestBody ${entity} entity) {
        Result result = new Result();
        boolean isOk = this.${table.serviceName?uncap_first}.publish(entity);
        if (!isOk) {
            return result.errorInternalServer(Constants.VERSION_PUBLISH_ERROR);
        } else {
            return result.successOk(Constants.VERSION_PUBLISH_SUCCESS);
        }
    }
    
    /**
     * <p>
     * Description: 导出${table.comment!}
     * </p>
     * 
     * @param eb 实体+搜索条件
     * @return Result 成功，失败。失败时，带有文件地址
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.EXPORT, valueIsTemplate = true, logContent = "导出${table.comment!}, 结果${r'${param1.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "导出", notes = "提供搜索条件和导出所需参数")
    @PostMapping("/export")
    public Result exportExcel(@RequestBody @Valid ExportBody<${entity}> eb) {
        Result result = new Result();
        String path = this.${table.serviceName?uncap_first}.export${entity}(eb.getEntity(), eb.getOption());
        //文件获取失败
        if (ObjectConvertUtils.isEmpty(path)) {
            result.errorInternalServer(Constants.EXPORT_ERROR);
        } else {
            //文件获取成功
            Map<String, String> mapp = new HashMap<String, String>();
            mapp.put("filePath", path);
            result.successOk(Constants.EXPORT_SUCCESS).setData(mapp);
        }
        return result;
    }

    /**
     * <p>
     * Description: 导入${table.comment!}
     * </p>
     * 
     * @param importOption 导入参数
     * @param file 导入文件
     * @return Result 成功，失败。失败时，带有失败模板文件地址
     */
    @SystemLog(logType = LogType.BUSINESSLOG, operateType = OperateType.IMPORT, valueIsTemplate = true, logContent = "导入${table.comment!}, 结果${r'${param2.success?string(\"成功\", \"失败\")}'}")
    @ApiOperation(value = "导入", notes = "提供导入所需参数")
    @PostMapping("/import")
    public Result importExcel(@RequestParam(value = "importOption") String importOption,
            @RequestParam(value = "file", required = true) MultipartFile file) {
        Result result = new Result();
        if (file == null) {
            result.errorInternalServer(Constants.IMPORT_FILE_ERROR);
        }
        ImportOption options = JsonMapper.fromJsonString(importOption, ImportOption.class);
        String path = this.${table.serviceName?uncap_first}.import${entity}(options, file);
        if (ObjectConvertUtils.isEmpty(path)) {
            result.successOk(Constants.IMPORT_SUCCESS);
        } else {
            //将失败模板地址返回前台。
            Map<String, String> mapp = new HashMap<String, String>();
            mapp.put("filePath", path);
            result.errorInternalServer(Constants.IMPORT_ERROR).setData(mapp);
        }
        return result;
    }
}
</#if>
 