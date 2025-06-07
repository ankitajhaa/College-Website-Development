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
        </style>
        
    </head>
    <body>
        <div class="stu">
            
            <div class="common">
                <p><b>Student Attendance - </b></p>
                
            </div>
        </div>
    </body>
</html>