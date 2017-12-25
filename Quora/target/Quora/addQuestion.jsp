<%@ page import="com.zemuto.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.6.2.js"></script>
    <title>Add Question</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="resources/css/profileCSS.css">
    <link rel="stylesheet" href="resources/css/backgroundCSS.css">
    <link rel='stylesheet' href="resources/css/openSansCSS.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#myModal").modal('show');
        });
    </script>
    <style>
        label[for=animal-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=animal-1] input[type="checkbox"] {

            background-image: url("resources/images/photos/animals.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display:block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin:0 6px 0 0;
            text-align:  ;
            text-underline-position:
            vertical-align: middle;
            position:absolute; top:85px; left: 20px;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=animal-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/animals.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=art-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=art-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/art.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display:block;
            float:bottom;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin:0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:85px; left: 110px;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=art-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/art.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=beauty-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=beauty-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/beauty.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display:block;
            float:left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin:0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:85px; left:200px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=beauty-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/beauty.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=books-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=books-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/books.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:85px; left:290px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=books-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/books.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=cars-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=cars-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/cars.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:85px; left:380px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=cars-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/cars.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=computers-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=computers-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/computers.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:85px; left:470px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=computers-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/computers.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=cooking-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=cooking-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/cooking.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:20px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=cooking-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/cooking.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=educaiton-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=educaiton-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/education.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 2px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:110px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=educaiton-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/education.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=games-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=games-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/games.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:200px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=games-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/games.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=jobs-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=jobs-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/jobs.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:290px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=jobs-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/jobs.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=health-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=health-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/health.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:380px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=health-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/health.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=movies-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=movies-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/movies.jpg") ;
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:190px; left:470px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=movies-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/movies.jpg");
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=religions-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=religions-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/religions.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:20px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=religions-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/religions.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=smoking-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=smoking-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/smoking.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:110px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=smoking-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/smoking.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=software-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=software-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/software.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:200px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=software-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/software.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=sports-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=sports-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/sports.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:290px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=sports-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/sports.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=technology-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=technology-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/technology.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:380px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=technology-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/technology.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }
        label[for=travel-1]{
            height:75px;
            line-height:75px;
            overflow:hidden;
            display:inline-block;
            border-radius:10px;
        }
        label[for=travel-1] input[type="checkbox"] {
            background-image: url("resources/images/photos/travel.jpg");
            background-size: 65px 65px;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 10;
            display: block;
            float: left;
            font-size: 16px;
            height: 75px;
            width: 75px;
            line-height: 12px;
            margin: 0 6px 0 0;
            text-align: center;
            vertical-align: middle;
            position:absolute; top:295px; left:470px ;
            border-radius: 10px;
            background-color: #5571ff;
            -webkit-appearance:none;
            -moz-appearance:none;
            -ms-appearance:none;
            appearance:none;
            outline:0;
            border:none;
        }
        label[for=travel-1] input[type="checkbox"]:checked{
            background-image: url("resources/images/photos/travel.jpg") ;
            background-size: 65px 65px;
            background-color: #37924A;
        }

        textarea {
            width: 100%;
            height: 100px;
            padding: 12px 20px;
            background-color: #f8f8f8;
            font-size: 16px;
            resize: none;

        }

        input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            background-color: #f8f8f8;
        }

        input[type=submit]{
            background-color: #5571ff;
            border: none;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            margin: 6px 6px;
            cursor: pointer;
        }

    </style>
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
    </style>
</head>
<body class="w3-theme-l5">

<div class="w3-top">
    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
        <a href="/home" style="position:fixed; left:192px" class="w3-bar-item w3-button w3-padding-large w3-theme-t25"><i class="fa fa-home w3-margin-right"></i>Quora</a>
        <a href="/home/answers" style="position:fixed; left:320px" class="w3-bar-item w3-button w3-padding-large w3-hover-white"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Answers</a>
        <a href="search.jsp" style="position:fixed; left:470px" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-search"></i></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">      </a>
        <a href="/" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Logout</a>
        <a href="/home/profile" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src=${sessionScope.get("CurrentUser").getPhoto()} class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white">Add Question</a>
    </div>
</div>

