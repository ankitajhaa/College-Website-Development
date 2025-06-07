<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About Jaypee Group</title>
        
        <style>
            
            .group {
                flex: 100%;
                padding: 0px;
                position: relative;
                text-align: center;
                color: white;
            }
            
            .group img {
                width: 100%;
                height: 400px;
                margin-left: 0;
            }
            
            .group p {
                position: absolute;
                bottom: -34px;
                left: 24px;
                font-family: monospace;
                font-size: 38px;
            }
            
            .a {
                margin-left: 100px;
                margin-right: 100px;
                display: flex;
                justify-content: space-between;
                height: 500px;
            }

            .jp {
                flex: 0.25;
                margin: 0;
                padding: 0;
                width: 350px;
                height: 100%;
                overflow: auto;
                background-color: white;
            }

            .jp-top {
                display: flex;
                letter-spacing: 0.25px;
                height: 70px;
                background-color: #d6d6d6;
                align-items: center;
                justify-content: center;
            }

            .jp-top p {
                font-size: 25px;
                color: #1d5586;
                font-family: sans-serif;
                text-align: center;
            }

            .jp a {
                display: contents;
                color: #b8b8b8;
                padding: 1px;
                text-decoration: none;
                font-size: 17px;
            }

            .jp a p {
                margin-left: 25px;
                padding: 10px;
                font-family: sans-serif;
            }

            .jp a:hover {
                background-color: #d6d6d6;
                color: #1d5586;
            }
            
            .jp a:active {
                color: #1d5586;
            }

            .us {
                flex: 0.75;
                margin-left: 20px;
                padding: 1px 16px;
                background-color: white;
            }
            
            hr {
                border: 1px dashed #d6d6d6;
            }
        </style>
        
    </head>
    <body>
        <div class="group">
            <img src="photos/jpgroup.jpg" alt="jaypee group"/>
            <p>AUTHORITIES</p>
        </div>
        <div class="a">
            <div class="jp">
                <div class="jp-top">
                    <p><b>AUTHORITIES</b></p>
                </div>
                <a href="chancellor.jsp"><p>>> CHANCELLOR</p></a><hr>
                <a href="pro.jsp"><p>>> PRO-CHANCELLOR</p></a><hr>
                <a href="vice.jsp"><p>>> VICE-CHANCELLOR</p></a><hr>
                <a href="director.jsp"><p>>> DIRECTOR</p></a><hr>
                <a href="registrar.jsp"><p>>> REGISTRAR</p></a>
            </div>
        </div>
    </body>
</html>

<jsp:include page="footer.jsp" />