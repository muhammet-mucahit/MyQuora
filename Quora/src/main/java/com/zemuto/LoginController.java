package com.zemuto;

import com.zemuto.dao.QuestionDao;
import com.zemuto.dao.TopicDao;
import com.zemuto.dao.TopicOfUserDao;
import com.zemuto.dao.UserDao;
import com.zemuto.entity.Question;
import com.zemuto.entity.Topic;
import com.zemuto.entity.TopicOfUser;
import com.zemuto.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    UserDao userDao;
    @Autowired
    QuestionDao questionDao;
    @Autowired
    TopicOfUserDao topicOfUserDao;
    @Autowired
    TopicDao topicDao;

    @RequestMapping("")
    public String index() {

        return "login.jsp";
    }

    @RequestMapping("login")
    public ModelAndView verify(@ModelAttribute User user, HttpSession httpSession) {

        ModelAndView fail = new ModelAndView("");
        ModelAndView success;

        if(userDao.verify(user, httpSession)) {
            User currentUser = (User) httpSession.getAttribute("CurrentUser");
            if (topicOfUserDao.isNewUser(currentUser)) {
                success = new ModelAndView("firstTopic.jsp");
            }
            else {
                success = new ModelAndView("redirect:home");
            }

            return success;
        }
        return fail;
    }

    @RequestMapping(value="/logout")
    public String closeSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
}
