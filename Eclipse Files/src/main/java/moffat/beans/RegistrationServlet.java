package moffat.beans;

import moffat.utils.PasswordUtils;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/MoffatBayLodge";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "pass";

    // Updated SQL statement to include address fields and username
    private static final String INSERT_USER_SQL = 
        "INSERT INTO User (First_Name, Last_Name, Email, Phone_Number, AddressStreet, AddressCity, AddressState, AddressZip) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String INSERT_ACCOUNT_SQL = 
        "INSERT INTO Account (Password, Salt, Username, User_ID) VALUES (?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Get form parameters
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String password = request.getParameter("password");
        String addressStreet = request.getParameter("addressStreet").trim();
        String addressCity = request.getParameter("addressCity").trim();
        String addressState = request.getParameter("addressState").trim();
        String addressZip = request.getParameter("addressZip").trim();


        // Generate salt and hash the password
        byte[] salt = PasswordUtils.generateSalt();
        String hashedPassword = null;

        try {
            hashedPassword = PasswordUtils.hashPassword(password, salt);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            response.getWriter().println("Error hashing password. Please try again.");
            return;
        }

        Connection connection = null;
        try {
            // Establishing the connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Insert user's personal details into the User table
            PreparedStatement userStatement = connection.prepareStatement(INSERT_USER_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
            userStatement.setString(1, firstName);
            userStatement.setString(2, lastName);
            userStatement.setString(3, email);
            userStatement.setString(4, phoneNumber);
            userStatement.setString(5, addressStreet);
            userStatement.setString(6, addressCity);
            userStatement.setString(7, addressState);
            userStatement.setString(8, addressZip);

            int rowsInsertedUser = userStatement.executeUpdate();

            // Retrieve the generated User_ID
            int userId = 0;
            var rs = userStatement.getGeneratedKeys();
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // Insert into Account table: hashed password, salt, username, and User_ID
            PreparedStatement accountStatement = connection.prepareStatement(INSERT_ACCOUNT_SQL);
            accountStatement.setString(1, hashedPassword);   // Store the hashed password
            accountStatement.setBytes(2, salt);              // Store the salt
            accountStatement.setString(3, username);         // Store the username
            accountStatement.setInt(4, userId);              // Store the associated User_ID

            int rowsInsertedAccount = accountStatement.executeUpdate();

            // Check if both inserts were successful
            if (rowsInsertedUser > 0 && rowsInsertedAccount > 0) {
            	response.sendRedirect(request.getContextPath() + "/jsp/confirmationPage.jsp");
            } else {
                response.getWriter().println("Registration failed. Please try again.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error connecting to database. Please try again.<br>");
            response.getWriter().println("Error details: " + e.getMessage());
        } finally {
            // Ensure the connection is closed
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("Please access the registration form to submit your details.");
    }
}
