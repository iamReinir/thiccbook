<%-- 
    Document   : index
    Created on : 20/07/2023, 7:25:46 PM
    Author     : Giga P34
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/index.css">
        <title>Reinir's Books</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
                           url="jdbc:mysql://localhost/thiccbooks"  
                           user="root"  password="Trung123"/> 
        <sql:query dataSource="${db}" var="rs" sql="SELECT * FROM books;"/>                           
        <c:if test="${username != null}">
            <h2>Hello ${username}</h2>        
            <form action="LogoutController" id="logout"
                  onsubmit="return confirm('Do you really want to logout?');">
                <input type="submit" value="Logout"/>
            </form>   
            <br/>
        </c:if> 
        <c:if test="${username == null}">
            <%@include file="WEB-INF/jspf/navBar.jspf" %>
        </c:if>
        <table>
            <thead>
            <h2>List of books:</h2>
        </thead>
        <tr>  
            <th>Book name</th>  
            <th>Author</th>  
            <th>Pub Year</th>                 
                <c:if test="${username != null}">
                <th>Delete</th> <th>Edit</th>
                </c:if>
        </tr>
        <c:forEach var="table" items="${rs.rows}"> 
            <tr>
                <td>${table.book_name}</td>
                <td>${table.book_author}</td>
                <td>${1900 + table.book_year.year}</td>  
                <c:if test="${username != null}">
                    <td>
                        <button onclick="deleteBook(
                                        '${table.book_id}',
                                        '${table.book_name}',
                                        '${table.book_author}',
                                        '${table.book_year.year}')">
                            Delete
                        </button>
                    </td> 
                    <td>
                        <button onclick="updateBook(
                                        '${table.book_id}',
                                        '${table.book_name}',
                                        '${table.book_author}',
                                        '${table.book_year.year}')">
                            Edit
                        </button>
                    </td>
                </c:if>
            </tr>
        </c:forEach>

    </table>    
    <c:if test="${username != null}">
        <button onclick="window.location.href = './addBook.jsp'" id="addbtn">ADD ANOTHER</button>
        <script src="js/removeUpdate.js"></script>
    </c:if>
    <section id="updatePlaceholder"></section>
</body>
</html>
