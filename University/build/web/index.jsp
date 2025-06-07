<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<!doctype html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>University</title>
        <link rel="stylesheet" href="css/styless.css">
    </head>
    <body>
        
        <div class="main-part">
            <div class="scroll">
                <div class="content">
                    <img src="photos/photo.jpg" alt="img1"/>
                    <img src="photos/audi.jpg" alt="img2"/>
                    <img src="photos/jpgroup.jpg" alt="img3"/>
                    <img src="photos/class.jpg" alt="img4"/>
                    <img src="photos/photo.jpg" alt="img1"/>
                    <div class="on">
                    </div>
                </div>
            </div>               
        </div>
        <%                      session.invalidate();
            %>
    </body>
</html>

<jsp:include page="footer.jsp" />



