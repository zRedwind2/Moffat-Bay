<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Lookup</title>
    <!-- Linking to the lookupReservation CSS file for specific styling -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lookupReservation.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>Reservation Lookup</h1>
        </header>

        <!-- Form to search for reservations -->
        <form action="${pageContext.request.contextPath}/lookupReservation" method="post">
            <label for="bookingId">Booking ID:</label>
            <input type="text" id="bookingId" name="bookingId"><br><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <input type="submit" value="Search Reservation">
        </form>

        <!-- Display reservation details -->
        <div class="reservation-details">
            <% 
                ResultSet reservations = (ResultSet) request.getAttribute("reservations");

                // Check if there are any results or if an error message needs to be displayed
                if (reservations != null && reservations.isBeforeFirst()) {
                    while (reservations.next()) {
                        String checkIn = reservations.getString("Check_In");
                        String checkOut = reservations.getString("Check_Out");
                        String roomSize = reservations.getString("Room_Size");
                        String imagePath = reservations.getString("Image_Path");
                        int bookingID = reservations.getInt("Booking_ID");
            %>
            <div class="reservation-item">
			    <!-- Container for the image -->
			    <div class="reservation-image-container">
			        <img src="<%= imagePath %>" alt="Room Image" class="room-image">
			    </div>
			    
			    <!-- Container for reservation info -->
			    <div class="reservation-info-container">
			        <a href="${pageContext.request.contextPath}/ReservationReviewServlet?bookingId=<%= bookingID %>">
			            Reservation from <%= checkIn %> to <%= checkOut %>
			        </a>
			    </div>
			</div>

            <% 
                    }
                } else if (request.getAttribute("errorMessage") != null) { 
            %>
                <!-- Display the error message if there's an error -->
                <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
            <% } else { %>
                <!-- Display a message if no reservations are found -->
                <p>No reservations found for this email address.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
