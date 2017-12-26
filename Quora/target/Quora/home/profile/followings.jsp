<%@ page import="com.zemuto.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Muhammet Mucahit
  Date: 12/9/2017
  Time: 7:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<title>Profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="resources/css/profileCSS.css">
<link rel="stylesheet" href="resources/css/backgroundCSS.css">
<link rel='stylesheet' href="resources/css/openSansCSS.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
    <div class="w3-theme-pink w3-bar w3-left-align w3-large">
        <a class="w3-theme-pink w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
        <a href="/home" style="position:fixed; left:192px" class="w3-theme-pink w3-bar-item w3-button w3-padding-large"><i class="fa fa-home w3-margin-right"></i>Quora</a>
        <a href="/home/answers" style="position:fixed; left:320px" class="w3-bar-item w3-button w3-padding-large w3-hover-white"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Answers</a>
        <a href="/search.jsp" style="position:fixed; left:470px" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-search"></i></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="/logout" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Logout</a>
        <a href="/home/profile" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="/addQuestion.jsp" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Add Question</a>
    </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1000px;margin-top:60px">
    <!-- The Grid -->
    <div class="w3-row">

        <% List<User> followingOfCurrentUser = (List<User>) request.getAttribute("followingOfCurrentUser"); %>
        <% for(User following : followingOfCurrentUser) { %>
        <!-- Column -->
        <div class="w3-col m3">
            <!-- Profile -->
            <div class="w3-card w3-round w3-white w3-margin">
                <div class="w3-container">
                    <a href="/home/profile/<%=following.getName()%>-<%=following.getSurname()%>"><h4 class="w3-center"><%=following.getName()%> <%=following.getSurname()%></h4></a>
                    <p class="w3-center"><img src="<%=following.getPhoto()%>" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
                    <hr>
                    <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> <%=following.getJob()%></p>
                    <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> <%=following.getCity()%></p>
                    <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> <%=following.getBirthday()%></p>
                </div>
            </div>
            <br>
            <!-- End Column -->
        </div>
        <% } %>

        <!-- End Grid -->
    </div>
    <!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer style="position: fixed; width:1366px; height: 45px; bottom: 0px" class="w3-container w3-theme-pink">
    <p><a href="https://github.com/Mucahit3/MyQuora" target="_blank">MyQuora</a></p>
</footer>

</body>
</html>

