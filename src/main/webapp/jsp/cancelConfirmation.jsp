<!-- Anthony Williams : Moffat Bay Assignment -->
<!-- This jsp file informs the user that their reservation was successfully cancelled. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Reservation Canceled</title>
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/ConfirmationPageStyle.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
    <div class="wrapper">
        <header>
            <h1>Your reservation has been canceled.</h1>
        </header>
        
        <!-- Display the cancellation message -->
        <div class="reservation-details">
            <br>
            <h3>Sorry to see you go.</h3>
            <h3>We hope to see you again at Moffat Bay Lodge!</h3>
        </div>
        
        <div class="button-container" style="margin: 20px;">
            <a href="/Moffat_Bay/jsp/Landing Page.jsp" class="back-button">Home</a>
        </div>
    </div>
</body>
</html>
