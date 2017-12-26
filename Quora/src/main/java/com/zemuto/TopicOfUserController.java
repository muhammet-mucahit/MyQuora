package com.zemuto;

import com.zemuto.dao.TopicDao;
import com.zemuto.dao.TopicOfUserDao;
import com.zemuto.entity.Topic;
import com.zemuto.entity.TopicOfUser;
import com.zemuto.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TopicOfUserController {

    @Autowired
    TopicOfUserDao topicOfUserDao;
    @Autowired
    TopicDao topicDao;

    @RequestMapping("/topics")
    public String topics(@RequestParam("topic") String[] topicNames, HttpSession httpSession) {

        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        if (currentUser == null)
            return "redirect:/";
        TopicOfUser topicOfUser = new TopicOfUser();
        List<Topic> relatedTopics = topicDao.getRelatedTopics(topicNames);
        for (int i = 0; i < 5; i++) {
            topicOfUser.setTopic(relatedTopics.get(i));
            topicOfUser.setUser((User) httpSession.getAttribute("CurrentUser"));
            topicOfUserDao.addTopicOfUser(topicOfUser);
        }

        ModelAndView modelAndView = new ModelAndView("home.jsp");
        modelAndView.addObject("relatedTopics", relatedTopics);
        new ModelAndView("profile.jsp").addObject("relatedTopics", relatedTopics);
        return "redirect:/home";
    }
}
