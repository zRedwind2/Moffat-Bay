<!-- Anthony Williams, Brett Stovall : Moffat Bay Assignment : Bottom Bar -->
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
    <h1>Your reservation has been confirmed!</h1>
    <p>Thank you for choosing Moffat Bay Lodge.</p>
    <a href="/Moffat_Bay/jsp/Landing Page.jsp">Back to Landing Page</a>
</body>
</html>
