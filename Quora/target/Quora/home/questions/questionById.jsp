<%@ page import="com.zemuto.entity.Question" %>
<%@ page import="com.zemuto.entity.Answer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<title>Home - Quora</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="resources/css/profileCSS.css">
<link rel="stylesheet" href="resources/css/backgroundCSS.css">
<link rel='stylesheet' href="resources/css/opanSansCSS.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<style>
    textarea {
        width: 100%;
        height: 50px;
        padding: 12px 20px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        background-color: #f8f8f8;
        font-size: 13px;
        resize: none;
        overflow :hidden;
    }
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
        <a href="/home" style="position:fixed; left:192px" class="w3-bar-item w3-button w3-padding-large w3-theme-t25"><i class="fa fa-home w3-margin-right"></i>Quora</a>
        <a href="/home/answers" style="position:fixed; left:320px" class="w3-bar-item w3-button w3-padding-large w3-hover-white"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Answers</a>
        <a href="/search.jsp" style="position:fixed; left:470px" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-search"></i></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="/" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Logout</a>
        <a href="/home/profile" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="/addQuestion.jsp" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Add Question</a>
    </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1000px;margin-top:60px">
    <!-- The Grid -->
    <div class="w3-row">

        <!-- Middle Column -->
        <div style="position: absolute;left: 175px; width: 620px; top: 45px" class="w3-col m7">

            <% Question questionById = (Question) request.getAttribute("questionById"); %>
            <% List<Answer> answersOfSpesificQuestion = (List<Answer>) request.getAttribute("answersOfSpesificQuestion"); %>
            <form action="/home/answerQuestion" method="post">
                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <h4><%=questionById.getQuestion()%></h4>
                    <hr class="w3-clear">
                    <textarea required name="answer" placeholder="Write your answer here..."></textarea>
                    <button formaction="/home/answerQuestion-<%=questionById.getQuestionID()%>" type="submit" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Answer</button>
                    <hr class="w3-clear">
                    <% for(Answer answer : answersOfSpesificQuestion) { %>
                    <img src="<%=answer.getUser().getPhoto()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity"><%=answer.getAnswerDate()%></span>
                    <a href="/home/profile/<%=answer.getUser().getName()%>-<%=answer.getUser().getSurname()%>"><h4><%=answer.getUser().getName()%> <%=answer.getUser().getSurname()%></h4></a><br>
                    <p><%=answer.getAnswer()%></p>
                    <hr class="w3-clear">
                    <% } %>
                </div>
            </form>

            <!-- End Middle Column -->
        </div>

        <!-- Right Column -->
        <div class="w3-col m3">
            <!-- Accordion -->
            <div class="w3-card w3-round">
                <div style="position: absolute; left: 800px; width: 350px; top:60px">
                    <label class="w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> ---------------- Related Questions ---------------- </label>
                    <br>
                    <% List<Question> relatedQuestions = (List<Question>) request.getAttribute("relatedQuestions"); %>
                    <% for(Question question : relatedQuestions) { %>
                    <label class="w3-block w3-theme-l1 w3-left-align"><a href="/home/questions/<%=question.getQuestionID()%>"><%=question.getQuestion()%></a></label>
                    <br>
                    <% } %>
                </div>
            </div>
        <br>
        <!-- End Left Column -->
        </div>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer style="position: fixed; width:1366px; height: 45px; bottom: 0px" class="w3-container w3-theme-d5">
    <p><a href="https://github.com/Mucahit3/MyQuora" target="_blank">MyQuora</a></p>
</footer>

</body>
</html>
