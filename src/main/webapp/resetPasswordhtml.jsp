<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Password</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: rgb(50, 57, 78); 
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
            background-color: black; 
            padding: 20px 20px 30px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            max-width: 300px;
            width: 90%;
        }
        h2 {
            color: rgb(2, 149, 27);
            margin-bottom: 20px;
            font-weight: bold;
            width: 91%; 
            margin: auto; 
        }

        form{
            margin-top: 15px;
        }

        label {
            text-align: left;
            display: block;
            margin: 10px 0 0 12px;
            font-size: 16px;
            color: red;
        }

        #butt{
            padding : 0 15px 0 0;
            display: flex;
            justify-content: right;
        }

        input[type="password"] {
            padding: 12px 12px 3px 12px;
            margin: 10px 0;
            width: calc(100% - 24px);
            font-size: 16px;
            border: none;
            border-bottom: 2px solid white;
            background: white;
            transition: border-bottom-color 0.3s ease;
            outline: none;
            box-sizing: border-box;
            color: black; 
        }
        textarea:focus,
        input:focus {
            outline: none;
        }
        button {
            margin-top: 10px;
            padding: 10px 25px;
            font-size: 16px;
            cursor: pointer;
            background-color: rgb(13, 158, 13); 
            color: black; 
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            box-sizing: border-box;
            text-align: left; 
        }
        button:hover {
            background-color: rgb(6, 132, 79); 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create a New Password</h2>
        <form action="resetPassword.jsp" method="get" onsubmit="return validateForm()">
            <label for="password">Password</label>
            <input type="password" id="password" placeholder="Enter New Password" name="password" required>
            <br>
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" placeholder="Confirm New Password" name="confirmPassword" required>
            <br>
            <div id="passwordError" style="color: red;"></div> <!-- Error message container -->
            <br>
            <div id="butt">
                <button type="submit">Submit</button>
            </div>
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
	    String email = (String) session.getAttribute("email");
		session.setAttribute("email", email);
    %>
</body>
</html>
