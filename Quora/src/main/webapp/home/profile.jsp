<%@ page import="com.zemuto.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<title>Profile</title>
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
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-theme-black w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-black" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
        <a href="/home" style="position:fixed; left:192px" class="w3-bar-item w3-button w3-padding-large w3-theme-black"><i class="fa fa-home w3-margin-right"></i>Quora</a>
        <a href="/home/answers" style="position:fixed; left:320px" class="w3-bar-item w3-button w3-padding-large w3-hover-white"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Answers</a>
        <a href="/search.jsp" style="position:fixed; left:470px" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-search"></i></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="/" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Logout</a>
        <a href="" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="/addQuestion.jsp" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Add Question</a>
    </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1000px;margin-top:60px">
    <!-- The Grid -->
    <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m3">
            <!-- Profile -->
            <div style="position: fixed; height :310px; width: 240px; top:60px" class="w3-card w3-round w3-white">
                <div class="w3-container">
                    <h4 class="w3-center">${sessionScope.get("CurrentUser").getName()} ${sessionScope.get("CurrentUser").getSurname()}</h4>
                    <p class="w3-center"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
                    <hr>
                    <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${sessionScope.get("CurrentUser").getJob()}</p>
                    <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> ${sessionScope.get("CurrentUser").getCity()}</p>
                    <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> ${sessionScope.get("CurrentUser").getBirthday()}</p>
                </div>
            </div>
            <br>

            <!-- Accordion -->
            <div style="position:fixed; top:380px;  width:240px; height:76px" class="w3-card w3-round w3-white">
                <form method="post">
                    <button formaction="profile/followers" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> Followers </button>
                    <button formaction="profile/followings" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> Following </button>
                  </form>
            </div>
            <br>

            <!-- Interests -->
            <div style="position:fixed; top:470px; width:240px; height:110px" class="w3-card w3-round w3-white w3-hide-small">
                <div class="w3-container">
                    <p>Topics</p>
                    <p>
                        <span class="w3-tag w3-small w3-theme-d5">${relatedTopics.get(0).getTopicName()}</span>
                        <span class="w3-tag w3-small w3-theme-d4">${relatedTopics.get(1).getTopicName()}</span>
                        <span class="w3-tag w3-small w3-theme-d3">${relatedTopics.get(2).getTopicName()}</span>
                        <span class="w3-tag w3-small w3-theme-d2">${relatedTopics.get(3).getTopicName()}</span>
                        <span class="w3-tag w3-small w3-theme-d1">${relatedTopics.get(4).getTopicName()}</span>
                    </p>
                </div>
            </div>
            <br>

            <!-- End Left Column -->
        </div>

        <!-- Middle Column -->
        <div style="position: absolute;left: 450px; width: 700px; top: 45px" class="w3-col m7">

            <% List<Question> questionsOfCurrentUser = (List<Question>) request.getAttribute("questionsOfCurrentUser"); %>
            <% for(Question question : questionsOfCurrentUser) { %>
            <form method="post">
                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="<%=question.getUser().getPhoto()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity"><%=question.getAskDate()%></span>
                    <h4><%=question.getUser().getName()%> <%=question.getUser().getSurname()%></h4><br>
                    <a href="/home/questions/<%=question.getQuestionID()%>"><p><%=question.getQuestion()%></p></a>
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

<footer style="position: fixed; width:1366px; height: 45px; bottom: 0px" class="w3-container w3-theme-black">
    <p><a href="https://github.com/Mucahit3/MyQuora" target="_blank">MyQuora</a></p>
</footer>

</body>
</html>

