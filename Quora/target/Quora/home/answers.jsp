<%@ page import="com.zemuto.entity.Answer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zemuto.entity.Question" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<title>Answer - Quora</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/profileCSS.css">
<link rel="stylesheet" href="resources/css/backgroundCSS.css">
<link rel='stylesheet' href="resources/css/openSansCSS.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<style>
    textarea {
        width: 100%;
        height: 100px;
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
    <div class="w3-bar w3-theme-yellow w3-left-align w3-large">
        <a class="w3-theme-yellow w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
        <a href="/home" style="position:fixed; left:192px" class="w3-theme-yellow w3-bar-item w3-button w3-padding-large"><i class="fa fa-home w3-margin-right"></i>Quora</a>
        <a href="/home/answers" style="position:fixed; left:320px" class="w3-bar-item w3-button w3-padding-large w3-hover-white"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Answers</a>
        <a href="/search.jsp" style="position:fixed; left:470px" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-search"></i></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="/" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Logout</a>
        <a href="profile" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="/addQuestion.jsp" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Add Question</a>
    </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1000px;margin-top:60px">
    <!-- The Grid -->
    <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m3">
            <!-- Accordion -->
            <div class="w3-card w3-round">
                <div style="position: fixed; height :220px; width: 240px; top:60px" class="w3-white">
                    <button class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> Top Questions </button>
                    <a href="/home/${sessionScope.get("relatedTopics").get(0).getTopicName()}" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> ${sessionScope.get("relatedTopics").get(0).getTopicName()} </a>
                    <a href="/home/${sessionScope.get("relatedTopics").get(1).getTopicName()}" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> ${sessionScope.get("relatedTopics").get(1).getTopicName()} </a>
                    <a href="/home/${sessionScope.get("relatedTopics").get(2).getTopicName()}" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> ${sessionScope.get("relatedTopics").get(2).getTopicName()} </a>
                    <a href="/home/${sessionScope.get("relatedTopics").get(3).getTopicName()}" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> ${sessionScope.get("relatedTopics").get(3).getTopicName()} </a>
                    <a href="/home/${sessionScope.get("relatedTopics").get(4).getTopicName()}" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> ${sessionScope.get("relatedTopics").get(4).getTopicName()} </a>
                </div>
            </div>
            <br>
            <!-- End Left Column -->
        </div>

        <!-- Middle Column -->
        <div style="position: absolute;left: 450px; width: 700px; top: 45px" class="w3-col m7">

            <% List<Question> followingsAndRelatedTopicsQuestions = (List<Question>) request.getAttribute("followingsAndRelatedTopicsQuestions"); %>
            <% for(Question question : followingsAndRelatedTopicsQuestions) { %>
            <form action="/home/answerQuestion" method="post">
                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <a href="/home/questions/<%=question.getQuestionID()%>"><h4><%=question.getQuestion()%></h4></a>
                    <hr class="w3-clear">
                    <textarea required name="answer" placeholder="Write your answer here..."></textarea>
                    <button formaction="/home/answerQuestion-<%=question.getQuestionID()%>" type="submit" class="w3-button w3-theme-yellow w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Answer</button>
                    <hr class="w3-clear">
                    <img src="<%=question.getUser().getPhoto()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity"><%=question.getAskDate()%></span>
                    <a href="/home/profile/<%=question.getUser().getName()%>-<%=question.getUser().getSurname()%>"><h4><%=question.getUser().getName()%> <%=question.getUser().getSurname()%></h4></a><br>
                    <%--<p><%=question.getAnswer()%></p>--%>
                    <hr class="w3-clear">
                </div>
            </form>
            <% } %>

            <!-- End Middle Column -->
        </div>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer style="position: fixed; width:1366px; height: 45px; bottom: 0px" class="w3-container w3-theme-yellow">
    <p><a href="https://github.com/Mucahit3/MyQuora" target="_blank">MyQuora</a></p>
</footer>

</body>
</html>

