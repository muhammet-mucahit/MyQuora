<head>
    <link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="resources/css/login_register.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login</title>
</head>

<body>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>

<div class="login">
    <h2 class="active"> Login </h2>

    <form method="post">
        <input type="email" class="text" name="email" placeholder="Enter your email" autofocus>
        <span>email</span>

        <br>
        <input type="password" class="text" name="password" placeholder="Enter your password">
        <span>password</span>
        </br>

        <button class="signin" formaction="/login">Login</button>
        <button class="signin" formaction="/register">Register</button>
    </form>
</div>

</body>
