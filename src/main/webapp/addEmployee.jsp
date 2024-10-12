<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.Base64" %>
<%@ page import="org.example.SqlConnection" %>

<%
try {
    String name = request.getParameter("name");
    String contactNumber = request.getParameter("contactNumber");
    String email = request.getParameter("email");
    String jobTitle = request.getParameter("jobTitle");
    String department = request.getParameter("department");
    String imageData = request.getParameter("imageData");

    // Validate image data
    if (imageData == null || imageData.isEmpty()) {
        throw new IllegalArgumentException("Image data is empty or null.");
    }
    
    byte[] imageBytes = Base64.getDecoder().decode(imageData);

    // Establish database connection
    try (Connection connection = SqlConnection.connect()) {
        if (connection != null) {
            String employeeQuery = "INSERT INTO employee2 (Name, pno, Email, Job, Department, Image) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement employeeStatement = connection.prepareStatement(employeeQuery, Statement.RETURN_GENERATED_KEYS)) {
                employeeStatement.setString(1, name);
                employeeStatement.setString(2, contactNumber);
                employeeStatement.setString(3, email);
                employeeStatement.setString(4, jobTitle);
                employeeStatement.setString(5, department);
                employeeStatement.setBytes(6, imageBytes);

                int rowsAffected = employeeStatement.executeUpdate();

                if (rowsAffected > 0) {
                    int eid = -1;
                    try (ResultSet generatedKeys = employeeStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            eid = generatedKeys.getInt(1);
                        }
                    }
                    
                    String userName = request.getParameter("username");
                    String password = request.getParameter("password");
                    String role = request.getParameter("role");
                    
                    String checkQuery = "SELECT COUNT(*) AS count FROM login WHERE username = ?";
                    try (PreparedStatement loginStatement = connection.prepareStatement(checkQuery)) {
                        loginStatement.setString(1, userName);
                        try (ResultSet loginResultSet = loginStatement.executeQuery()) {
                            if (loginResultSet.next() && loginResultSet.getInt("count") == 0) {
                                String insertLoginQuery = "INSERT INTO login (eid, username, password, role) VALUES (?, ?, ?, ?)";
                                try (PreparedStatement insertLoginStatement = connection.prepareStatement(insertLoginQuery)) {
                                    insertLoginStatement.setInt(1, eid);
                                    insertLoginStatement.setString(2, userName);
                                    insertLoginStatement.setString(3, password);
                                    insertLoginStatement.setString(4, role);

                                    int insertRow = insertLoginStatement.executeUpdate();

                                    if (insertRow > 0) {
                                        response.sendRedirect("emp_Information.jsp");
                                    } else {
                                        out.println("Error: Username or password is not inserted.");
                                    }
                                }
                            } else {
                                response.sendRedirect("emp_Information.jsp");
                            }
                        }
                    }
                } else {
                    out.println("Error inserting employee data!");
                }
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e.getMessage());
} finally {
    SqlConnection.disconnect();
}
%>
