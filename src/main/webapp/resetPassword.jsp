<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>
    <%
        Connection connection = null;
        String email = (String) session.getAttribute("email");
        String password = request.getParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = SqlConnection.connect();
            if (connection != null) {
                String selectQuery = "SELECT eid FROM employee.employee2 WHERE Email = ?";
                try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
                    selectStatement.setString(1, email);
                    try (ResultSet resultSet = selectStatement.executeQuery()) {
                        if (resultSet.next()) {
                        	
                            int eid = resultSet.getInt("eid");
                            
                            String updateQuery = "UPDATE employee.login SET password = ? WHERE eid = ?";
                            
                            try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                                updateStatement.setString(1, password);
                                updateStatement.setInt(2, eid);
                                int rowsAffected = updateStatement.executeUpdate();
                                if (rowsAffected > 0) {
                                    response.sendRedirect("login.html");
                                } else {
                                    out.println("Failed to update password.");
                                }
                            }
                        } else {
                            out.println("Email not found in employee table.");
                        }
                    }
                }
                SqlConnection.disconnect();
            } else {
                out.println("Error: Unable to connect to the database");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    e.getMessage();
                }
            }
        }
    %>
</body>
</html>
