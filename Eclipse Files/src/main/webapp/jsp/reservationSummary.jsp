<!-- Louis Capps : Anthony Williams: Brett Stovall : Moffat Bay Assignment : Reservation Page -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Summary</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservationSummaryStyle.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="reservation-summary">
        <header>
            <h1>Reservation Summary</h1>
        </header>

        <!-- Display reservation details -->
        <div class="reservation-details">
            <h2>Your Reservation</h2>
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

        <div class="button-container">
            <!-- Cancel button -->
            <form action="${pageContext.request.contextPath}/ReservationSummaryServlet" method="post">
                <button type="submit" name="action" value="cancel" class="cancel-button">Cancel</button>
            </form>

            <!-- Submit button -->
            <form action="${pageContext.request.contextPath}/ReservationSummaryServlet" method="post">
                <input type="hidden" name="roomSize" value="<%= request.getAttribute("roomSize") %>">
                <input type="hidden" name="guests" value="<%= request.getAttribute("guests") %>">
                <input type="hidden" name="checkIn" value="<%= request.getAttribute("checkIn") %>">
                <input type="hidden" name="checkOut" value="<%= request.getAttribute("checkOut") %>">
                
                <!-- Include the booking ID if it exists -->
                <%
                    String bookingId = request.getParameter("bookingId");
                    if (bookingId != null && !bookingId.isEmpty()) {
                %>
                    <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <% } %>
                
                <button type="submit" name="action" value="submit" class="submit-button">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
