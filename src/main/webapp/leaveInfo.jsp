<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	               		//out.println(resultSet.getInt("eid")+" "+resultSet.getString("Name")+" "+resultSet.getString("email"));
	               		byte[] imageBytes = resultSet.getBytes("image");
	               		String imageDataBase64 = Base64.getEncoder().encodeToString(imageBytes);
	               		request.setAttribute("img", imageDataBase64);
	               		request.setAttribute("eid1", resultSet.getInt("eid"));
	               		request.setAttribute("name", resultSet.getString("Name"));
	               		request.setAttribute("email", resultSet.getString("email"));
	               		RequestDispatcher dispatcher = request.getRequestDispatcher("/leaveAdmin.jsp");
	               		dispatcher.forward(request, response);
	               		
	               		/**
	               		session.setAttribute("img", imageDataBase64);	               			               		
	               		session.setAttribute("eid", resultSet.getInt("eid"));
	               		session.setAttribute("name", resultSet.getString("Name"));
	               		session.setAttribute("gmail", resultSet.getString("gmail"));
	               		
	               		**/
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