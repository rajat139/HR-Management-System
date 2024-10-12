<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit</title>
</head>
	<style>
        body {
            padding: 0;
            margin: 0;
            background-color: #f4f4f4;
            font-family: 'Times New Roman', Times, serif;
            color: #333;
        }

        #navbar {
            background-color: #2d2d2d;
            border-bottom: 2px solid #040404;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 2.5em;
        }

        #form {
            background-color: #fff;
            border: 2px solid #ccc;
            width: 320px;
            padding: 20px;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        #form input::placeholder {
            color: rgb(172, 172, 172);
        }

        #form label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.2em;
            color: #111111; 
        }

        #form input {
            border: none;
            border-bottom: 2px solid #2a2a2a;
            width: 100%;
            font-size: 1em;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
            transition: border-bottom-color 0.3s ease;
        }

        #form input:focus {
            outline: none;
            border-bottom-color: #000000; 
        }
        
        #form input[type="file"]{
        	border:none;
        }

        #form button[type="submit"] {
            background-color: #6dc552;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1.2em;
            width: 100%;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        #form button[type="submit"]:hover {
            background-color: #59b13e; 
        }
    </style>
<body>
		 
	<%
		Connection connection = null;
		String eid = request.getParameter("id");
        
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = SqlConnection.connect();
		
			if(connection!=null){
				String query = "select Name,pno,Email,Job,Department,image from employee.employee2 where eid=?";
				try(PreparedStatement preparedStatement = connection.prepareStatement(query)){
					preparedStatement.setString(1, eid);
					ResultSet resultSet = preparedStatement.executeQuery();
					if(resultSet.next()){
	%>
						<div id="navbar">Edit Employee Details</div>
					    <div id="form">
					        <form action="editUpdate.jsp" method="post">
					            <label for="empid">Employee ID : <%=eid %></label>
					            <input type="hidden" name="id" value="<%=eid%>">

					            <label for="name">Name</label>
					            <input type="text" id="name" name="name" placeholder="<%out.print(resultSet.getString("Name"));%>" required>
					            
					            <label for="pno">Contact Number</label>
					            <input type="text" id="pno" name="pno" placeholder="<%out.print(resultSet.getString("pno")); %>" required>
					            
					            <label for="email">E-mail</label>
					            <input type="email" id="email" name="email" placeholder="<%out.print(resultSet.getString("Email")); %>" required>
					       		            
					            <label for="job">Job</label>
					            <input type="text" id="job" name="job" placeholder="<%out.print(resultSet.getString("Job")); %>" required>
					            
					            <label for="dept">Department</label>
					            <input type="text" id="dept" name="department" placeholder="<%out.print(resultSet.getString("Department")); %>" required>
					      				           
					            <button type="submit">Submit</button>
					        </form>
					    </div>						
	<%
					}
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
			e.getMessage();
		}
		finally{
			if(connection!=null){
				try{
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