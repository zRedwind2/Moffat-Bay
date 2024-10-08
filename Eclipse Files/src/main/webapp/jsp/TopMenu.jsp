<!-- Louis Capps : Moffat Bay Assignment : Top Bar -->
<!-- This jsp file sets up the top bar of the view screen. It can be included in other JSP's to show the top menu bar. -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!-- Referencing stylesheet -->
<link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/topNav.css">

<!-- Creating navbar div class -->
<div class="navbar">
	<!-- Adding Left image and links. -->
  <img src="/Moffat_Bay/images/lodge.jpg" alt="Image">
  <a href="/Moffat_Bay/jsp/Landing Page.jsp">Home</a>
  <a href="/Moffat_Bay/jsp/AboutUs.jsp">About Us</a>
  <a href="/Moffat_Bay/jsp/Attractions.jsp">Attractions</a>
  <div class="username">
<% if (session.getAttribute("userUsername") != null) { %>
    Hello ${sessionScope.userUsername}
<% } %>

	</div>
  <!-- Creating a div class for the dropdown menu -->
  <div class="dropdown">
  	<!-- Adding a button for the dropdown menu -->
    <button class="dropbtn">
    <!-- Adding an image for the dropdown menu icon -->
    <img src="/Moffat_Bay/images/dropdownicon.png" alt="Dropdown Image">
      <i class="fa fa-caret-down"></i>
    </button>
    <!-- Setting up the dropdown content div class to hold the links -->
    <div class="dropdown-content">
    <% if (session.getAttribute("userUsername") != null) { %>
	  <a href="${pageContext.request.contextPath}/logout">Logout</a>
	  <a href="/Moffat_Bay/jsp/account.jsp">Account</a>
	<% } else { %>
      <a href="/Moffat_Bay/jsp/login.jsp">Login</a>
      <a href="/Moffat_Bay/jsp/Registration.jsp">Registration</a>
	<% } %>
      <a href="/Moffat_Bay/jsp/Reservation.jsp">Reservation</a>
      <a href="/Moffat_Bay/jsp/lookupReservation.jsp">Reservation Lookup</a>
    </div>
  </div>
</div>