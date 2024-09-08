<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <!-- Link to bottomNav.css for footer styles -->
    <link rel="stylesheet" type="text/css" href="bottomNav.css">
    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
    <!-- Link to registration.css for Registration page styles --> 
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/registration.css">
    <!-- Includes TopMenu.jsp for the top naviation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
</head>
<body>

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
                <button type="submit" >Submit</button>

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
