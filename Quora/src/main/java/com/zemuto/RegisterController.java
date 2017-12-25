package com.zemuto;

import com.zemuto.dao.UserDao;
import com.zemuto.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("register")
public class RegisterController {

    @Autowired
    UserDao userDao;

    @RequestMapping("")
    public String register() {

        return "register.jsp";
    }

    @RequestMapping("addUser")
    public String addUser(@ModelAttribute User user) {

        System.out.println(user);
        userDao.addUser(user);
        return "redirect:/";
    }
}
