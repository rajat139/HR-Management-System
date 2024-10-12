package org.example;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@SuppressWarnings("serial")
public class Login extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connect = SqlConnection.connect();

            if (connect != null) {
                try (PreparedStatement preparedStatement = connect.prepareStatement("select role, eid from employee.login where Username=? and Password=?")) {
                    preparedStatement.setString(1, req.getParameter("user"));
                    preparedStatement.setString(2, req.getParameter("password"));
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        String role = resultSet.getString("role");
                        int eid = resultSet.getInt("eid");

                        HttpSession session = req.getSession();
                        session.setAttribute("user", req.getParameter("user"));
                        session.setAttribute("role", role);
                        session.setAttribute("eid", eid);
                        
                        if ("user".equals(role)) {
                        	res.sendRedirect("userPage.jsp");
                            pw.print("Welcome u r in user's page.");
                        } else if ("admin".equals(role)) {
                            res.sendRedirect("admin.jsp");
                            //pw.println("Welcome u r in Adminer's page.");
                        } else {
                            pw.print("Welcome! Your role is not employee or admin.");
                        }
                    } else {
                        pw.print("Invalid username or password");
                    }
                }
                connect.close();
            } else {
                pw.print("Error: Unable to connect to the database");
            }

            pw.close();
        } catch (Exception e) {
            e.printStackTrace();
            pw.print(e.getMessage());
        }
    }
}
