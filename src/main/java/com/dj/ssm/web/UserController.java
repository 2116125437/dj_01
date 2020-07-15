package com.dj.ssm.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import com.dj.ssm.service.user.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户展示
     * @return
     */
    @RequestMapping("show")
    private ResultModel show(Integer pageNo, Model model, String userName,
            Integer sex, String[] hobby){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //条件构造器
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.orderByDesc("create_time");
            if (!StringUtils.isEmpty(userName)){
                queryWrapper.like("user_name", userName);
            }
            if (!StringUtils.isEmpty(sex)){
                queryWrapper.eq("sex", sex);
            }
            if (!StringUtils.isEmpty(hobby)){
                queryWrapper.in("hobby", hobby);
//                for (int i = 0; i < hobby.length ; i++) {
//                    queryWrapper.or().eq("hobby", hobby[i]);
//                }
            }
            IPage<User> page = new Page<>(pageNo, 5);
            IPage<User> pageInfo = userService.page(page, queryWrapper);

           // List<User> userList = userService.list();
            map.put("list", pageInfo.getRecords());
            map.put("pages", pageInfo.getPages());
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


    /**
     * 用户新增
     * @return
     */
    @RequestMapping("addUser")
    private ResultModel addUser(User user){
        try {
            if (StringUtils.isEmpty(user.getUserName())||StringUtils.isEmpty(user.getUserPwd())||StringUtils.isEmpty(user.getAge())||
                    StringUtils.isEmpty(user.getSex())||StringUtils.isEmpty(user.getHobby())||StringUtils.isEmpty(user.getSite())){
                return new ResultModel().error("请填写");
            }
            user.setCreateTime(new Date());
            userService.save(user);
            return new ResultModel<Object>().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 用户删除
     * @return
     */
    @RequestMapping("delUser")
    private ResultModel delUser(Integer id){
        try {
            userService.removeById(id);
            return new ResultModel<Object>().success("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


    /**
     * 用户修改
     * @return
     */
    @RequestMapping("updateUser")
    private ResultModel updateUser(User user){
        try {
            userService.updateById(user);
            return new ResultModel<Object>().success("修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


    /**
     * 批量删除
     * @return
     */
    @RequestMapping("deleteUser")
    private ResultModel deleteUser(@RequestParam("ids[]") Integer[] ids){
        try {
            List<Integer> list = Arrays.asList(ids);
            userService.removeByIds(list);
            return new ResultModel<Object>().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 批量新增
     * @return
     */
    @RequestMapping("addUsers")
    public ResultModel addUsers() {
        try {
            // 构造数据
            List<User> userList = new ArrayList<>();
            User user1 = new User();
            user1.setUserName("q5");
            user1.setSex(1);
            user1.setAge(22);
            user1.setUserPwd("123");
            user1.setHobby("0");
            user1.setSite("12qqw");
            user1.setCreateTime(new Date());
            User user2 = new User();
            user2.setUserName("s5");
            user2.setSex(0);
            user2.setAge(22);
            user2.setUserPwd("123");
            user2.setHobby("1");
            user2.setSite("qqw");
            user2.setCreateTime(new Date());
            userList.add(user1);
            userList.add(user2);
            // 批量新增
            userService.saveBatch(userList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


    /**
     * 批量新增
     * @return
     */
    @RequestMapping("batchAdd")
    public Map<String, Object> batchAdd(UserQuery query) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            List<User> list = new ArrayList<>();
            for (User u : query.getList()) {
                if (StringUtils.isEmpty(u.getUserName())) {
                    continue;
                }
                u.setCreateTime(new Date());
                list.add(u);
            }
            // 批量新增
            userService.saveBatch(list);
            map.put("code", 200);
            map.put("msg", "添加成功");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("{id}")
    public ResultModel get(@PathVariable Integer id) {
        try {
            User user = userService.getById(id);
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
