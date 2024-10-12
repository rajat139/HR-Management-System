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
		String eid = request.getParameter("id");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
            connection = SqlConnection.connect();
			if(connection != null){
				String query = "DELETE from employee.employee2 WHERE eid=?";
				try(PreparedStatement preparedStatement = connection.prepareStatement(query)){
					preparedStatement.setString(1, eid);
					int delete = preparedStatement.executeUpdate();
					if(delete > 0){
						out.println(eid+" "+"Employee is removed");
						response.sendRedirect("emp_Information.jsp");
					}
					else{
						out.println(eid+" "+"No Employee was deleted");
					}
				}
				SqlConnection.disconnect();
			}
			else {
                out.println("Error: Unable to connect to the database");
            }
		}
		catch(Exception e){
			e.printStackTrace();
			out.println(e.getMessage());
		}
		finally {
            if (connection != null) {
                try {
                    connection.close();
                }  
                catch (SQLException | NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }
	%>
</body>
</html>