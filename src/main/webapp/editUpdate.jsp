<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page import="java.sql.*, java.util.Base64" %>
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
			String eid = request.getParameter("id");
			String name = request.getParameter("name");
		    String pno = request.getParameter("pno"); 
		    String email = request.getParameter("email"); 
		    String job = request.getParameter("job"); 
		    String department = request.getParameter("department"); 
		    
		    out.println(eid+" "+name+" "+pno+" "+email+" "+job+" "+department);
		    try{
		    	Class.forName("com.mysql.cj.jdbc.Driver");
				connection = SqlConnection.connect();
		    	if(connection!=null){
		    		String Update = "UPDATE employee2 SET Name=?, pno=?, Email=?, Job=?, Department=? Where eid =?";
		    		try(PreparedStatement prepareStatement = connection.prepareStatement(Update)){
		    			prepareStatement.setString(1,name);
		    			prepareStatement.setString(2,pno);
		    			prepareStatement.setString(3,email);
		    			prepareStatement.setString(4,job);
		    			prepareStatement.setString(5,department);
		    			prepareStatement.setString(6,eid);
		    			
		    			session.setAttribute("eid",eid);
		    			
		    			int update = prepareStatement.executeUpdate();
		    			
		    			if(update>0){
		    				out.print("row is change");
		    				response.sendRedirect("editPassword.jsp");
		    			}
		    			else{
		    				out.print(name);
		    				out.print("Row is not change");
		    			}
		    		}
		    	}
		    }
		    catch (Exception e) 
		    {
                e.printStackTrace();
                out.println("<div>Error updating employee information: " + e.getMessage() + "</div>");
            } 
		    finally {
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