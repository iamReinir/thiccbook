<%-- 
    Document   : login
    Created on : 20/07/2023, 8:42:02 PM
    Author     : Giga P34
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./css/header.css">
    </head>
    <body>             
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/navBar.jspf" %>
        <section id="login">            
            <form method="POST">
                <label for="username">Your username:</label>                
                <br/>
                <input type="text" id="username" name="username" placeholder="Username"/>                                
                <br/><label for="password">Your password:</label><br/>
                <input type="password" id="password" name="password" placeholder="Password"/><br/>
                <input type="button" class="button" id="loginbtn" value="login" onclick="userlogin()"/>
            </form>
            <h3 id="notifBoard"></h3>
        </section>
        <script src="js/login.js"></script>
    </body>
</html>
