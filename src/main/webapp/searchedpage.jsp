<%@ page import="java.sql.*, org.example.SqlConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Page</title>
</head>
	<style>
         body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: #f0f0f0;
            color: #333;
        }

        #header {
            background-color: #343434;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: solid 1px #2f2f2f;
        }

        #emp-Info {
            font-size: 26px;
            font-weight: bold;
            margin: 0 0 0 5%;
            padding: 5px 12px;
            background-color: #353535;
            border: 1px solid rgb(70, 70, 70);
        }

        #logout {
            padding: 0.5% 1.5%;
            margin-right: 3%;
            background-color: #4CAF50;
            color: white;
            border:1px solid rgb(140, 140, 140);
            border-radius: 15px;
            cursor: pointer;
            font-size: 17px;
        }
        
        #logout:hover{
            background-color:  #45a049;
            border:1px solid rgb(111, 111, 111);
        }

        nav {
            background-color: #444;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 15px;
        }

        nav button {
            color: white;
            background-color: #555;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
            margin-bottom: 10px;
        }
        
         .employee-info-box .image img {
		    width: 100%; /* Ensures the image fills its container */
		    height: 150px; /* Fixed height for all images */
		    object-fit: cover; /* Ensures the image covers the entire container */
		    border-radius: 5px; /* Adds rounded corners to the image */
		}
		
		.employee-info-box .image {
		    margin-bottom: 10px; /* Adds some space between the image and other details */
		}

        nav button:hover {
            background-color: #666;
        }

        .search-bar {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .search-container input[type=text] {
            padding: 10px;
            border: none;
            border-radius: 5px 0 0 5px;
            font-size: 14px;
        }

        .search-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
        }
        
        .search-container textarea:focus,
        input:focus {
            outline: none;
        }
        
        .search-container button:hover {
            background-color: #45a049;
        }

        .employee-info-container {
            display: flex;
            gap:5px 50px;
            flex-wrap: wrap;
            justify-content:flex-start;
            padding: 25px;
        }

        .employee-info-box {
            background-color: #fff;
            padding: 10px 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            transition: background-color 0.3s;
            width: calc(20% - 40px);
            margin-bottom: 20px;
        }

        .employee-info-box:hover {
            background-color: #f5f5f5;
            transform: scale(1.02);
        }

        .employee-info {
            font-size: 14px;
            display: grid;
            gap: 5px;
            margin-top: 0px;
        }

        .info-row {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        
       

        .label {
            font-weight: bold;
            color: #555;
            font-size: 12px;
        }

        .span {
            color: #777;
            font-size: 11px;
        }

        .buttons-container {
            display: flex;
            justify-content: space-around;
            margin-top: 5px;
        }

        .edit-button,
        .delete-button,
        .reset-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-right: 10px;
        }

        .edit-button:hover {
            background-color: #45a049;
        }

        .delete-button:hover {
            background-color: #f44336;
        }

        .reset-button:hover {
            background-color: #008CBA;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 1200px) {
            .employee-info-box {
                width: calc(25% - 20px);
            }

            .edit-button,
            .delete-button,
            .reset-button {
                font-size: 12px;
            }
        }

        @media (max-width: 992px) {
            .employee-info-box {
                width: calc(33.33% - 20px);
            }

            .label,
            .span {
                font-size: 12px;
            }
        }

        @media (max-width: 768px) {
            #logout {
                font-size: 16px;
                padding: 5px 12px;
            }

            nav {
                flex-direction: column;
            }

            nav button {
                width: 100%;
            }

            .search-bar {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-container input[type=text] {
                width: 100%;
            }

            .search-container button {
                width: 100%;
                border-radius: 0 0 5px 5px;
            }

            .employee-info-box {
                width: calc(50% - 20px);
            }

            .label,
            .span {
                font-size: 12px;
            }

            .edit-button,
            .delete-button,
            .reset-button {
                font-size: 12px;
                padding: 6px 12px;
            }
        }

        @media (max-width: 576px) {
            .employee-info-box {
                width: calc(100% - 20px);
            }
            .employee-info-container{
                display: flex;
                justify-content: center;
            }
            .label{
                font-size: 14px;
            }
            .span{
                font-size: 13px;
            }
        }
    </style>
<body>
    <%
        Connection connection = null;
        String searchValue = request.getParameter("searchValue");
        
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = SqlConnection.connect();
            
            // Check if search value is provided
            if (searchValue != null && !searchValue.trim().isEmpty()) {
                // Split search value into individual words
                String[] searchWords = searchValue.split("\\s+");
                
                // Build the SQL query
                StringBuilder query = new StringBuilder("SELECT eid, Name, pno, Email, Job, Department FROM employee.employee2 WHERE Email LIKE '%@gmail.com%'");
                for (String word : searchWords) {
                    query.append(" AND (eid LIKE ? OR Name LIKE ? OR pno LIKE ? OR Email LIKE ? OR Job LIKE ? OR Department LIKE ?)");
                }
                
                // Prepare and execute the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                    int parameterIndex = 1;
                    for (String word : searchWords) {
                        String searchPattern = "%" + word + "%"; // Prepare search pattern for partial matching
                        for (int i = 0; i < 6; i++) {
                            preparedStatement.setString(parameterIndex++, searchPattern);
                        }
                    }
                    
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    	boolean found = false;
                        while (resultSet.next()) {
                            out.println("Employee ID: " + resultSet.getInt("eid") + "<br>");
                            out.println("Name: " + resultSet.getString("Name") + "<br>");
                            out.println("Phone Number: " + resultSet.getString("pno") + "<br>");
                            out.println("Email: " + resultSet.getString("Email") + "<br>");
                            out.println("Job: " + resultSet.getString("Job") + "<br>");
                            out.println("Department: " + resultSet.getString("Department") + "<br><hr>");
                            found = true;
                        }
                        if (!found) {
                        	response.sendRedirect("emp_Information.jsp");
                        }
                    }
                }
                SqlConnection.disconnect();
            } else {
                // Handle case where search value is empty or null
                out.println("Please enter a search query.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error occurred while processing the request.");
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                    se.getMessage();
                }
            }
        }
    %>
</body>
</html>