<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<!doctype html>
<jsp:include page="authorities.jsp" />

<html>
    <head>
        <title>Chancellor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            .c {
                background-color: #1d2d4e;
                padding: 0px;
                width: 100%;
                margin-left: 500px;
                margin-top: 0;
            }
        </style>
    </head>
    <body>
        <div class="c">
        <img src="photos/chancellor.jpg" alt="alt"/> 
        </div>
    </body>
</html>