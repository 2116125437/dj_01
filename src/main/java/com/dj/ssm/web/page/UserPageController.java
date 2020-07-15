package com.dj.ssm.web.page;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    /**
     * 去用户展示页面
     * @return
     */
    @RequestMapping("toShow")
    private String toShow(){
        return "user/show";
    }


    /**
     * 去用户新增页面
     * @return
     */
    @RequestMapping("toAdd")
    private String toAdd(){
        return "user/add";
    }


    /**
     * 去用户新增页面
     * @return
     */
    @RequestMapping("toUpdUser")
    private String toUpdUser(Integer id, Model model){
        User user = userService.getById(id);
        model.addAttribute("user",user);
        return "user/update";
    }


    /**
     * 去用户批量新增页面
     * @return
     */
    @RequestMapping("toAddUsers")
    private String toAddUsers(){
        return "user/addsUser";
    }
}
