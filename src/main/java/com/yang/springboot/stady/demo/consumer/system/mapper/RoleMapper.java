/**
 * RoleMapper.java
 * Created at 2020-03-27
 * Created by yang
 * Copyright (C) 2019 SAIC VOLKSWAGEN, All rights reserved.
 */
package com.yang.springboot.stady.demo.consumer.system.mapper;

import com.yang.springboot.stady.base.mapper.IBaseMapper;
import com.yang.springboot.stady.demo.consumer.system.model.Role;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


/**
 * <p>
 * ClassName: RoleMapper
 * </p>
 * <p>
 * Description: 角色 Mapper 接口
 * </p>
 * <p>
 * Author: yang
 * </p>
 * <p>
 * Date: 2020-03-27
 * </p>
 */
@Repository
@Mapper
public interface RoleMapper extends IBaseMapper<Role> {

}
