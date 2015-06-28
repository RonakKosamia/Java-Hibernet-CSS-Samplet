<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : selSubject
    Created on : Apr 13, 2015, 1:49:45 PM
    Author     : Ronak kosamia
--%>
<sql:query var="subjects" dataSource="jdbc/IFPWAFCAD">
    SELECT subject_id, name FROM Subject
</sql:query>
    
<table border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${subjects.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${subjects.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style1.css">
<body>
    <h2>Welcome to <strong>my COURSE SELECTION panel</strong>, here, decide subjects from above given table and look on information of that topic.!
    </h2>

    <table border="0">
        <thead>
            <tr>
                <th>Advance java " servlet, jstl , database, hibernet and MVC project.</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>To view the contact details of an subject's certified former
                    professional , select a topic_ID below:</td>
            </tr>
            <tr>
                <td>
                    <form action="response.jsp">
                        <strong>Select a subject:</strong>
                        <select name="subject_id">
                            <c:forEach var="row" items="${subjects.rowsByIndex}">
            <c:forEach var="column" items="${row}">
                <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
            </c:forEach>
        </c:forEach>
                        </select>
                        <input type="submit" value="submit" name="submit" />
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
