<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="resources/css/register.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Register</title>
</head>

<div class="login">

    <form method="post">
        <h2 class="active"> Register </h2>
        <br>

        <div id="ana_div">
            <div class="div" id="div">

                <input type="text" class="text" name="name" required>
                <span>name</span>

                <input type="text" class="text" name="surname" required>
                <span>surname</span>

                <input type="text" class="text" name="job" required>
                <span>job</span>

                <input type="text" class="text" name="city" required>
                <span>city</span>

            </div>
            <div class="div" id="div2">

                <input type="date" class="text" name="birthday" required>
                <span>birthday</span>

                <input type="email" class="text" name="email" required>
                <span>email</span>

                <input type="password" class="text" name="password" required>
                <span>password</span>
            </div>
            <div class="div3" id="div3">
                <label class="container"> Male <input value=0 type="radio" checked="checked" name="gender"><span class="checkmark"></span></label>
                <label class="container"> Female <input value=1 type="radio" name="gender"><span class="checkmark"></span></label>
            </div>
        </div>

        <button class="signin" formaction="register/addUser">Register</button>
    </form>
</div>
</html>