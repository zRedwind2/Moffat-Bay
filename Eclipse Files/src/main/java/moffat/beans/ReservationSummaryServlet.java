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
        String bookingIdParam = request.getParameter("bookingId");

        // Check if bookingId is provided for fetching reservation details
        if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "SELECT b.Booking_ID, b.Check_In, b.Check_Out, b.Occupancy, r.Room_Size, r.Image_Path "
                           + "FROM Bookings b "
                           + "JOIN Room r ON b.Room_ID = r.Room_ID "
                           + "WHERE b.Booking_ID = ?";
                
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(bookingIdParam));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("roomSize", rs.getString("Room_Size"));
                    request.setAttribute("guests", rs.getInt("Occupancy"));
                    request.setAttribute("checkIn", rs.getDate("Check_In").toString());
                    request.setAttribute("checkOut", rs.getDate("Check_Out").toString());
                    request.setAttribute("imagePath", rs.getString("Image_Path"));
                }
                request.getRequestDispatcher("/jsp/reservationSummary.jsp").forward(request, response);
                return;
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error retrieving reservation details.");
                request.getRequestDispatcher("/jsp/reservationSummary.jsp").forward(request, response);
                return;
            }
        }

        // Existing submit and cancel logic
        if ("submit".equals(action)) {
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
                String sql = "INSERT INTO Bookings (Account_ID, Room_ID, User_ID, Occupancy, Booking_Date, Check_In, Check_Out) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);

                int roomId = Integer.parseInt(roomSize); // Use the roomSize parameter as Room_ID

                // Use the current date for the Booking_Date
                java.sql.Date bookingDate = java.sql.Date.valueOf(LocalDate.now());

                stmt.setInt(1, accountId);
                stmt.setInt(2, roomId);
                stmt.setInt(3, userId); // Set the User_ID
                stmt.setInt(4, Integer.parseInt(guests)); // Track Occupancy dynamically
                stmt.setDate(5, bookingDate);  // Set the booking date
                stmt.setDate(6, checkInDate);  // Use parsed date for check-in
                stmt.setDate(7, checkOutDate); // Use parsed date for check-out

                stmt.executeUpdate();

                // Redirect to confirmation page
                response.sendRedirect(request.getContextPath() + "/jsp/confirmationPage.jsp");
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
}
