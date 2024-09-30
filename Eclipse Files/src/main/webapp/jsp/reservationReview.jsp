<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Review</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservationReview.css"> <!-- Ensure this path is correct -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>Reservation Details</h1>
        </header>

        <!-- Display reservation details in a two-column format -->
        <div class="reservation-details">
            <div class="reservation-info-container">
                <div class="reservation-labels">
                    <p>Guests:</p>
                    <p>Bed Size:</p>
                    <p>Check-In:</p>
                    <p>Check-Out:</p>
                    <p>Total Price:</p>
                </div>
                <div class="reservation-values">
                    <p><%= request.getAttribute("guests") %></p>
                    <p><%= request.getAttribute("roomSize") %></p>
                    <p>
                        <%
                            // Convert the check-in date to the abbreviated month
                            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat outputFormat = new SimpleDateFormat("MMM d, yyyy");
                            String checkInDateStr = (String) request.getAttribute("checkIn");

                            if (checkInDateStr != null) {
                                try {
                                    Date checkInDate = inputFormat.parse(checkInDateStr);
                                    out.print(outputFormat.format(checkInDate));
                                } catch (Exception e) {
                                    out.print(checkInDateStr); // Display original if there's an issue
                                }
                            }
                        %>
                    </p>
                    <p>
                        <%
                            // Convert the check-out date to abbreviated month
                            String checkOutDateStr = (String) request.getAttribute("checkOut");

                            if (checkOutDateStr != null) {
                                try {
                                    Date checkOutDate = inputFormat.parse(checkOutDateStr);
                                    out.print(outputFormat.format(checkOutDate));
                                } catch (Exception e) {
                                    out.print(checkOutDateStr); // Display original if there's an issue
                                }
                            }
                        %>
                    </p>
					<p>
					    <%
					        try {
					            // Retrieve the guests attribute and check if it's not null
					            Object guestObj = request.getAttribute("guests");
					            if (guestObj != null) {
					                int guestNumber = Integer.parseInt(guestObj.toString());
					                double pricePerNight = (guestNumber <= 2) ? 120.75 : 157.50;
					
					                // Ensure check-in and check-out dates are available
					                if (checkInDateStr != null && checkOutDateStr != null) {
					                    Date checkInDate = inputFormat.parse(checkInDateStr);
					                    Date checkOutDate = inputFormat.parse(checkOutDateStr);
					
					                    long diffInMillies = Math.abs(checkOutDate.getTime() - checkInDate.getTime());
					                    long diff = java.util.concurrent.TimeUnit.DAYS.convert(diffInMillies, java.util.concurrent.TimeUnit.MILLISECONDS);
					                    double totalPrice = diff * pricePerNight;
					
					                    out.print("$" + String.format("%.2f", totalPrice));
					                } else {
					                    out.print("Check-in or Check-out date is missing.");
					                }
					            } else {
					                out.print("Guest information is missing.");
					            }
					        } catch (Exception e) {
					            e.printStackTrace(); // Print stack trace to server logs for debugging
					            out.print("An error occurred while calculating the total price.");
					        }
					    %>
					</p>

                </div>
            </div>
            <% 
                String imagePath = (String) request.getAttribute("imagePath");
                if (imagePath != null) { 
            %>
                <img src="<%= imagePath %>" alt="Room Image" class="room-image">
            <% } %>
        </div>

        <div class="button-container" style="margin-top: 20px;">
            <!-- Cancel button -->
            <form action="${pageContext.request.contextPath}/ReservationReviewServlet" method="post">
                <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>">
                <button type="submit" name="action" value="cancel" class="cancel-button">Cancel Reservation</button>
            </form>
        </div>
    </div>
</body>
</html>