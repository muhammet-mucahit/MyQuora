package com.zemuto;

import com.zemuto.dao.*;
import com.zemuto.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("home/profile")
public class ProfileController {

    @Autowired
    FollowingDao followingDao;
    @Autowired
    UserDao userDao;
    @Autowired
    QuestionDao questionDao;
    @Autowired
    TopicOfUserDao topicOfUserDao;
    @Autowired
    TopicDao topicDao;

    @RequestMapping("")
    public ModelAndView profile(HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView("profile.jsp");
        User currentUser = (User) httpSession.getAttribute("CurrentUser");

        List<Question> questionsOfCurrentUser = questionDao.getQuestionsOfCurrentUser(String.valueOf(currentUser.getId()));
        modelAndView.addObject("questionsOfCurrentUser", questionsOfCurrentUser);
//        List<User> users = userDao.getUsers(String.valueOf(currentUser.getId()));
//        modelAndView.addObject("users", users);
        modelAndView.addObject("currentUser", currentUser);

        List<TopicOfUser> topicsOfUsers = topicOfUserDao.getRelatedTopicsIDs(currentUser);
        List<Topic> relatedTopics = topicDao.getRelatedTopics(topicsOfUsers);
        modelAndView.addObject("relatedTopics", relatedTopics);

        return modelAndView;
    }

    @RequestMapping({"/{userName:[A-Za-z]+}-{userSurname:[A-Za-z]+}"})
    public ModelAndView profile(@PathVariable String userName, @PathVariable String userSurname, HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView("otherProfile.jsp");
        User currentUser = userDao.getUser(userName, userSurname);
        modelAndView.addObject("currentUser", currentUser);

        List<Question> questionsOfCurrentUser = questionDao.getQuestionsOfCurrentUser(String.valueOf(currentUser.getId()));
        modelAndView.addObject("questionsOfCurrentUser", questionsOfCurrentUser);

        List<TopicOfUser> topicsOfUsers = topicOfUserDao.getRelatedTopicsIDs(currentUser);
        List<Topic> relatedTopics = topicDao.getRelatedTopics(topicsOfUsers);
        modelAndView.addObject("relatedTopics", relatedTopics);

        User follower = (User) httpSession.getAttribute("CurrentUser");

        List<Following> isFollowing = followingDao.isFollowing(follower, currentUser);
        modelAndView.addObject("isFollowing", isFollowing);

        return modelAndView;
    }

    @RequestMapping({"/{userName:[A-Za-z]+}-{userSurname:[A-Za-z]+}-follow"})
    public String follow(@PathVariable String userName, @PathVariable String userSurname, HttpSession httpSession) {
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        User followed = userDao.getUser(userName, userSurname);
        Following following = new Following();
        following.setFollower(currentUser);
        following.setFollowed(followed);
        followingDao.follow(following);
        return "/home/profile/"+userName+"-"+userSurname;
    }

    @RequestMapping({"/{userName:[A-Za-z]+}-{userSurname:[A-Za-z]+}-unfollow"})
    public String unfollow(@PathVariable String userName, @PathVariable String userSurname, HttpSession httpSession) {
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        User followed = userDao.getUser(userName, userSurname);
        followingDao.unfollow(currentUser, followed);
        return "/home/profile/"+userName+"-"+userSurname;
    }

    @RequestMapping("/{userName:[A-Za-z]+}-{userSurname:[A-Za-z]+}-followers")
    public ModelAndView followers(@PathVariable String userName, @PathVariable String userSurname) {
        User user = userDao.getUser(userName, userSurname);
        List<User> followerOfCurrentUser = userDao.getFollowers(user);
        ModelAndView modelAndView = new ModelAndView("followers.jsp");
        modelAndView.addObject("followerOfCurrentUser", followerOfCurrentUser);
        return modelAndView;
    }

    @RequestMapping("/{userName:[A-Za-z]+}-{userSurname:[A-Za-z]+}-followings")
    public ModelAndView followings(@PathVariable String userName, @PathVariable String userSurname) {
        User user = userDao.getUser(userName, userSurname);
        List<User> followingOfCurrentUser = userDao.getFollowing(user);
        ModelAndView modelAndView = new ModelAndView("followings.jsp");
        modelAndView.addObject("followingOfCurrentUser", followingOfCurrentUser);
        return modelAndView;
    }

    @RequestMapping("/followers")
    public ModelAndView currentUserFollowers(HttpSession httpSession) {
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        List<User> followerOfCurrentUser = userDao.getFollowers(currentUser);
        ModelAndView modelAndView = new ModelAndView("followers.jsp");
        modelAndView.addObject("followerOfCurrentUser", followerOfCurrentUser);
        return modelAndView;
    }

    @RequestMapping("/followings")
    public ModelAndView currentUserFollowings(HttpSession httpSession) {
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        List<User> followingOfCurrentUser = userDao.getFollowing(currentUser);
        ModelAndView modelAndView = new ModelAndView("followings.jsp");
        modelAndView.addObject("followingOfCurrentUser", followingOfCurrentUser);
        return modelAndView;
    }
}
