<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = SqlConnection.connect();
            
            if (connection != null) {
            
                String query = "INSERT INTO employee.leaveEmp (eid, leave_type, start_date, end_date, leave_reason) VALUES (?, ?, ?, ?, ?)";
                
                preparedStatement = connection.prepareStatement(query);
                int eid = (Integer) session.getAttribute("eid");
                String leaveType = request.getParameter("leaveType");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String reason = request.getParameter("reason");
                
                preparedStatement.setInt(1, eid);
                preparedStatement.setString(2, leaveType);
                preparedStatement.setString(3, startDate);
                preparedStatement.setString(4, endDate);
                preparedStatement.setString(5, reason);
                
                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("Leave information inserted successfully.");
                } else {
                    out.println("Failed to insert leave information.");
                }
            } else {
                out.println("Error: Unable to connect to the database");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("Error: " + e.getMessage());
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
