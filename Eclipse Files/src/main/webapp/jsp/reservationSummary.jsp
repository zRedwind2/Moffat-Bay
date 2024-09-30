<!-- Louis Capps : Anthony Williams: Brett Stovall : Moffat Bay Assignment : Reservation Page -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Summary</title>

	<!-- Link to reservationSummaryStyle.css for additional styles -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservationSummaryStyle.css">
    <!-- Includes TopMenu.jsp for the top navigation bar -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <!-- Includes BottomMenu.jsp for the bottom navigation bar -->
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
	<!-- Main container for the reservation summary -->
    <div class="wrapper reservation-summary">
        <header>
            <h1>Reservation Summary</h1>
        </header>

	  <!-- Check if we are receiving data for the summary -->
        <%
        	String guests = request.getParameter("guests");
        	String roomSize = request.getParameter("roomSize");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            String room = null;
            double pricePerNight = 0;
            double totalPrice = 0;
            if (roomSize == null || guests == null || checkIn == null || checkOut == null) {
            	guests = (String) request.getAttribute("guests");
            	roomSize = (String) request.getAttribute("roomSize");
                checkIn = (String) request.getAttribute("checkIn");
                checkOut = (String) request.getAttribute("checkOut");
            }
            int guestNumber = Integer.parseInt(guests);
            if (guestNumber <= 2) {
                pricePerNight = 120.75;
            } else if (guestNumber >= 3) {
                pricePerNight = 157.50;
            }
            String imagePath = ""; // Initialize imagePath variable
            switch (roomSize) {
                case "1":
                    room = "Double Full Beds";
                    imagePath = request.getContextPath() + "/images/double-full.jpg"; // Update with correct image path
                    break;
                case "2":
                    room = "Queen";
                    imagePath = request.getContextPath() + "/images/queen.jpg"; // Update with correct image path
                    break;
                case "3":
                    room = "Double Queen Beds";
                    imagePath = request.getContextPath() + "/images/double-queen.jpg"; // Update with correct image path
                    break;
                case "4":
                    room = "King";
                    imagePath = request.getContextPath() + "/images/king.jpg"; // Update with correct image path
                    break;
                default:
                    room = "Unknown";
                    imagePath = null;
                    break;
            }
            // Calculate the difference in days between check-in and check-out dates
            String[] checkInParts = checkIn.split("/");
            String[] checkOutParts = checkOut.split("/");
            int checkInMonth = Integer.parseInt(checkInParts[0]);
            int checkInDay = Integer.parseInt(checkInParts[1]);
            int checkInYear = Integer.parseInt(checkInParts[2]);
            int checkOutMonth = Integer.parseInt(checkOutParts[0]);
            int checkOutDay = Integer.parseInt(checkOutParts[1]);
            int checkOutYear = Integer.parseInt(checkOutParts[2]);
            java.util.Calendar checkInDate = java.util.Calendar.getInstance();
            checkInDate.set(checkInYear, checkInMonth - 1, checkInDay); // Month is 0-based in Calendar
            java.util.Calendar checkOutDate = java.util.Calendar.getInstance();
            checkOutDate.set(checkOutYear, checkOutMonth - 1, checkOutDay);
            long diffInMillies = Math.abs(checkOutDate.getTimeInMillis() - checkInDate.getTimeInMillis());
            long diff = java.util.concurrent.TimeUnit.DAYS.convert(diffInMillies, java.util.concurrent.TimeUnit.MILLISECONDS);
            totalPrice = diff * pricePerNight;
        %>
        
		<!-- Display reservation details -->
		<div class="reservation-details reservation-info-container">
		    <div class="reservation-labels">
		        <p>Guests:</p>
		        <p>Room Size:</p>
		        <p>Check-In:</p>
		        <p>Check-Out:</p>
		        <p>Price per Night:</p>
		    </div>
		    <div class="reservation-values">
		        <p><%= guests %></p>
		        <p><%= room %></p>
		        <p><%= request.getAttribute("checkIn") %></p>
		        <p><%= request.getAttribute("checkOut") %></p>
		        <p>$<%= String.format("%.2f", pricePerNight) %></p>
		    </div>
		</div>
        
        <!-- Display the room image -->
        <% if (imagePath != null && !imagePath.isEmpty()) { %>
            <div class="room-image-container">
                <img src="<%= imagePath %>" alt="Room Image" class="room-image">
            </div>
        <% } %>
        
        <!-- Display the total price underneath the image -->
        <div class="total-price-container">
            <h2>Total Price: $<%= String.format("%.2f", totalPrice) %></h2>
        </div>

        <div class="button-container">
            <!-- Cancel button -->
            <form action="${pageContext.request.contextPath}/ReservationSummaryServlet" method="post">
                <button type="submit" name="action" value="cancel" class="cancel-button">Cancel</button>
            </form>

            <!-- Submit button -->
            <form action="${pageContext.request.contextPath}/ReservationSummaryServlet" method="post">
                <input type="hidden" name="roomSize" value="<%= roomSize %>">
                <input type="hidden" name="guests" value="<%= guests %>">
                <input type="hidden" name="checkIn" value="<%= checkIn %>">
                <input type="hidden" name="checkOut" value="<%= checkOut %>">
                <button type="submit" name="action" value="submit" class="submit-button">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
