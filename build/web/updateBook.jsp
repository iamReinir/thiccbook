<%-- 
    Document   : addBook
    Created on : 21/07/2023, 9:19:33 AM
    Author     : Giga P34
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update a book</title>
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/bookForm.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <a href='index.jsp'> BACK TO MAIN PAGE </a>
        <h1>UPDATE THE BOOK</h1>        
        <form action='UpdateController' onsubmit="return validateForm();">
            <input type="hidden" name="book_id" value="${param.book_id}"/>
            <label for="book_name">Title:</label>  <br/>              
            <input type="text" 
                   id="book_name" name="book_name" placeholder="Title"
                   value="${param.book_name}"/><br/>                             
            <label for="book_author">Author:</label><br/>
            <input type="text" id="book_author" value="${param.book_author}"
                   name="book_author" placeholder="Author"/><br/>
            <label for="book_year">Public year:</label><br/>
            <input id="book_year" 
                   name="book_year" 
                   type="number" 
                   min="0" max="2099" step="1" value="${param.book_year + 1900}" /> <br/>
            <input type="submit" class="button" id="updateBook" value="UPDATE"/>
        </form>
        <script src="js/addBook.js"></script>
    </body>
</html>
