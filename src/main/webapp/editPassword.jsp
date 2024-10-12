<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.sql.*,org.example.SqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditPassword</title>
	<style>
        body {
            font-family: 'Times New Roman', Times, serif;
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            max-width: 350px;
            margin: auto;
        }

        h2 {
            color: #343a40;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid rgb(240, 240, 240);
            padding-bottom: 10px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-size: 16px;
            color: #495057;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        textarea:focus,
        input:focus {
            outline: none;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 8px 25px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            float: right; 
        }

        button:hover {
            background-color: #45a049;
        }
        
        .role-section {
            margin-bottom: 16px;
        }
        
        #role-label {
		    display: flex;
		    
		}

        #role {
            margin-bottom: 8px;
        }
        
        span{
			margin-right: 70px;
		}
		
		input[type=radio]{
			margin-left: 20px;
		}

        .error-message {
            color: #dc3545;
            margin-top: 10px;
        }
    </style>
</head>
<body>
	<div class="container">
        <h2>Set Username and Password</h2>
        <form action="updatePassword.jsp" method="get" onsubmit="return validateForm()">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <div class="error-message" id="passwordError"></div>
			 <div class="role-section">
                <label id="role">Select Role</label>
                <div id="role-label">
	                <input type="radio" name="role" value="admin" id="admin" class="role-input">
	                <span>admin</span>
	                <input type="radio" name="role" value="user" id="employee" class="role-input" required>
	                <span>user</span>
	            </div>
            </div>
            <button type="submit">Set</button>
        </form>
    </div>
    <script>
        function validateForm() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var passwordError = document.getElementById('passwordError');

            if (password !== confirmPassword) {
                passwordError.innerText = "Passwords do not match!";
                return false;
            } else {
                passwordError.innerText = "";
                return true;
            }
        }
    </script>
    <%
    	String eid = (String) session.getAttribute("eid");
    	session.setAttribute("eid",eid);
    %>
    
</body>
</html>