<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection connection = null;
		
		String name = (String) session.getAttribute("name");
		String contactNumber = (String) session.getAttribute("contactNumber");
		String email = (String) session.getAttribute("email");
		String job = (String) session.getAttribute("job");
		String department = (String) session.getAttribute("department");
		String role = (String) session.getAttribute("role");
		String image = (String) session.getAttribute("imageDataBase64");
		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");
		String conformPassword = (String) session.getAttribute("conformPassword");

		if (password.equals(conformPassword)) {
	    	//response.sendRedirect("employeePage.jsp");
	    	out.print("your password matched.");
	    }
	    	
	    else{
	    	//response.sendRedirect("employeePage5.jsp");
	        out.print("your password didn't match.");
	    }	
	%>
</body>
</html>