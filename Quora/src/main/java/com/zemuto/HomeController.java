package com.zemuto;

import com.sun.deploy.net.HttpResponse;
import com.zemuto.dao.*;
import com.zemuto.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("home")
public class HomeController {

    @Autowired
    UserDao userDao;
    @Autowired
    QuestionDao questionDao;
    @Autowired
    AnswerDao answerDao;
    @Autowired
    TopicOfQuestionDao topicOfQuestionDao;
    @Autowired
    TopicDao topicDao;
    @Autowired
    TopicOfUserDao topicOfUserDao;

    @RequestMapping("")
    public ModelAndView home(HttpSession httpSession) {

        ModelAndView homepage = new ModelAndView("home.jsp");
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        if (currentUser == null)
            return new ModelAndView("redirect:/");
        List<TopicOfUser> topicsOfUsers = topicOfUserDao.getRelatedTopicsIDs(currentUser);
        List<Topic> relatedTopics = topicDao.getRelatedTopics(topicsOfUsers);
        List<Question> questionsOfOtherUsers = questionDao.getQuestionsFromOtherUsers(String.valueOf(currentUser.getId()));
        homepage.addObject("questionsOfOtherUsers", questionsOfOtherUsers);
        homepage.addObject("relatedTopics", relatedTopics);
        httpSession.setAttribute("relatedTopics", relatedTopics);

        List<User> users = userDao.getUsers(String.valueOf(currentUser.getId()));
        httpSession.setAttribute("users", users);

        return homepage;
    }

    @RequestMapping("/{topicName}")
    public ModelAndView topicName(@PathVariable String topicName, HttpSession httpSession) {
        ModelAndView modelAndView = new ModelAndView("questionsByTopic.jsp");

        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        if (currentUser == null)
            return new ModelAndView("redirect:/");
        List<Question> questionsByTopic = questionDao.getQuestionByTopic(topicName, httpSession);
        modelAndView.addObject("questionsByTopic", questionsByTopic);
        return modelAndView;
    }

    @RequestMapping("/addQuestion")
    public String addQuestion(@RequestParam("questionTopics") String questionTopics, @ModelAttribute Question question, HttpSession httpSession) {

        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        question.setUser(currentUser);
        questionDao.addQuestion(question);
        String[] topicsOfQuestion = questionTopics.split(" ");
        for (int i = 0; i < topicsOfQuestion.length; i++)
            topicsOfQuestion[i] = topicsOfQuestion[i].trim();

        List<Topic> relatedTopicsOfQuestion = topicDao.getRelatedTopics(topicsOfQuestion);

        TopicOfQuestion topicOfQuestion = new TopicOfQuestion();
        topicOfQuestion.setQuestion(question);

        for (int i = 0; i < relatedTopicsOfQuestion.size(); i++) {
            topicOfQuestion.setTopic(relatedTopicsOfQuestion.get(i));
            topicOfQuestionDao.addTopicOfQuestion(topicOfQuestion);
        }
        return "redirect:/home";
    }

    @RequestMapping("answerQuestion-{questionID}")
    public String answerQuestion(@PathVariable long questionID, @ModelAttribute Answer answer, HttpSession httpSession) {

        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        answer.setUser(currentUser);
        answer.setQuestion(questionDao.getQuestionById(questionID));
        answerDao.answerQuestion(answer);
        return "redirect:/home/questions/" + answer.getQuestion().getQuestionID();
    }

    @RequestMapping("answers")
    public ModelAndView getAnswers(HttpSession httpSession) {

        ModelAndView modelAndView = new ModelAndView("answers.jsp");
        User currentUser = (User) httpSession.getAttribute("CurrentUser");

        if (currentUser == null)
            return new ModelAndView("redirect:/");
        List<Question> followingsAndRelatedTopicsQuestions = questionDao.getFollowingsAndRelatedTopicsQuestions(currentUser);
//        List<Answer> answersOfOtherUsers = answerDao.getAnswersFromOtherUsers(currentUser);
//        modelAndView.addObject("answersOfOtherUsers", answersOfOtherUsers);
        modelAndView.addObject("followingsAndRelatedTopicsQuestions", followingsAndRelatedTopicsQuestions);

        return modelAndView;
    }
}
