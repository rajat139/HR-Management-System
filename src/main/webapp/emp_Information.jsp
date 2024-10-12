<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HR Dashboard</title>
<link rel="stylesheet" href="emp_Information.css">
</head>
<body>

<div class="header">
    <h1>HR Dashboard</h1>
</div>

<div class="container">
    <div class="sidebar">
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Attendance Tracking</a></li>
            <li><a href="leaveInfo.jsp">Leave Management</a></li>
            <li><a href="#">Notifications & Reminders</a></li>
            <li><a href="addEmployee.html">ADD Employees</a></li>
            <li><a href="login.html">Logout</a></li>
        </ul>
    </div>
    	<!--  <div class="search-bar">
            <div class="search-container">
                <input type="text" name="searchValue" id="searchValue" placeholder="Search employee...">
                <button type="button" onclick="location.href='searchedpage.jsp?searchValue=' + encodeURIComponent(document.getElementById('searchValue').value)">Search</button>
            </div>
        </div>
        -->
       <div class="main-content">
        
        <div class="employee-management">
            <h2>Employee Management</h2>
            <div class="search-container">
            <input type="text" name="searchValue" id="searchValue" placeholder="Search employee...">
                <button type="button" onclick="location.href='searchedpage.jsp?searchValue=' + encodeURIComponent(document.getElementById('searchValue').value)">Search</button> 
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Role</th>
                            <th>Department</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
   					<tbody>
        <%
            Connection connection = null;
        	String imagePath="D:\\Wallpaper\\w.jpg";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = SqlConnection.connect();
                
                if (connection != null) {
                    String query = "SELECT eid, Name, pno, Email, Job, Department, image FROM employee.employee2";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(query))
                    {
                        try(ResultSet resultSet = preparedStatement.executeQuery()) {
           					
                        	while (resultSet.next()) {
                        		byte[] imageBytes = resultSet.getBytes("image");
                        		String imageDataBase64 = Base64.getEncoder().encodeToString(imageBytes);
	                              %>
	                           
	    
                    
                        <tr>
                            <td><img id="img" src="data:image/jpeg;base64, <%= imageDataBase64 %>" class="employee-image" alt="Image"></td>
                            <td><%=resultSet.getInt("eid")%></td>
                            <td><%=resultSet.getString("Name")%></td>
                            <td><%=resultSet.getString("pno")%></td>
                            <td><%=resultSet.getString("Job")%></td>
                            <td><%=resultSet.getString("Department")%></td>
                            <td class="actions"> 
                            				<button  onclick="location.href='editDetails.jsp?id=<%=resultSet.getInt("eid")%>'">Edit</button>
	                                        <button  onclick="location.href='delete.jsp?id=<%=resultSet.getInt("eid")%>'">Delete</button>
	                                        <button  onclick="location.href='reset.jsp?id=<%=resultSet.getInt("eid")%>'">Reset</button>           
                            </td>
                        </tr>
                        <!-- Add more rows for additional employees -->
                    
	                            
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
	        </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
    </div>
  
</body>
</html>
