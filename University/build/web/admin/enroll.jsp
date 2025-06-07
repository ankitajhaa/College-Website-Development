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
            String id = "",s_id = "",c_id = "",sem = "",grade = "",search = "";
            
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
                <p><b>Enrollment Information - </b></p>
                <form method="post" action="enroll.jsp" name="form">
                    <input type="text" placeholder="Enter ID" id="search" name="search">
                    <button onclick="submit();">Submit</button>
                </form>
            </div>
            
            <div class="table">
                
                <table>
                    <thead>
                        
                        <tr>
                            <th>ENROLLMENT ID</th>
                            <th>STUDENT ID</th>
                            <th>COURSE ID</th>
                            <th>SEMESTER</th>
                            <th>GRADE</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                        <% 
                            if (!search.equals("")) {
                                query = "Select * from Enrollment "
                                        + "where ENROLLID='"+search+"'";
                            }
                            else {
                                query = "select * from Enrollment";
                            }
                            
                            System.out.println(query);
                            rs = stmt.executeQuery(query);
                            
                            while (rs.next())
                            {
                                id = rs.getString("ENROLLID");
                                s_id = rs.getString("ID");
                                c_id = rs.getString("COURSEID");
                                sem = rs.getString("SEMESTER");
                                grade = rs.getString("GRADE");
                            
                        %>
                        
                            <tr>
                                <td><%=id%></td>
                                <td><%=s_id%></td>
                                <td><%=c_id%></td>
                                <td><%=sem%></td>
                                <td><%=grade%></td>
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