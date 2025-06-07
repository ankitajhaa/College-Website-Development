/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author SKJHA
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class OracleDBConnection {
    public static void main(String[] args) {
        
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "760920";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Oracle JDBC Driver Registered!");
            
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            connection = DriverManager.getConnection(jdbcUrl, username, password);
            System.out.println("Connection established!");

            statement = connection.createStatement();

            String sql = "SELECT * FROM Student";
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("Studentid");
                String name = resultSet.getString("Firstname");

                System.out.print("ID: " + id);
                System.out.println(", Name: " + name);
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Oracle JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed! Check output console.");
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
