<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<script>
    window.onload = function() {
        var signup = document.getElementById('signup');
        var login = document.getElementById('login');
        window.onclick = function(event) {
            if (event.target == signup) {
                signup.style.display="none";
            }
            else if (event.target == login) {
                login.style.display="none";
            }
        }
    }
            
    function redirectToLogin() {
        document.getElementById('signup').style.display = "none";
        document.getElementById('login').style.display = "block";
    }
</script>

<%
            
                String query="";
                String fname="", lname="", email="", uname="", pwd="", prof="";
                
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                
                if (request.getParameter("signup") != null) {
            
                    try {
                        con = DatabaseConnection.getConnection();
                        stmt = con.createStatement();
                
                        fname = request.getParameter("fname") == null ? "" : request.getParameter("fname");
                        lname = request.getParameter("lname") == null ? "" : request.getParameter("lname");
                        email = request.getParameter("email") == null ? "" : request.getParameter("email");
                        uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
                        pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
                
                        String check = "SELECT COUNT(*) FROM Details WHERE uname='" + uname + "'OR email='"+email+"'";
                        rs=stmt.executeQuery(check);
                        rs.next();
                        int count=rs.getInt(1);
                
                        if (count>0) {
                            session.setAttribute("signupError","Username or Email already exists");
                        }
                        else
                        {
                            con.setAutoCommit(false);
                            query = "INSERT INTO Details VALUES ('"+fname+"','"+lname+"','"+email+"','"+uname+"','"+pwd+"')";
                            stmt.executeUpdate(query);
                            con.commit();
                            con.setAutoCommit(true);
                            session.setAttribute("uname",uname);
                            session.setAttribute("fname",fname);
                            session.setAttribute("lname",lname);
                            session.setAttribute("email",email);
                            response.sendRedirect("admin/welcome.jsp");
                            return;
                        }
                    }   catch (Exception e) {
                        if (con!= null) {
                            try {
                                con.setAutoCommit(false);
                                con.rollback();
                            } catch (SQLException e1) {
                                e1.printStackTrace();
                            }
                            con = null;
                        }
                        
                        session.setAttribute("signupError", "An error occurred during signup. Please try again.");
    
                    } finally {
                        if (rs != null) {
                            try {
                                rs.close();
                            } catch (SQLException e) {
                            }
                            rs = null; 
                        }

                        if (stmt != null) {
                            try {
                                stmt.close();
                            } catch (SQLException e) {
                            }
                            stmt = null;
                        }
                        if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                            }
                            con = null;
                        }
                    }
                }

                if (request.getParameter("login") != null) {
            
                    try {
                        con = DatabaseConnection.getConnection();
                        stmt = con.createStatement();

                        uname = request.getParameter("uname") == null ? "" : request.getParameter("uname");
                        pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
              
                        con.setAutoCommit(false);
                        String check = "SELECT COUNT(*) FROM Details WHERE uname='" + uname + "'AND pwd='"+pwd+"'";
                        rs=stmt.executeQuery(check);
                        rs.next();
                        con.commit();
                        con.setAutoCommit(true);
                        int count=rs.getInt(1);
                
                        if (count == 1) {
                            session.setAttribute("uname",uname);
                            session.setAttribute("pwd",pwd);
                            session.setAttribute("fname",fname);
                            session.setAttribute("lname",lname);
                            session.setAttribute("email",email);
                            if (uname.equals("admin") && pwd.equals("admin"))
                            {
                                response.sendRedirect("admin/admin.jsp");
                            }
                            else {
                                response.sendRedirect("admin/new.jsp");
                            }
                            return;
                        }
                        else {
                            session.setAttribute("loginError","Invalid username or password");
                        }

                    } catch (Exception e) {
                        session.setAttribute("loginError","Invalid username or password");

    
                    } finally {
                        if (rs != null) {
                            try {
                                rs.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }

                        if (stmt != null) {
                            try {
                                stmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
%>

<div class="navbar">
    <a class="dropbtn" href="index.jsp">HOME</a>
    <div class="dropdown">
        <a class="dropbtn" href="about.jsp">ABOUT US<i class="fa fa-caret-down"></i></a>
        <div class="drop-content">
            <a href="jpgroup.jsp">About Jaypee Group</a>
            <a href="message.jsp">Message From Founder</a>
            <a href="jiit.jsp">About JIIT</a>
            <a href="authorities.jsp">Authorities</a>
        </div>
    </div>
    <a class="dropbtn" href="academics.jsp">ACADEMICS</a>
    <a class="dropbtn" href="r&d.jsp">R&D</a>
    <a class="dropbtn" href="admission.jsp">ADMISSION</a>
    <a class="dropbtn" href="placements.jsp">PLACEMENTS</a>
    <div class="dropdown">
        <a class="dropbtn" href="life.jsp">STUDENT LIFE<i class="fa fa-caret-down"></i></a>
        <div class="drop-content">
            <a href="jyp.jsp">JIIT Youth Club</a>
            <a href="hubs.jsp">Hubs</a>
            <a href="fest.jsp">Annual Fest(s)</a>
        </div>
    </div>
    <a class="dropbtn" href="alumini.jsp">ALUMINI</a>
    <a class="dropbtn" href="resources.jsp">RESOURCES</a>
    <a class="dropbtn" href="cell.jsp">INTERNATIONAL CELL</a>
    <a class="dropbtn" href="innovation.jsp">INNOVATION HUB</a>
    <a class="dropbtn right" onclick="document.getElementById('signup').style.display='block'">SIGN UP</a>
</div>
    
<!-- Sign up form -->
<div id="signup">
    <div class="up">
        <form name="submitform" class="upform" action="navbar.jsp" method="post">
            <input type="hidden" name="signup" value="1">
            <p class="uptitle">Sign Up</p>
            <p class="updesc">Create an account first</p>
                    
            <% if (session.getAttribute("signupError") != null) { %>
                <p style="color: red;"><%= session.getAttribute("signupError") %></p>
                <% 
                    session.removeAttribute("signupError");
            }
                %>
                        
            <div class="upflex">
                <label>
                    <input required placeholder="" type="text" name="fname" class="upinput">
                    <span>First Name</span>
                </label>
                <label>
                    <input required placeholder="" type="text" name="lname" class="upinput">
                    <span>Last Name</span>
                </label>
            </div>
            <label>
                <input required placeholder="" type="email" name="email" class="upinput">
                <span>Email</span>
            </label>
            <label>
                <input required placeholder="" type="text" name="uname" class="upinput">
                <span>Username</span>
            </label>
            <label>
                <input required="" placeholder="" type="password" name="pwd" class="upinput">
                <span>Password</span>
            </label>
            <div class="radio">
                <input type="radio" name="prof" value="1">
                <span>Student</span>
                <input type="radio" name="prof" value="2">
                <span>Faculty</span>
            </div>
            <button type="submit" class="submit">Submit</button>
            <p class="login">Already have an account ? <a onclick="redirectToLogin()">Log In</a></p>
        </form>
    </div>
</div>
    
<!-- Log in form -->
<div id="login">
    <div class="in">
        <form name="loginform" class="inform" action="navbar.jsp" method="post">
            <input type="hidden" name="login" value="1">
            <p class="intitle">Log in</p>
                    
            <% if (session.getAttribute("loginError") != null) { %>
                <p style="color: red;"><%= session.getAttribute("loginError") %></p>
                <% 
                    session.removeAttribute("loginError");
            }
                %>
                    
            <label>
                <input required placeholder="" type="text" name="uname" class="ininput">
                <span>Username</span>
            </label>
            <label>
                <input required placeholder="" type="password" name="pwd" class="ininput">
                <span>Password</span>
            </label>
            <button type="submit" class="submit">Log in</button>
        </form>
    </div>
</div>
                
<style>
    .navbar {
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #2f3472;
        width: 100%;
    }

    .navbar a.right {
        float: right;
    }
    
    .dropbtn {
        color: white;
        padding: 10px 14.5px;
        font-family: monospace;
        font-size: 15px;
        text-decoration: none;
        float: left;
        display: inline-block;
        text-align: center;
        cursor: default;
    }
    
    .dropbtn:hover {
        color: violet;
    }
    
    .dropdown:hover .dropbtn {
        background-color: red;
    }
    
    .dropdown {
        display: inline-block;
    }
    
    .drop-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    
    .drop-content a {
        color: black;
        padding: 12px 16px;
        display: block;
        text-decoration: none;
        text-align: left;
    }
    
    .drop-content a:hover {
        background-color: #f1f1f1;
    }
    
    .dropdown:hover .drop-content {
        display: block;
    }

    #signup, #login {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    .up, .in {
        background-color: #fefefe;
        margin: 7.5% auto;
        width: 80%;
        max-width: 400px;
        border-radius: 20px;
    }

    .in {
        margin: 10% auto;
    }

    .upform, .inform {
        display: flex;
        flex-direction: column;
        gap: 10px;
        max-width: 400px;
        background-color: white;
        padding: 20px;
        position: relative;
        border-radius: 20px;
    }

    .uptitle, .intitle {
        font-size: 28px;
        color: black;
        font-weight: 600;
        letter-spacing: -1px;
        position: relative;
        display: flex;
        align-items: center;
        padding-left: 30px;
    }   

    .uptitle::before, .uptitle::after, .intitle::before, .intitle::after {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        border-radius: 50%;
        left: 0px;
        background-color: black;
    }

    .uptitle::before, .intitle::before {
        height: 18px;
        width: 18px;
        background-color: black;
    }

    .uptitle::after, .intitle::after {
        height: 18px;
        width: 18px;
        animation: pulse 1s linear infinite;
    }

    .updesc, .login {
        color: rgba(88,87,87,0.822);
        font-size: 14px;
    }

    .login {
        text-align: center;
    }

    .login a {
        color: black;
    }

    .login a:hover {
        text-decoration: underline black;
        cursor: pointer;
    }

    .upflex {
        display: flex;
        width: 100%;
        gap: 6px;
    }   

    .upform label, .inform label {
        position: relative;
    }

    .upform label .upinput, .inform label .ininput {
        width: 100%;
        padding: 10px 10px 20px 10px;
        outline: 0;
        border: 1px solid rgba(105,105,105,0.397);
        border-radius: 10px;
    }

    .upform label .upinput + span, .inform label .ininput + span {
        position: absolute;
        left: 10px;
        top: 15px;
        color: grey;
        font-size: 0.9em;
        cursor: text;
        transition: 0.3s ease;
    }

    .upform label .upinput:placeholder-shown + span, .inform label .ininput:placeholder-shown + span {
        top: 15px;
        font-size: 0.9em;
    }

    .upform label .upinput:focus + span, .upform label .upinput:valid + span, .inform label .ininput:focus + span, .inform label .ininput:valid + span {
        top: 30px;
        font-size: 0.7em;
        font-weight: 600;
    }

    .upform label .upinput:valid + span, .inform label .ininput:valid + span {
        color: green;
    }

    .submit {
        border: none;
        outline: none;
        background-color: black;
        padding: 10px;
        border-radius: 10px;
        color: white;
        font-size: 16px;
        transform: .3s ease;
    }

    .submit:hover {
        background-color: rgb(194,194,160);
    }
</style>