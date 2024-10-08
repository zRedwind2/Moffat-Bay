// Anthony Williams : Moffat Bay Assignment : Reservation Summary Servlet

package moffat.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.Random;

@WebServlet("/ReservationSummaryServlet")
public class ReservationSummaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/MoffatBayLodge";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "pass";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit".equals(action)) {
            // Generate a unique 10-digit booking ID
            String bookingId = generateUniqueBookingId();

            // Retrieve reservation details from the summary page
            String roomSize = request.getParameter("roomSize");
            String guests = request.getParameter("guests");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");

            // Log form data for debugging
            System.out.println("Submit Action: roomSize=" + roomSize + ", guests=" + guests);

            // Handle MM/DD/YYYY format for the date
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            java.sql.Date checkInDate = null;
            java.sql.Date checkOutDate = null;
            try {
                // Convert from MM/DD/YYYY to java.sql.Date
                checkInDate = new java.sql.Date(sdf.parse(checkIn).getTime());
                checkOutDate = new java.sql.Date(sdf.parse(checkOut).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Invalid date format. Please enter the date in MM/DD/YYYY format.");
                request.getRequestDispatcher("/jsp/reservationSummary.jsp").forward(request, response);
                return;  // Stop further execution
            }

            // Retrieve the Account_ID and User_ID from the session
            HttpSession session = request.getSession();
            Integer accountId = (Integer) session.getAttribute("userAccount");
            Integer userId = (Integer) session.getAttribute("userID");

            if (accountId == null || userId == null) {
                request.setAttribute("errorMessage", "User session has expired. Please log in again.");
                request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
                return;  // Stop further execution
            }

            // Insert the reservation into the database
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "INSERT INTO Bookings (Booking_ID, Account_ID, Room_ID, User_ID, Occupancy, Booking_Date, Check_In, Check_Out) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);

                int roomId = Integer.parseInt(roomSize); // Use the roomSize parameter as Room_ID

                // Use the current date for the Booking_Date
                java.sql.Date bookingDate = java.sql.Date.valueOf(LocalDate.now());

                stmt.setString(1, bookingId);  // Set the generated booking ID
                stmt.setInt(2, accountId);
                stmt.setInt(3, roomId);
                stmt.setInt(4, userId); // Set the User_ID
                stmt.setInt(5, Integer.parseInt(guests)); // Track Occupancy dynamically
                stmt.setDate(6, bookingDate);  // Set the booking date
                stmt.setDate(7, checkInDate);  // Use parsed date for check-in
                stmt.setDate(8, checkOutDate); // Use parsed date for check-out

                stmt.executeUpdate();

                // Redirect to confirmation page with booking ID
                response.sendRedirect(request.getContextPath() + "/jsp/bookingConfirmation.jsp?bookingId=" + bookingId);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error occurred while processing your reservation.");
                request.getRequestDispatcher("/jsp/reservationSummary.jsp").forward(request, response);
            }
        } else if ("cancel".equals(action)) {
            // Log cancellation
            System.out.println("Cancel Action");

            // Redirect to the reservation page when cancel is clicked
            response.sendRedirect(request.getContextPath() + "/jsp/Reservation.jsp");
        }
    }

    // Generate a unique 10-digit booking ID
    private String generateUniqueBookingId() {
        Random random = new Random();
        StringBuilder bookingId = new StringBuilder();

        // Generate a random 10-digit number
        for (int i = 0; i < 10; i++) {
            int digit = random.nextInt(10); // Random digit between 0-9
            bookingId.append(digit);
        }

        return bookingId.toString();
    }
}
