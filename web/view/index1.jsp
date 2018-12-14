<%-- 
    Document   : index1
    Created on : Dec 14, 2018, 8:36:34 AM
    Author     : Mukhlish
--%>

<%@page import="entities.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String NIK = "";
            String Pass = "";
            String Role = "";
            if (session.getAttribute("dataEmployee") != null) {
                Employee e = (Employee) session.getAttribute("dataEmployee");
                NIK = e.getNik();
                Pass = e.getPassword();
                Role = e.getRoleId().getRoleName();

            }
        %>
        <h1>Hello World!</h1>
        <input type="text" name="" value=" <%= Pass %> " />
        
    </body>
</html>
