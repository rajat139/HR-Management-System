<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="userPage.css">
</head>
<body>
    <div class="navbar">
        <h1>Employee Details</h1>
        <div class="button-container">
            <div class="action-button">
                <button class="button"><i class="fas fa-bars"></i></button>
                <div class="dropdown-content">
                    <button onclick="window.location.href='leave.jsp';">Leave</button>
                    <button onclick="window.location.href='https://www.youtube.com/';">Attendance</button>
                    <button onclick="window.location.href='https://www.youtube.com/';">Notification</button>
                    <button onclick="window.location.href='https://www.youtube.com/';">Logout</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Employee Details Section -->
    <div class="employee-details">
    	<%
    		Connection connection = null;
    		String user =(String) session.getAttribute("user");
    		int eid =(Integer) session.getAttribute("eid");
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = SqlConnection.connect();
	            
	            if (connection != null) {
	            
	                String query = "SELECT eid, Name, pno, Email, Job, Department, image FROM employee.employee2 where eid = ?";
	            	
	                try (PreparedStatement preparedStatement = connection.prepareStatement(query))
	                {
	                	 preparedStatement.setInt(1, eid);
	                    try(ResultSet resultSet = preparedStatement.executeQuery()) {
	       					
	                    	while (resultSet.next()) {
	                    		byte[] imageBytes = resultSet.getBytes("image");
	                    		String imageDataBase64 = Base64.getEncoder().encodeToString(imageBytes);
    	%>
        <div class="employee">
            <img src="data:image/jpeg;base64, <%= imageDataBase64 %>" alt="Employee Image">
            <table>
                <tr>
                    <th>ID</th>
                    <td><%=resultSet.getInt("eid")%></td>
                    <% session.setAttribute("eid", eid); %>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><%=resultSet.getString("Name")%></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><%=resultSet.getString("pno")%></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td> <%=resultSet.getString("Email")%></td>
                </tr>
                <tr>
                    <th>Department</th>
                    <td><%=resultSet.getString("Department")%></td>
                </tr>
                <tr>
                    <th>Job</th>
                    <td><%=resultSet.getString("Job")%></td>
                </tr>
            </table>
        </div>
       	 <%
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
    </div>
</body>
</html>
