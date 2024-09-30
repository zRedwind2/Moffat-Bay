// Anthony Williams : Moffat Bay Assignment : Reservation Servlet

package moffat.beans;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the Reservation page
        String roomSize = request.getParameter("roomSize");
        String guests = request.getParameter("guests");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        // Change the date format from MM/DD/YYYY to "MMM d, yyyy"
        SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("MMM d, yyyy");

        try {
            // Parse and reformat the check-in date
            Date checkInDate = inputFormat.parse(checkIn);
            checkIn = outputFormat.format(checkInDate);

            // Parse and reformat the check-out date
            Date checkOutDate = inputFormat.parse(checkOut);
            checkOut = outputFormat.format(checkOutDate);
            
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("Date parsing failed: " + e.getMessage());
        }

        // Pass formatted dates to the JSP
        request.setAttribute("roomSize", roomSize);
        request.setAttribute("guests", guests);
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);

        // Forward to the Reservation Summary JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/reservationSummary.jsp");
        dispatcher.forward(request, response);
    }
}
