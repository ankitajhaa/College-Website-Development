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
            String id = "",f_id = "",c_id = "",sem = "",search = "";
            
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
                <p><b>Teaching Assignment Information - </b></p>
                <form method="post" action="teaching.jsp" name="form">
                    <input type="text" placeholder="Enter ID" id="search" name="search">
                    <button onclick="submit();">Submit</button>
                </form>
            </div>
            
            <div class="table">
                
                <table>
                    <thead>
                        
                        <tr>
                            <th>ASSIGNMENT ID</th>
                            <th>FACULTY ID</th>
                            <th>COURSE ID</th>
                            <th>SEMESTER</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                        <% 
                            if (!search.equals("")) {
                                query = "Select * from Teaching_Assignment "
                                        + "where TA_ID='"+search+"'";
                            }
                            else {
                                query = "select * from Teaching_Assignment";
                            }
                            
                            System.out.println(query);
                            rs = stmt.executeQuery(query);
                            
                            while (rs.next())
                            {
                                id = rs.getString("TA_ID");
                                f_id = rs.getString("FACULTYID");
                                c_id = rs.getString("COURSEID");
                                sem = rs.getString("SEMESTER");
                            
                        %>
                        
                            <tr>
                                <td><%=id%></td>
                                <td><%=f_id%></td>
                                <td><%=c_id%></td>
                                <td><%=sem%></td>
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