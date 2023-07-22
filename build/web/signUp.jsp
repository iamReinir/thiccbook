<%-- 
    Document   : signup
    Created on : 20/07/2023, 8:42:02 PM
    Author     : Giga P34
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Sign Up</title>
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/bookForm.css">
    </head>
    <body>             
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/navBar.jspf" %>
        <section id="signup">            
            <form method="POST">
                <label for="username">Your username:</label><br/>
                <input type="text" id="username" name="username" placeholder="Username"/><br/>
                <label for="username">Your email address:</label><br/>
                <input type="email" id="email" name="email" placeholder="Email"/>                                
                <br/><label for="password">Your password:</label><br/>
                <input type="password" id="password" name="password" placeholder="Password"/>
                <br/><label for="password">Repeat password:</label><br/>
                <input type="password" id="rePassword" name="rePassword" placeholder="repeat password"/><br/>
                <input type="button" class="button" id="signupbtn" value="Sign up for free" onclick="userSignUp()"/>
            </form>
        </section>
        <script src="js/login.js"></script>
    </body>
</html>
