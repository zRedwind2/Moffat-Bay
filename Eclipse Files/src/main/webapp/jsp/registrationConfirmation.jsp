<!-- Levonte Abercrombie : Moffat Bay Assignment : Registration Confirmation -->
<!-- Simple page to confirm user registration. -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Confirmed</title>
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/ConfirmationPageStyle.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
</head>
<body>
	<div class="wrapper2">
        <header>
            <h1>Your registration has been confirmed!</h1>
            <h2>Thank you for creating an account with Moffat Bay Lodge.</h2>
        </header>
        <div class="button-container" style="margin-top: 20px;">
            <a href="/Moffat_Bay/jsp/Landing Page.jsp" class="back-button">Home</a>
        </div>
    </div>
</body>
</html>
