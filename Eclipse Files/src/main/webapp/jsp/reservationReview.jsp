<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Review</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="reservation-review" style="padding-bottom: 60px;">
        <header>
            <h1>Reservation Details</h1>
        </header>

        <!-- Display reservation details -->
        <div class="reservation-details">
            <p>Room Size: <%= request.getAttribute("roomSize") %></p>
            <p>Guests: <%= request.getAttribute("guests") %></p>
            <p>Check-in Date: <%= request.getAttribute("checkIn") %></p>
            <p>Check-out Date: <%= request.getAttribute("checkOut") %></p>
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
