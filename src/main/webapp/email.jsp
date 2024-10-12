<%@ page import="org.example.SendOTP"%>
<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Connection connection = null;
	String email=request.getParameter("email");
	session.setAttribute("email", email);
	try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    connection = SqlConnection.connect();
	    if (connection != null) {
            String query = "SELECT * from employee.employee2 where Email = '"+email+"'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query))
            {
                try(ResultSet resultSet = preparedStatement.executeQuery()) {  					
                	if (resultSet.next()) {
                		SendOTP.email(email);
                		String otp=SendOTP.getOtp();
                		session.setAttribute("otp",otp);
                		response.sendRedirect("verifyOtpHtml.jsp");
                	}
                	else{
                		out.println("email is not match.");
                	}
                }
            }

            SqlConnection.disconnect();
        } 
	    
	    else {
            out.println("Error: Unable to connect to the database");
        }
            
	}
	catch (Exception e) {
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
