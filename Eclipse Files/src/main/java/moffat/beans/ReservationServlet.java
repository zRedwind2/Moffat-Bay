package moffat.beans;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the Reservation page
        String roomSize = request.getParameter("roomSize");
        String guests = request.getParameter("guests");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        // Forward form data to the Reservation Summary page
        request.setAttribute("roomSize", roomSize);
        request.setAttribute("guests", guests);
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);
        
        // Forward to the Reservation Summary JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/reservationSummary.jsp");
        dispatcher.forward(request, response);
    }
}
