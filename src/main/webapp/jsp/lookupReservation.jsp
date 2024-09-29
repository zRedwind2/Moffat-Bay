<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
            <h1>Reservation Search</h1>
        </header>

        <!-- Form to search for reservations -->
        <form action="${pageContext.request.contextPath}/lookupReservation" method="post">
            <label for="bookingId">Reservation ID:</label>
            <input type="text" id="bookingId" name="bookingId"><br><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <input type="submit" value="Submit">
        </form>

        <!-- Display reservation details -->
        <div class="reservation-details">
            <% 
                ResultSet reservations = (ResultSet) request.getAttribute("reservations");

                if (reservations != null) {
                    List<String[]> reservationList = new ArrayList<>();
                    while (reservations.next()) {
                        // Fetching data from ResultSet and storing it in a list
                        String[] reservationData = new String[5];
                        reservationData[0] = reservations.getString("Check_In");
                        reservationData[1] = reservations.getString("Check_Out");
                        reservationData[2] = reservations.getString("Room_Size");
                        reservationData[3] = reservations.getString("Image_Path");
                        reservationData[4] = reservations.getString("Booking_ID");
                        reservationList.add(reservationData);
                    }

                    // Display the results if any
                    if (!reservationList.isEmpty()) {
                        for (String[] res : reservationList) {
            %>
            <div class="reservation-item">
			    <!-- Container for the image -->
			    <div class="reservation-image-container">
			        <img src="<%= res[3] %>" alt="Room Image" class="room-image">
			    </div>
			    
			    <!-- Container for reservation info -->
			    <div class="reservation-info-container">
			        <a href="${pageContext.request.contextPath}/ReservationReviewServlet?bookingId=<%= res[4] %>">
			            Reservation from <%= res[0] %> to <%= res[1] %>
			        </a>
			    </div>
			</div>
            <% 
                        }
                    } else {
            %>
                        <p>No reservations found for this email address.</p>
            <% 
                    }
                } else if (request.getAttribute("errorMessage") != null) { 
            %>
                <!-- Display the error message if there's an error -->
                <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
