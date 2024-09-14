<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Summary</title>

    <!-- Link to reservationSummaryStyle.css for additional styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/reservationSummaryStyle.css">
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
        <!-- Container for the reservation details and buttons -->
        <div class="reservation-container">
            <!-- Section displaying the reservation details -->
            <div class="reservation-details">
                <h2>Your Reservation</h2>
                <p>Check-in Date: <span id="check-in-date"><%= request.getParameter("check-in-date") %></span></p>
                <p>Check-out Date: <span id="check-out-date"><%= request.getParameter("check-out-date") %></span></p>
                <p>Number of Beds: <span id="num-beds"><%= request.getParameter("num-beds") %></span></p>
                <p>Number of Guests: <span id="num-guests"><%= request.getParameter("num-guests") %></span></p>
                <p>Total Price: <span id="total-price"><%= request.getParameter("total-price") %></span></p>
            </div>
            <!-- Container for the action buttons -->
            <div class="button-container">
                <!-- Form for canceling the reservation -->
                <form action="/Moffat_Bay/jsp/Reservation.jsp" method="get">
                    <button type="submit" name="action" value="cancel" class="cancel-button">Cancel</button>
                </form>
                <!-- Form for submitting the reservation -->
                <form action="reservationSummary.jsp" method="post">
                    <button type="submit" name="action" value="submit" class="submit-button">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

<%
    // Get the action parameter to determine if the user wants to cancel or submit the reservation
    String action = request.getParameter("action");
    if ("cancel".equals(action)) {
        // Redirect to the specified reservation page if the action is cancel
        response.sendRedirect("/Moffat_Bay/jsp/Reservation.jsp");
    } else if ("submit".equals(action)) {
        // Get reservation details from the request parameters
        String checkInDate = request.getParameter("check-in-date");
        String checkOutDate = request.getParameter("check-out-date");
        String numBeds = request.getParameter("num-beds");
        String numGuests = request.getParameter("num-guests");
        String totalPrice = request.getParameter("total-price");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBayLodge", "username", "password");

            // SQL query to insert the booking details into the Bookings table
            String sql = "INSERT INTO Bookings (Account_ID, Room_ID, Occupancy, Check_In, Check_Out) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);

            // Assuming Account_ID and Room_ID are already determined
            int accountId = 1;  
            int roomId = Integer.parseInt(numBeds);  

            // Set the parameters for the SQL query
            stmt.setInt(1, accountId);
            stmt.setInt(2, roomId);  
            stmt.setInt(3, Integer.parseInt(numGuests));  
            stmt.setDate(4, java.sql.Date.valueOf(checkInDate));  
            stmt.setDate(5, java.sql.Date.valueOf(checkOutDate));  

            // Execute the SQL query
            stmt.executeUpdate();

            // Close the database connection
            conn.close();
        } catch (Exception e) {
            // Print any exceptions that occur
            e.printStackTrace();
        }

        // Redirect to the confirmation page after submitting the reservation
        response.sendRedirect("confirmationPage.jsp");
    }
%>
