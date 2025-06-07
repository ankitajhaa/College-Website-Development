<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<!doctype html>
<jsp:include page="welcomebasic.jsp" />

<html>
    <head>
        <title>Info</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <style>
            * {
                box-sizing: border-box;
            }
            .stu {
                margin-left: 350px;
                width: 100%;
            }
            .common {
                background-color: #1d2d4e;
                padding: 20px;
                width: 1150px;
                align-items: center;
                display: flex;
                justify-content: space-between;
            }
            .common p {
                color: white;
                font-size: 20px;
            }
            .grp {
                display: flex;
                justify-content: space-between;
                width: 700px;
            }
        </style>
        
    </head>
    <body>
            <%
                
                
                String uname = (String) (session.getAttribute("uname")  == null ? "" :session.getAttribute("uname"));
                String id = (String) (session.getAttribute("id") == null ? "" :session.getAttribute("id"));
                String fname = (String) (session.getAttribute("fname") == null ? "" :session.getAttribute("fname"));
                String lname = (String) (session.getAttribute("lname") == null ? "" :session.getAttribute("lname"));
                String dob = (String) (session.getAttribute("dob") == null ? "" :session.getAttribute("dob"));
                String branch = (String) (session.getAttribute("branch") == null ? "" :session.getAttribute("branch"));
                String year = (String) (session.getAttribute("year") == null ? "" :session.getAttribute("year"));
                String email = (String) (session.getAttribute("email") == null ? "" :session.getAttribute("email"));
                String phone = (String) (session.getAttribute("phone") == null ? "" :session.getAttribute("phone"));
                
            %>
            
            <div class="stu">
            <div class="common">
                <p><b>Students Information - </b></p>
            </div>
            <p>Profile details of <%=uname%>!</p>
            <p>ID: <%=id%></p><br>
            <div class="grp">
                <p>First Name: <%=fname%></p>
                <p>Last Name: <%=lname%></p>
            </div><br>
            <div class="grp">
                <p>Date of Birth: <%= dob %></p>
                 <p>Year of Admission: <%= year %></p>
            </div><br>
            <div class="grp">
                <p>Branch: <%= branch %></p>
            </div><br>
            <div class="grp">
                <p>Email: <%= email %></p>
                <p>Phone Number: <%= phone %></p>
            </div><br>
        </div>

        </div>
    </body>
</html>