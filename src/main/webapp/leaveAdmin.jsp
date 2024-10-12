<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave Requests</title>
<link rel="stylesheet" href="leaveAdmin.css">
</head>
<body>
    <div class="container">
            <h1>Leave Requests</h1>
        <% 
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        
	        try {
	            connection = SqlConnection.connect();
	            if (connection != null) {
	                String query = "SELECT * FROM employee.leaveEmp";
	                preparedStatement = connection.prepareStatement(query);
	                resultSet = preparedStatement.executeQuery();
	                
	                while (resultSet.next()) { 
	                	int eid = resultSet.getInt("eid");   
	                	String request_date = resultSet.getString("request_date");
	                	String start_date = resultSet.getString("start_date");
	                	String end_date = resultSet.getString("end_date");
	                	String leave_reason = resultSet.getString("leave_reason");
	                	
	                	String query1 = "SELECT eid, Name, pno, Email, Job, Department, image FROM employee.employee2 where eid = ?";
			           try (PreparedStatement preparedStatement1 = connection.prepareStatement(query1))
			           {
			        	   preparedStatement1.setInt(1, eid);
			               try(ResultSet resultSet1 = preparedStatement1.executeQuery()) {
			  					
				               	while (resultSet1.next()) {
				               		//out.println(resultSet.getInt("eid")+" "+resultSet.getString("Name")+" "+resultSet.getString("email"));
				               		byte[] imageBytes = resultSet1.getBytes("image");
									String imageDataBase64 = Base64.getEncoder().encodeToString(imageBytes);
									String name = resultSet1.getString("Name");
									String email = resultSet1.getString("Email");
									session.setAttribute("email", email);
				       %>
				       				<div class="leave-item" id="leave1">
									    <div class="user-info">
									        <span class="user-icon"><img id="img" src="data:image/jpeg;base64, <%= imageDataBase64 %>" class="employee-image" alt="Image"></span>
									        <div>
									            <h3><%= name %></h3>
									            <p id="gmail"><%= email %></p>
									            <p><strong>Request Date:</strong></p>
									            <p><%=request_date %></p>
									            <!-- <%= resultSet.getString("request_date") %> -->
									        </div>
									    </div>
									
									    <div class="leave-details">
									        <p><strong>Start Date:</strong> <%= start_date %></p>
									        <p><strong>End Date:</strong> <%= end_date %></p>
									        <p><strong>Reason:</strong> <%= leave_reason %></p>
									        <p><strong>Status:</strong> Pending</p>
									    </div>
									    <div class="button-container">
									        <button  class="button approve" onclick="window.location.href='leaveAcceptEmail.jsp';" >Approve</button>
									        <button class="button reject" onclick="window.location.href='leavedeniedEmail.jsp';" >Reject</button>
									    </div>
									</div>
					<%
				               	}
			               }
			           }
			           catch (Exception e) {
				            e.printStackTrace();
				            out.print("Error: " + e.getMessage());
				       }  
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
        <div id="back-butt"><button class="back-button" onclick="window.location.href = 'emp_Information.jsp';">Back</button></div>
    </div>
	    <script>
	        // Function to handle button click
	        function handleButtonClick(id, status) {
	            // Update status in the DOM
	            document.getElementById(id).querySelector('.leave-details p:nth-child(4)').innerHTML = "<strong>Status:</strong> " + status;
	
	            // Update status in localStorage
	            localStorage.setItem(id, status);
	        }
	
	        // Retrieve and apply status from localStorage
	        document.addEventListener('DOMContentLoaded', function () {
	            for (let i = 1; i <= localStorage.length; i++) {
	                let key = localStorage.key(i - 1);
	                let value = localStorage.getItem(key);
	                document.getElementById(key).querySelector('.leave-details p:nth-child(4)').innerHTML = "<strong>Status:</strong> " + value;
	            }
	        });
	
	        // Event delegation for button clicks
	        document.addEventListener('click', function (event) {
	            if (event.target.classList.contains('button')) {
	                let status = event.target.classList.contains('approve') ? 'Approved' : 'Rejected';
	                let leaveId = event.target.closest('.leave-item').id;
	                handleButtonClick(leaveId, status);
	            }
	        });
	
	        // Go back function
	        function goBack() {
	            window.history.back();
	        }
	    </script>
</body>
</html>
