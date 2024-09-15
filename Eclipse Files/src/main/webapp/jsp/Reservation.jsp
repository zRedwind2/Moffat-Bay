<!-- Louis Capps : Moffat Bay Assignment : Reservation Page -->
<!-- Datepicker code provided by https://jqueryui.com/datepicker/ -->
<!-- This jsp file sets up the top bar of the view screen. It can be included in other JSP's to show the top menu bar. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reservation</title>
	<!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/Reservation.css">
    <!-- Includes TopMenu.jsp for the top navigation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <!-- Link to bottomNav.css for footer Navigation bar -->
    <jsp:include page="BottomMenu.jsp" flush="true" />
    
    <!-- Datepicker code from https://jqueryui.com/datepicker/ -->
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  	<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
  	<script>
  		$( function() {
    		$( "#checkIn" ).datepicker();
  		} );
  		$( function() {
    		$( "#checkOut" ).datepicker();
  		} );
  	</script>
  	<!-- End of Datepicker code -->

</head>
<body>
	<div class="container">
		<h1>Make a Reservation</h1>
		<div class="menus-image">
			<div class = "images">
				<img src="/Moffat_Bay/images/double-full.jpg" alt="Image" id="roomImage">
			</div>
			
			<!-- Form to submit reservation data -->
			<form action="${pageContext.request.contextPath}/ReservationServlet" method="post">
				<div class = "dropdown-menus">
					<!-- Dropdown menu for number of guests -->
					<label for="guests">Guests: </label>
					<select id="guests" name="guests" required>
						<option value="null"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br/>
					<!-- Dropdown menu for Room Size -->
					<label for="roomSize">Room Size: </label>
					<select id="roomSize" name="roomSize" required>
						<option value="null"></option>
						<option value="doubleFullBed">Double Full Bed</option>
						<option value="queen">Queen</option>
						<option value="doubleQueenBeds">Double Queen Beds</option>
						<option value="king">King</option>
					</select>
					<br/>
					<!-- Check-in and Check-out dates -->
					<label for="checkIn">Check-In: </label>
					<input type="text" id="checkIn" name="checkIn" required><br/>
					<label for="checkOut">Check-Out: </label>
					<input type="text" id="checkOut" name="checkOut" required><br/>
				</div>
				<div class = "total-button">
					<h2>Total Price: $$$<!-- Insert code calculations here for total price --></h2>
					<button type="submit">Book Now!</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
