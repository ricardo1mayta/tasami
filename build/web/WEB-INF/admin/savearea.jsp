<%-- 
    Document   : savearea
    Created on : 17-may-2018, 12:01:45
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String root=getServletContext().getRealPath("/");
        MultipartRequest mr=new MultipartRequest(request, root);
        out.println("success ");
        
        %>
    </body>
</html>
