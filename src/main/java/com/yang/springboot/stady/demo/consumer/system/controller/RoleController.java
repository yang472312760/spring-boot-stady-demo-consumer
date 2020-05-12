/**
 * RoleController.java
 * Created at 2020-03-27
 * Created by yang
 * Copyright (C) 2019 SAIC VOLKSWAGEN, All rights reserved.
 */
package com.yang.springboot.stady.demo.consumer.system.controller;

import com.yang.springboot.stady.base.model.system.CommonResult;
import com.yang.springboot.stady.base.model.system.Page;
import com.yang.springboot.stady.base.model.system.PageParam;
import com.yang.springboot.stady.demo.consumer.system.model.Role;
import com.yang.springboot.stady.demo.consumer.system.service.RoleService;
import java.util.List;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * ClassName: RoleController
 * </p>
 * <p>
 * Description: 角色控制器
 * </p>
 * <p>
 * Author: yang
 * </p>
 * <p>
 * Date: 2020-03-27
 * </p>
 */
@Slf4j
@RestController
@RequestMapping("/system/role")
@Api(value = "/system/role", description = "角色接口")
public class RoleController {

    /**
     * <p>
     * Description: 角色服务
     * </p>
     */
    @Autowired
    private RoleService roleService;

    /**
     * <p>
     * Description: 分页查询
     * </p>
     *
     * @param paging 分页信息
     * @param role   查询条件
     * @return Result 分页数据
     */
    @ApiOperation(value = "分页查询角色", notes = "分页查询角色")
    @GetMapping("/page")
    public CommonResult<Page<Role>> page(PageParam paging, Role role) {
        List<Role> list = this.roleService.queryPage(paging, role);
        Page<Role> page = new Page<Role>(list);
        return new CommonResult<>().setSuccess(page);
    }

    /**
     * <p>
     * Description: 新增角色
     * </p>
     *
     * @param role 插入角色属性
     * @return Result 是否成功
     */
    @ApiOperation(value = "新增角色接口", notes = "新增角色接口")
    @PostMapping()
    public Boolean insert(@RequestBody Role role) {
        Boolean isOk = this.roleService.save(role);
        return isOk;
    }

    /**
     * <p>
     * Description: 修改角色
     * </p>
     *
     * @param role 要修改的角色，必须包含id
     * @return Result 修改是否成功
     */
    @ApiOperation(value = "修改角色接口", notes = "修改角色接口")
    @PutMapping()
    public Boolean update(@RequestBody Role role) {
        Boolean isOk = this.roleService.updateById(role);
        return isOk;
    }

    /**
     * <p>
     * Description: 删除角色
     * </p>
     *
     * @param id id 根据id删除角色
     * @return Result 是否删除成功
     */
    @ApiOperation(value = "删除角色接口", notes = "删除角色接口")
    @DeleteMapping("/{id}")
    public Boolean delete(@PathVariable("id") Integer id) {
        Boolean isOk = this.roleService.removeById(id);
        return isOk;
    }

    /**
     * <p>
     * Description: 根据ID获取角色接口
     * </p>
     *
     * @param id 用户ID
     * @return Result 角色信息
     */
    @ApiOperation(value = "根据ID获取角色接口", notes = "根据ID获取角色接口")
    @ApiImplicitParam(name = "id", value = "角色信息id", required = true, dataType = "Int", paramType = "path")
    @GetMapping("/{id}")
    public Role getRoleById(@PathVariable Integer id) {
        Role role = this.roleService.getById(id);
        return role;
    }

}
