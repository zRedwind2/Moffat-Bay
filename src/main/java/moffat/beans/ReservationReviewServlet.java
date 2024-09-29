// Anthony Williams : Moffat Bay Assignment : Reservation Review Servlet

package moffat.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReservationReviewServlet")
public class ReservationReviewServlet extends HttpServlet {
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

        if ("cancel".equals(action) && bookingIdParam != null && !bookingIdParam.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // Delete the reservation from the database
                String deleteSql = "DELETE FROM Bookings WHERE Booking_ID = ?";
                PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
                deleteStmt.setString(1, bookingIdParam); // Use setString instead of setInt
                int rowsAffected = deleteStmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Forward to cancelConfirmation.jsp
                    request.getRequestDispatcher("/jsp/cancelConfirmation.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Unable to cancel the reservation. Please try again.");
                    request.getRequestDispatcher("/jsp/reservationReview.jsp").forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error canceling the reservation. Please try again.");
                request.getRequestDispatcher("/jsp/reservationReview.jsp").forward(request, response);
            }
        } else if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // Fetch reservation details
                String sql = "SELECT b.Booking_ID, b.Check_In, b.Check_Out, b.Occupancy, r.Room_Size, r.Image_Path "
                           + "FROM Bookings b "
                           + "JOIN Room r ON b.Room_ID = r.Room_ID "
                           + "WHERE b.Booking_ID = ?";
                
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, bookingIdParam); // Use setString instead of setInt
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("roomSize", rs.getString("Room_Size"));
                    request.setAttribute("guests", rs.getInt("Occupancy"));
                    request.setAttribute("checkIn", rs.getDate("Check_In").toString());
                    request.setAttribute("checkOut", rs.getDate("Check_Out").toString());
                    request.setAttribute("imagePath", rs.getString("Image_Path"));
                    
                    // Forward to reservationReview.jsp
                    request.getRequestDispatcher("/jsp/reservationReview.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Reservation details not found.");
                    request.getRequestDispatcher("/jsp/lookupReservation.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error retrieving reservation details.");
                request.getRequestDispatcher("/jsp/reservationReview.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid booking ID or action.");
            request.getRequestDispatcher("/jsp/reservationReview.jsp").forward(request, response);
        }
    }
}
