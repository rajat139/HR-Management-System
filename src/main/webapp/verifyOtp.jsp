<%
	String email = (String) session.getAttribute("email");
	session.setAttribute("email", email);
    String userOtp=request.getParameter("otp");
    String sendOtp=(String)session.getAttribute("otp");

    if(userOtp.equals(sendOtp)){
    response.sendRedirect("resetPasswordhtml.jsp");
    }
    else{
       out.print("Otp Miss-matched");
    }
%>