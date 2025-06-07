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
            .grp {
                display: flex;
                justify-content: space-between;
                width: 700px;
            }
        </style>
        
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
                
                query = "Select * from Details,Information ";
                
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
                }
                
                
                String uname = (String) (session.getAttribute("uname")  == null ? "" :session.getAttribute("uname"));
                
            %>
            
            <div class="stu">
            <div class="common">
                <p><b>Students Information - </b></p>
            </div>
            <p>Profile details of <%=uname%>!</p>
            <p>ID: <%=id%></p><br>
            <div class="grp">
                <p>First Name: <%=fname%></p>
                <p>Last Name: <%=lname%></p>
            </div><br>
            <div class="grp">
                <p>Date of Birth: <%= dob %></p>
                 <p>Year of Admission: <%= year %></p>
            </div><br>
            <div class="grp">
                <p>Branch: <%= branch %></p>
            </div><br>
            <div class="grp">
                <p>Email: <%= email %></p>
                <p>Phone Number: <%= phone %></p>
            </div><br>
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