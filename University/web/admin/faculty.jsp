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
            
        </style>
        <script>
            function submit() {
                document.form.submit();
            }
        </script>
        
    </head>
    
    <body>
        
        <% 
            String query = "";
            String id = "",fname = "",lname = "",uname = "",dept = "",phone = "",email = "",hire = "", search="";
            
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                con = DatabaseConnection.getConnection();
                stmt = con.createStatement();
            
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
        %>
          
        <div class="stu">
            
            <div class="common">
                <p><b>Faculty Information - </b></p>
                <form method="post" action="faculty.jsp" name="form">
                    <input type="text" placeholder="Enter ID" id="search" name="search">
                    <button onclick="submit();">Submit</button>
                </form>
            </div>
            
            <div class="table">
                
                <table>
                    <thead>
                        
                        <tr>
                            <th>FACULTY ID</th>
                            <th>FIRST NAME</th>
                            <th>LAST NAME</th>
                            <th>USERNAME</th>
                            <th>DEPARTMENT</th>
                            <th>EMAIL ID</th>
                            <th>PHONE NUMBER</th>
                            <th>HIRE DATE</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                        <% 
                            if (!search.equals("")) {
                                query = "Select * from Details,Faculty "
                                        + "where FACULTYID='"+search+"'";
                            }
                            else {
                                query = "select * from Details,Faculty";
                            }
                            
                            System.out.println(query);
                            rs = stmt.executeQuery(query);
                            
                            while (rs.next())
                            {
                                
                                id = rs.getString("FACULTYID");
                                fname = rs.getString("FNAME");
                                lname = rs.getString("LNAME");
                                uname = rs.getString("FIRSTNAME");
                                dept = rs.getString("DEPARTMENT");
                                email = rs.getString("EMAIL");
                                phone = rs.getString("PHONENUMBER");
                                hire = rs.getString("HIREDATE");
                            
                        %>
                        
                            <tr>
                                <td><%=id%></td>
                                <td><%=fname%></td>
                                <td><%=lname%></td>
                                <td><%=uname%></td>
                                <td><%=dept%></td>
                                <td><%=email%></td>
                                <td><%=phone%></td>
                                <td><%=hire%></td>
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