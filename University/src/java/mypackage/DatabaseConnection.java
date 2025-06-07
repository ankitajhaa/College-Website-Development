package mypackage;

import java.sql.*;

public final class DatabaseConnection {

    private DatabaseConnection() {
    }

    public static Connection getConnection() throws Exception {
        Connection conn = null;
        try {
                        
            //Lines for Tomcat without Jndi
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            String url = "jdbc:oracle:thin:sys as sysdba/sys123@localhost:1521:xe";
            conn = DriverManager.getConnection(url);
            return conn;
            
            

        } catch (Exception ex) {
            throw ex;
        }
    }

    public static void freeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ex) {
        }
    }

}
