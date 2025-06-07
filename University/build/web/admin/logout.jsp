<%-- 
    Document   : logout
    Created on : 12 Jul 2024, 12:49:25 pm
    Author     : SKJHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%                      session.invalidate();
            %>
        <h1>Logout</h1>
    </body>
</html>
