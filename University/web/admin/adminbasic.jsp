<!doctype html>

<html>
    <head>
        
        <title>Admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/style.css">
        
    </head>
    
    <body>
          
        <div class="sidebar">
            
            <div class="side-top">
                <img src="../photos/logo.jpg" alt="alt"/>
                <p>CampusPortal</p>
            </div>  
            <a href="student.jsp"><h3>Student</h3></a>
            <a href="faculty.jsp"><h3>Faculty</h3></a>
            <a href="department.jsp"><h3>Department</h3></a>
            <a href="branch.jsp"><h3>Branch</h3></a>
            <a href="course.jsp"><h3>Course</h3></a>
            <a href="enroll.jsp"><h3>Enrollment</h3></a>
            <a href="teaching.jsp"><h3>Teaching Assignment</h3></a>
            <a href="branchdepo.jsp"><h3>Branch Department</h3></a>
            <a href="facdepo.jsp"><h3>Faculty Department</h3></a>
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