<!-- Anthony Williams, Brett Stovall : Moffat Bay Assignment -->
<!-- This jsp file informs the user their reservation was successfully made. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Reservation Confirmed</title>
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/ConfirmationPageStyle.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>Your reservation has been confirmed!</h1>
        </header>
        
        <!-- Display the confirmation message and Booking ID -->
        <div class="reservation-details">
            <p><strong>Reservation ID: <%= request.getParameter("bookingId") %></strong></p> <!-- Updated line -->
            <br>
            <h3>Thank you for choosing Moffat Bay Lodge.</h3>
        </div>
        
        <div class="button-container" style="margin-top: 20px;">
            <a href="/Moffat_Bay/jsp/Landing Page.jsp" class="back-button">Home</a>
        </div>
    </div>
</body>
</html>
