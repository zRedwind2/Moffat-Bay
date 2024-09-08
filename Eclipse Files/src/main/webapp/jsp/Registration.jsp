<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <!-- Link to topNav.css for navigation bar styles -->
    <link rel="stylesheet" type="text/css" href="topNav.css">
    <!-- Link to bottomNav.css for footer styles -->
    <link rel="stylesheet" type="text/css" href="bottomNav.css">
    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>

    <!-- Top Navigation Bar -->
    <div class="navbar">
        <!-- Logo on the left -->
        <img src="logo.png" alt="Logo" width="50" height="50">

        <!-- Centered Navigation Links -->
        <div class="nav-center">
            <a href="rooms.jsp">Rooms</a>
            <a href="attractions.jsp">Attractions</a>
            <a href="register.jsp">Sign Up</a>
        </div>

        <!-- Dropdown for Account on the right -->
        <div class="dropdown">
            <button class="dropbtn">Account</button>
            <div class="dropdown-content">
                <a href="login.jsp">Login</a>
                <a href="reservations.jsp">My Reservations</a>
            </div>
        </div>
    </div>

    <!-- Main Registration Form -->
    <div class="container">
        <div class="registration-form">
            <h2 style="text-align: center;">Create Your Account</h2>

            <!-- Form submission to RegistrationServlet -->
            <form id="registrationForm" method="post" action="${pageContext.request.contextPath}/RegistrationServlet" style="display: flex; flex-direction: column; align-items: center;">
                <table>
                    <tr>
                        <td><label for="firstName">First Name</label></td>
                        <td><input type="text" id="firstName" name="firstName" required></td>
                    </tr>
                    <tr>
                        <td><label for="lastName">Last Name</label></td>
                        <td><input type="text" id="lastName" name="lastName" required></td>
                    </tr>
                    <tr>
                        <td><label for="email">Email Address</label></td>
                        <td><input type="email" id="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td><label for="phone">Phone Number</label></td>
                        <td><input type="text" id="phone" name="phone" required></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password</label></td>
                        <td><input type="password" id="password" name="password" required></td>
                    </tr>
                </table>
                <button type="submit" style="width: 30%; margin-top: 15px; font-size: 18px; font-weight: bold;">Submit</button>

                <!-- Display error message if set -->
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                    <div id="message" style="margin-top: 20px; color: red;"><%= errorMessage %></div>
                <%
                    }
                %>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
    </div>

</body>
</html>
