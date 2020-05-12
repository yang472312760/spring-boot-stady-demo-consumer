/**
 * Role.java
 * Created at 2020-03-27
 * Created by yang
 * Copyright (C) 2019 SAIC VOLKSWAGEN, All rights reserved.
 */
package com.yang.springboot.stady.demo.consumer.system.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * ClassName: Role
 * </p>
 * <p>
 * Description: 角色
 * </p>
 * <p>
 * Author: yang
 * </p>
 * <p>
 * Date: 2020-03-27
 * </p>
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_role")
@ApiModel(value = "Role对象", description = "角色")
public class Role implements Serializable {

    /**
     * <p>Field serialVersionUID: 序列化</p>
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>Description: 主键</p>
     */
    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * <p>Description: 名称</p>
     */
    @ApiModelProperty(value = "名称")
    private String roleName;

    /**
     * <p>Description: 性别</p>
     */
    @ApiModelProperty(value = "性别")
    private Integer sex;

    private Integer isDelete;

    /**
     * <p>Description: 创建时间</p>
     */
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    /**
     * <p>Description: 排序</p>
     */
    @ApiModelProperty(value = "排序")
    private Integer orderBy;

    private String type;



}
