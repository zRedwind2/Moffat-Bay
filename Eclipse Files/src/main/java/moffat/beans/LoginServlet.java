//Jeremy Ginter : Moffat Bay Assignment : Login Servlet

package moffat.beans;
import moffat.utils.PasswordUtils;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/MoffatBayLodge";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "pass";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(); 
        String enteredUsername = request.getParameter("username");    
        String enteredPassword = request.getParameter("password");
        
        Connection con = null;
        
        String query = "SELECT * FROM Account WHERE Username = ?";
        
        String rsPass = null;
        byte[] rsSalt = null;
        int rsAcc = 0;
        int userId = 0;  // Variable to store User_ID
        String user = null;
        
        try { 
            con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, enteredUsername);
            ResultSet resultSet = statement.executeQuery(); 
            
            while(resultSet.next()) {
                // Retrieves hashed password, salt, Account_ID, and User_ID from the database
                rsPass = resultSet.getString("Password");
                rsSalt = resultSet.getBytes("Salt");
                rsAcc = resultSet.getInt("Account_ID");
                userId = resultSet.getInt("User_ID");  // Get the User_ID
                user = resultSet.getString("Username");
            }
            
            try {
                boolean test = PasswordUtils.verifyPassword(enteredPassword, rsPass, rsSalt);
                if (test) {
                    // Create session attributes
                    session.setAttribute("userUsername", user); 
                    session.setAttribute("userAccount", rsAcc);
                    session.setAttribute("userID", userId);  // Store User_ID in session

                    response.getWriter().println("Login Successful!");
                    request.getRequestDispatcher("/jsp/Landing Page.jsp").forward(request, response);

                } else {
                    response.getWriter().println("Incorrect Password, Try Again!");
                }
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                response.getWriter().println("Error hashing password. Please try again.");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error Connecting to Database: " + e.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
