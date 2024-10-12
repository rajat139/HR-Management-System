package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {
    private static Connection connection;
    private static String jdbcUrl = "jdbc:mysql://localhost:3306/employee";
    private static String username = "root";
    private static String password = "1234";

    public static Connection connect() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                connection = DriverManager.getConnection(jdbcUrl, username, password);
                System.out.println("Connected to the database");
            } catch (SQLException e) {
                System.err.println("Error connecting to the database: " + e.getMessage());
                throw e; 
            }
        }
        return connection;
    }

    public static void disconnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Disconnected from the database");
            }
        } catch (SQLException e) {
            System.err.println("Error disconnecting from the database: " + e.getMessage());
        }
    }
}
