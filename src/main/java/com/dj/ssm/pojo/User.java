package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 用户实体类
 */
@Data
@TableName("user_mp") // 实体类对应数据库表名
public class User {

    public void aVoid(){
        System.out.println("aa");
        System.out.println("aa1");
    }

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 密码
     */
    private String userPwd;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
     private Date createTime;

    /**
     * 爱好
     */
    private String hobby;

    /**
     * 住址
     */
    private String site;


}
