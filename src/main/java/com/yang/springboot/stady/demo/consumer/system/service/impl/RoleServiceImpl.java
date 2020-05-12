/**
 * RoleServiceImpl.java
 * Created at 2020-03-27
 * Created by yang
 * Copyright (C) 2019 SAIC VOLKSWAGEN, All rights reserved.
 */
package com.yang.springboot.stady.demo.consumer.system.service.impl;

import com.yang.springboot.stady.base.service.impl.BaseServiceImpl;
import com.yang.springboot.stady.demo.consumer.system.mapper.RoleMapper;
import com.yang.springboot.stady.demo.consumer.system.model.Role;
import com.yang.springboot.stady.demo.consumer.system.service.RoleService;
import org.springframework.stereotype.Service;

import org.apache.ibatis.annotations.Param;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
/**
 *
 * <p>
 * ClassName: RoleServiceImpl
 * </p>
 * <p>
 * Description: 角色 服务实现类
 * </p>
 * <p>
 * Author: yang
 * </p>
 * <p>
 * Date: 2020-03-27
 * </p>
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {


}