<form action="/home/addQuestion" method="post">
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title;" style="position:center"> Please select 5 topics which are related with your questions </h4>
                </div>
                <div style="max-height: 100%" class="frm_opt_container">
                    <div class="frm_checkbox" id="frm_checkbox_84-1">
                        <label for="animal-1">
                            <input type="checkbox" name="topic" id="animal-1" value="Animals"/>
                            <div style="position:fixed; left: 34px; top: 135px " > Animals </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-2">
                        <label for="art-1">
                            <input type="checkbox" name="topic" id="art-1" value="Art"/>
                            <div style="position:fixed; left: 135px; top: 135px " > Art </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-3">
                        <label for="beauty-1">
                            <input type="checkbox" name="topic" id="beauty-1" value="Beauty"/>
                            <div style="position:fixed; left: 215px; top: 135px " > Beauty </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-4">
                        <label for="books-1">
                            <input type="checkbox" name="topic" id="books-1" value="Books"/>
                            <div style="position:fixed; left: 307px; top: 135px " > Books </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-1">
                        <label for="cars-1">
                            <input type="checkbox" name="topic" id="cars-1" value="Cars"/>
                            <div style="position:fixed; left: 402px; top: 135px " > Cars </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-2">
                        <label for="computers-1">
                            <input type="checkbox" name="topic" id="computers-1" value="Computers"/>
                            <div style="position:fixed; left: 472px; top: 135px " > Computers </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-3">
                        <label for="cooking-1">
                            <input type="checkbox" name="topic" id="cooking-1" value="Cooking"/>
                            <div style="position:fixed; left: 34px; top: 240px " > Cooking </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-4">
                        <label for="educaiton-1">
                            <input type="checkbox" name="topic" id="educaiton-1" value="Education"/>
                            <div style="position:fixed; left: 117px; top: 240px " > Education </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-1">
                        <label for="games-1">
                            <input type="checkbox" name="topic" id="games-1" value="Games"/>
                            <div style="position:fixed; left: 217px; top: 240px " > Games </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-2">
                        <label for="jobs-1">
                            <input type="checkbox" name="topic" id="jobs-1" value="Jobs"/>
                            <div style="position:fixed; left: 315px; top: 240px " > Jobs </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-3">
                        <label for="health-1">
                            <input type="checkbox" name="topic" id="health-1" value="Health"/>
                            <div style="position:fixed; left: 400px; top: 240px " > Health </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-4">
                        <label for="movies-1">
                            <input type="checkbox" name="topic" id="movies-1" value="Movies"/>
                            <div style="position:fixed; left: 485px; top: 240px " > Movies </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-1">
                        <label for="religions-1">
                            <input type="checkbox" name="topic" id="religions-1" value="Religions"/>
                            <div style="position:fixed; left: 25px; top: 345px " > Religions </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-2">
                        <label for="smoking-1">
                            <input type="checkbox" name="topic" id="smoking-1" value="Smoking"/>
                            <div style="position:fixed; left: 115px; top:345px " > Smooking </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-3">
                        <label for="software-1">
                            <input type="checkbox" name="topic" id="software-1" value="Software"/>
                            <div style="position:fixed; left:210px; top:345px" > Software </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-4">
                        <label for="sports-1">
                            <input type="checkbox" name="topic" id="sports-1" value="Sports"/>
                            <div style="position:fixed; left: 305px; top: 345px " > Sports </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-1">
                        <label for="technology-1">
                            <input type="checkbox" name="topic" id="technology-1" value="Technology"/>
                            <div style="position:fixed; left: 382px; top: 345px " > Technology </div>
                        </label>
                    </div>
                    <div class="frm_checkbox" id="frm_checkbox_84-2">
                        <label for="travel-1">
                            <input type="checkbox" name="topic" id="travel-1" value="Travel"/>
                            <div style="position:fixed; left: 487px; top: 345px " > Travel </div>
                        </label>
                    </div>
                    <div style="position: absolute; top: 400px; width: 90%; left: 25px;">
                        <input type="text"     name = "questionTopics" id="questionTopics" readonly><br>
                        <textarea name="question" cols="30" rows="10"></textarea>
                        <input type="submit"   value="Submit" disabled>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    var checkboxes = $("input[type='checkbox']"),
        submitButt = $("input[type='submit']");

    checkboxes.click(function() {
        submitButt.attr("disabled", !($(":checkbox:checked").length >= 5));
    });
</script>

<script>
    $(document).ready(function(){
        $("input:checkbox").click(function() {
            var output = "";
            $("input:checked").each(function() {
                output += $(this).val() + " ";
            });

            $("#questionTopics").val(output.trim());

        });
    });
</script>
</body>
</html>
