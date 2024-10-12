<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        #header {
            background-color: #343434;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 70px; /* Increased height */
            border-bottom: solid 1px #170684;
        }

        #admin {
            font-size: 35px;
            font-weight: bold;
            margin: 0 0 0 42%;
            padding: 5px 12px;
            background-color: #363636;
            border: 1px solid rgb(70, 70, 70);
        }

        #logout {
            padding: 0.8% 2.2%;
            margin-right: 3%;
            background-color: #4CAF50;
            color: white;
            border:1px solid rgb(140, 140, 140);
            border-radius: 20px;
            cursor: pointer;
            font-size: 18px;
        }
        #logout:hover{
            background-color:  #45a049;
            border:1px solid rgb(111, 111, 111);
        }

        #center-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            padding: 25px;
        }

        .info1 {
            cursor: pointer;
            width: 38%; /* Adjusted width to keep two boxes in a row with some gap */
            min-height: 220px; /* Adjusted height */
            padding: 20px;
            margin: 15px;
            background-color: white;
            color: black;
            text-align: center;
            border-radius: 5px;
            border:1px solid #d3d1d1;
            transition: background-color 0.3s ease;
            font-size: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .info1:hover {
            border:1px solid #898989;
        }

        @media only screen and (max-width: 768px) {
            #admin {
                margin: 0;
            }
        }
    </style>
</head>
<body>
    <div id="header">
        <div id="admin">ADMIN</div>
        <div id="logout" onclick="location.href='login.html'">Logout</div>
    </div>
    <div id="center-container">
        <div onclick="window.location.href='emp_Information.jsp';" class="info1">
            <h2>Employee Information</h2>
        </div>
        <div onclick="window.location.href='https://www.google.com/';" class="info1">
            <h2>Attendance Tracking</h2>
        </div>
        <div onclick="window.location.href='leaveInfo.jsp';" class="info1">
            <h2>Leave Management</h2>
        </div>
        <div onclick="window.location.href='https://www.google.com/';" class="info1">
            <h2>Notification & Reminders</h2>
        </div>
    </div>
</body>
</html>
