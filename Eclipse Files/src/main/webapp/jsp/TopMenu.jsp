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
  <a href="#home">Home</a>
  <a href="#AboutUs">About Us</a>
  <a href="#Attractions">Attractions</a>
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
      <a href="#Login">Login</a>
      <a href="#Registration">Registration</a>
      <a href="#Reservation">Reservation</a>
      <a href="#Resrvation Lookup">Reservation Lookup</a>
    </div>
  </div>
</div>
