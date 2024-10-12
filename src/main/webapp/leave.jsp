<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Leave Request</title>
    <link rel="stylesheet" type="text/css" href="leave.css">
</head>
<body>
    <div class="container">
        <h1>Employee Leave Request</h1>
        <div class="decoration"></div>
        <p class="info-text">Please fill out the form below to submit your leave request.</p>
        <form action="leave1.jsp" method="get">
            <div>
                <label for="leaveType">Type of Leave:</label>
                <select id="leaveType" name="leaveType" required>
                    <option value="" disabled selected>Select Leave Type</option>
                    <option value="sick">Sick Leave</option>
                    <option value="vacation">Vacation Leave</option>
                    <option value="personal">Personal Leave</option>
                    <option value="bereavement">Bereavement Leave</option>
                    <option value="other">Other</option>
                </select>
            </div>
            
            <div>
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" required>
            </div>
            
            <div>
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" required>
            </div>
            
            <div>
                <label for="reason">Reason for Leave:</label>
                <textarea id="reason" name="reason" rows="4" required></textarea>
            </div>
            
            <div>
                <button type="submit">Submit</button>
            </div>
            
        </form>
        <%
        	int eid = (Integer) session.getAttribute("eid");
        	session.setAttribute("eid", eid);
        %>
    </div>
</body>
</html>
