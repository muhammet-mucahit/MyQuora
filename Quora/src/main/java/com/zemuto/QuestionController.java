package com.zemuto;

import com.zemuto.dao.AnswerDao;
import com.zemuto.dao.QuestionDao;
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
@RequestMapping("home/questions")
public class QuestionController {

    @Autowired
    QuestionDao questionDao;

    @Autowired
    AnswerDao answerDao;

    @RequestMapping("")
    public ModelAndView questions(HttpSession httpSession) {

        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        if (currentUser == null)
            return new ModelAndView("redirect:/");
        ModelAndView questionPage = new ModelAndView("questions.jsp");

        return questionPage;
    }

    @RequestMapping("{questionID}")
    public ModelAndView questionById(@PathVariable Long questionID, HttpSession httpSession) {
        ModelAndView questionByIdPage = new ModelAndView("questionById.jsp");
        User currentUser = (User) httpSession.getAttribute("CurrentUser");
        if (currentUser == null)
            return new ModelAndView("redirect:/");
        Question questionById = questionDao.getQuestionById(questionID);
        List<Answer> answersOfSpesificQuestion = answerDao.getAnswersForSpesificQuestion(questionID);
        List<Question> relatedQuestions = questionDao.getRelatedQuestions(questionID);
        questionByIdPage.addObject("questionById", questionById);
        questionByIdPage.addObject("answersOfSpesificQuestion", answersOfSpesificQuestion);
        questionByIdPage.addObject("relatedQuestions", relatedQuestions);
        return questionByIdPage;
    }

    @RequestMapping("/{questionID}-like")
    public String like(@PathVariable Long questionID) {
        System.out.println(questionID);
//        Question currentQuestion = questionDao.getQuestion(question);
//        currentQuestion.setNumberOfVotes(currentQuestion.getNumberOfVotes() + 1);
//        System.out.println(currentQuestion);
//        questionDao.addQuestion(currentQuestion);
        return "redirect:/home";
    }
}
