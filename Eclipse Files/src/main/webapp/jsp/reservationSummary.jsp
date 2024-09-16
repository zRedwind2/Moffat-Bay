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
    <div class="reservation-summary">
        <header>
            <h1>Reservation Summary</h1>
        </header>

        <!-- Check if we are receiving data for the summary -->
        <%
            String roomSize = request.getParameter("roomSize");
            String guests = request.getParameter("guests");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            String room = null;
           	double price = 0;
            
            if (roomSize == null || guests == null || checkIn == null || checkOut == null) {
                roomSize = (String) request.getAttribute("roomSize");
                guests = (String) request.getAttribute("guests");
                checkIn = (String) request.getAttribute("checkIn");
                checkOut = (String) request.getAttribute("checkOut");
            }
            int guestNumber = Integer.parseInt(guests);
            if (guestNumber <= 2){
            	price = 120.75;
            }
            if (guestNumber >= 3){
            	price = 157.50;
            }
            
            switch (roomSize) {
            case "doubleFullBed":
            	room = "Double Full Beds";
            	break;
            case "queen":
            	room = "Queen";
            	break;
            case "doubleQueenBeds":
            	room = "Double Queen Beds";
            	break;
            case "king":
            	room = "king";
            	break;
            }
        %>

        <!-- Display reservation details -->
        <div class="reservation-details">
            <h2>Your Reservation</h2>
            <p>Room Size: <%= room %></p>
            <p>Guests: <%= guests %></p>
            <p>Check-in Date: <%= checkIn %></p>
            <p>Check-out Date: <%= checkOut %></p>
            <p>Price: <%= price %></p>


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
    </div>
</body>
</html>
