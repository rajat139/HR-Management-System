<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
    <%
    	Connection connection = null;
    
    	int eid = Integer.parseInt((String) session.getAttribute("eid"));
	    String role = request.getParameter("role");
		String userName = request.getParameter("username");
	    String password = request.getParameter("password");
	    out.println(role);
	    try{
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = SqlConnection.connect();
			 if (connection != null) {
                 String query = "INSERT INTO login (eid, username, password, role) VALUES (?, ?, ?, ?)";
                 
                 try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                     preparedStatement.setInt(1, eid);
                     preparedStatement.setString(2, userName);
                     preparedStatement.setString(3, password);
                     preparedStatement.setString(4, role);

                     int insertRow = preparedStatement.executeUpdate();

                     if (insertRow>0) {
                         response.sendRedirect("emp_Information.jsp");
                     } else {
                         out.println("Error: Username or password is not inserted.");
                     }
                 }
                 SqlConnection.disconnect();
             }
		}
		catch(Exception e){
			e.printStackTrace();
			out.print(e.getMessage());
		}
		finally{
			if(connection != null){
				try{
					connection.close();
				}
				catch(SQLException e){
					e.printStackTrace();
					out.print(e.getMessage());
				}
			}
		}
    %>
</body>
</html>