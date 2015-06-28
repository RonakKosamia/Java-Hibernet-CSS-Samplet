<%-- 
    Document   : home
    Created on : Apr 12, 2015, 8:12:52 PM
    Author     : Ronak kosamia
--%>

<%@page import="java.util.List"%>
<%@page import="org.app.service.LoginService"%>
<%@page import="java.util.Date"%>
<%@page import="org.app.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <title>Home Page</title>        
    </head>
    <body>  
    <center>
        <div id="mystyle">
            <h1>CS532 A ADVANCE JAVA PROJECT</h1>
            <p><a>http://www.facebook.com/rkosamia12</a><br/>
                <b>Integrating JSP,servlet, Hibernate in an MVC  based Application</b><br/>
                <%=new Date()%></br>
                <%
                    User user = (User) session.getAttribute("user");
                %>            
                <b>Welcome <%= user.getFirstName() + " " + user.getLastName()%></b>            
                <br/>
                <a href="logout.jsp">Logout</a>
            </p>

            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>First Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>email</th>                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        LoginService loginService = new LoginService();
                        List<User> list = loginService.getListOfUsers();
                        for (User u : list) {
                    %>
                    <tr>
                        <td><%=u.getUserId()%></td>
                        <td><%=u.getFirstName()%></td>
                        <td><%=u.getMiddleName()%></td>
                        <td><%=u.getLastName()%></td>
                        <td><%=u.getEmail()%></td>
                    </tr>
                    <%}%>
                <tbody>
            </table>            
            <br/>
        </div>
                <br>
                <form action="selSubject.jsp"><br>
                <input type="submit" value="click for Subject Selection" />
                   </form>
    </center>            
</body>
</html>
