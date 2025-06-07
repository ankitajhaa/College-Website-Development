<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>
<!doctype html>

<html>
    <head>
        
        <title>Student</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/style.css"/>
        
    </head>
    
    <body>
          
        <div class="sidebar">
            
            <div class="side-top">
                <img src="../photos/logo.jpg" alt="alt"/>
                <p>CampusPortal</p>
            </div>
                
            <a href="info.jsp"><h3>Student Information</h3></a>
            <a href="exam.jsp"><h3>Examination Detail</h3></a>
            <a href="att.jsp"><h3>Attendance</h3></a>
            <a href="grade.jsp"><h3>Grades</h3></a>
                
        </div>
        
            <div class="welcome">
                <%
                    String uname = (String) (session.getAttribute("uname")  == null ? "" :session.getAttribute("uname"));
                    System.out.println("Uname - " + uname);
                    
                    if (!uname.equals("")) {
                        //session.invalidate();
                        //response.sendRedirect("index.jsp");
                    
                %>
                <p><b>Welcome, <%=uname%>!</b></p>
                <div class="dropdown">
                    <h4 class="dropbtn">User</h4>
                    <div class="drop-content">
                        <a href="../index.jsp">Logout</a>
                    </div>
                </div>
                <%} else {%>
                    <p style="color: black;"><b>Invalid session</b></p>

                <%}%>
            </div>
        
    </body>
    
</html>