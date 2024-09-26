package moffat.beans;

import java.io.IOException;
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

@WebServlet("/lookupReservation")
public class LookupReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/MoffatBayLodge";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "pass";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String bookingId = request.getParameter("bookingId");

        // Validate email
        if (email == null || email.isEmpty()) {
            request.setAttribute("errorMessage", "Please provide a valid email address.");
            request.getRequestDispatcher("/jsp/lookupReservation.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT b.Booking_ID, b.Check_In, b.Check_Out, r.Room_Size, r.Image_Path FROM Bookings b "
                       + "JOIN Account a ON b.Account_ID = a.Account_ID "
                       + "JOIN Room r ON b.Room_ID = r.Room_ID "
                       + "JOIN User u ON a.User_ID = u.User_ID "
                       + "WHERE u.Email = ?";
            
            if (bookingId != null && !bookingId.isEmpty()) {
                sql += " AND b.Booking_ID = ?";
            }
            
            sql += " ORDER BY b.Check_In DESC";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            if (bookingId != null && !bookingId.isEmpty()) {
                stmt.setInt(2, Integer.parseInt(bookingId));
            }
            
            ResultSet rs = stmt.executeQuery();
            request.setAttribute("reservations", rs);
            request.getRequestDispatcher("/jsp/lookupReservation.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving reservation data. Please try again.");
            request.getRequestDispatcher("/jsp/lookupReservation.jsp").forward(request, response);
        }
    }
}
