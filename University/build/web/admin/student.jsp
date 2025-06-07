<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" session ="true" %>
<%@ page import = "mypackage.DatabaseConnection" %>

<!doctype html>
<jsp:include page="adminbasic.jsp" />

<html>
    <head>
        
        <title>Student</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            * {
                box-sizing: border-box;
            }
            table,th,td {
                border: 1px solid black;
                text-align: center;
            }
            table {
                width: 70%;
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
            .com {
                display: flex;
                justify-content: space-around;
            }
            .common p {
                color: white;
                font-size: 20px;
            }
            .common form {
                margin-right: 100px;
            }
            .common button {
                background-color: black;
                color: white;
            }
            #update {
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

    .updateflex {
        display: flex;
        flex-direction: column;
        gap: 10px;
        max-width: 400px;
        background-color: white;
        padding: 20px;
        position: relative;
        border-radius: 20px;
    }
    .upd {
        background-color: #fefefe;
        margin: 7.5% auto;
        width: 80%;
        max-width: 400px;
        border-radius: 20px;
    }

    .updateflex {
        display: flex;
        width: 100%;
        gap: 6px;
    }   

    .updateflex label {
        position: relative;
    }

    .updateflex label input {
        width: 100%;
        padding: 10px 10px 20px 10px;
        outline: 0;
        border: 1px solid rgba(105,105,105,0.397);
        border-radius: 10px;
    }

    .updateflex label input + span {
        position: absolute;
        left: 10px;
        top: 15px;
        color: grey;
        font-size: 0.9em;
        cursor: text;
        transition: 0.3s ease;
    }

    .updateflex label input:placeholder-shown + span {
        top: 15px;
        font-size: 0.9em;
    }

    .updateflex label input:focus + span, .updateflex label input:valid + span {
        top: 30px;
        font-size: 0.7em;
        font-weight: 600;
    }

    .updateflex label input:valid + span {
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
        
        <script>
            
            window.onload = function() {
                var update = document.getElementById('update');
                window.onclick = function(event) {
                    if (event.target == update) {
                        update.style.display="none";
                    }
                }
            }
            
            function submit() {
                document.form.submit();
            }
        </script>
        
    </head>
    
    <body>
        
        <% 
            String query = "",upquery = "";
            String id = "",fname = "",lname = "",username = "",dob = "",branch = "",year = "",email = "",phone = "", search="";
            String a1 = "", value = "", a2 = "", val = "",update ="";
            
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                con = DatabaseConnection.getConnection();
                stmt = con.createStatement();
                
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            update = request.getParameter("update") == null ? "" : request.getParameter("update");
            a1 = request.getParameter("a1") == null ? "" : request.getParameter("a1");
            value = request.getParameter("value") == null ? "" : request.getParameter("value");
            a2 = request.getParameter("a2") == null ? "" : request.getParameter("a2");
            val = request.getParameter("val") == null ? "" : request.getParameter("val");
            
            
        %>
          
        <div class="stu">
            
            <div class="common">
                <p><b>Students Information - </b></p>
                <div class="com">
                    <form method="post" action="student.jsp" name="form">
                        <input type="text" placeholder="Enter ID" id="search" name="search">
                        <button onclick="submit();">Submit</button>
                    </form>
                
                    <button class="edit" onclick="document.getElementById('update').style.display='block'">EDIT</button>
                </div>
            </div>
            <div id="update">
                <div class="upd">
                <form action="student.jsp" method="post">
                    <div class="updateflex">
                        <label for="update">Choose a column:</label>
                        <select name="a1">
                            <option value="ID">ID</option>
                            <option value="DOB">DOB</option>
                            <option value="YearofAdmission">Year of admission</option>
                            <option value="PhoneNumber">Phone number</option>
                        </select>
                        <label>
                            <input required placeholder="" type="text" name="value" class="upvarnew">
                            <span>Updated value</span>
                        </label>
                    </div>
                    <div class="updateflex">
                        <label for="update">Uniquely define row:</label>
                        <select name="a2">
                            <option value="ID">ID</option>
                            <option value="UNAME">Username</option>
                            <option value="DOB">DOB</option>
                            <option value="BRANCHID">BranchID</option>
                            <option value="YearofAdmission">Year of admission</option>
                            <option value="PhoneNumber">Phone number</option>
                        </select>
                        <label>
                            <input required placeholder="" type="text" name="val" class="upvar">
                            <span>Enter value</span>
                        </label>
                    </div>
                    <input type="submit" value="Submit">
                </form>
                </div>
            </div>
            <div class="table">
                
                <table>
                    <thead>
                        
                        <tr>
                            <th>STUDENT ID</th>
                            <th>FIRST NAME</th>
                            <th>LAST NAME</th>
                            <th>USERNAME</th>
                            <th>DOB</th>
                            <th>BRANCH ID</th>
                            <th>YEAR OF ADMISSION</th>
                            <th>EMAIL ID</th>
                            <th>PHONE NUMBER</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                        <% 
                            if (!a1.equals("")) {
                                                                 con.setAutoCommit(false);

                                upquery = "UPDATE Information SET "
                                    + a1 + "='" + value + "' "
                                    + "WHERE " + a2 + "='" + val +"'";
                                    
                                                                System.out.println(upquery);

                            stmt.executeUpdate(upquery);
                            con.commit();
                            con.setAutoCommit(true);
                           
                            }
                            
                            
                            if (!search.equals("")) {
                                query = "Select * from Details,Information "
                                        + "where ID='"+search+"'";
                            }
                            else {
                                query = "select * from Details,Information";
                            }
                            System.out.println(query);
                            rs = stmt.executeQuery(query);
                            
                            while (rs.next())
                            {
                                id = rs.getString("ID");
                                fname = rs.getString("FNAME");
                                lname = rs.getString("LNAME");
                                username = rs.getString("UNAME");
                                dob = rs.getString("DOB");
                                branch = rs.getString("BRANCHID");
                                year = rs.getString("YEAROFADMISSION");
                                email = rs.getString("EMAIL");
                                phone = rs.getString("PHONENUMBER");
                            
                        %>
                        
                            <tr>
                                <td><%=id%></td>
                                <td><%=fname%></td>
                                <td><%=lname%></td>
                                <td><%=username%></td>
                                <td><%=dob%></td>
                                <td><%=branch%></td>
                                <td><%=year%></td>
                                <td><%=email%></td>
                                <td><%=phone%></td>
                            </tr>
                            
                            <% 
                                }
                            %>
                        
                    </tbody>
                    
                </table>
                
            </div>
        </div>
        
    </body>
    
</html>

<% 
    } catch (Exception e) {
        if (con != null) {
            try {
                con.setAutoCommit(false);
                con.rollback();
            } catch (SQLException e1) {
            }
            con = null;
        }
%>
Exception caught <br>
<font color = green><%=e.getMessage()%> </font>
<%
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {;
            }
            rs = null;
        }

        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {;
            }
            stmt = null;
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {;
            }
            con = null;
        }
    }
%>