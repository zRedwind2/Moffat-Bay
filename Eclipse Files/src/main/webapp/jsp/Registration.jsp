<!-- Anthony Williams : Moffat Bay Assignment : Registration Page -->
<!-- This JSP sets up the Registration Page. -->
<!-- Brett Stovall updated the page to have a pop-up showing you are registered -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>

    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
    <!-- Link to registration.css for Registration page styles --> 
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/registration.css">
    <!-- Includes TopMenu.jsp for the top navigation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <!-- Link to bottomNav.css for footer Navigation bar -->
    <jsp:include page="BottomMenu.jsp" flush="true" />
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
                        <td><label for="username">Username</label></td>
                        <td><input type="text" id="username" name="username" required></td>
                    </tr>
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
                        <td><label for="addressStreet">Street Address</label></td>
                        <td><input type="text" id="addressStreet" name="addressStreet" required></td>
                    </tr>
                    <tr>
                        <td><label for="addressCity">City</label></td>
                        <td><input type="text" id="addressCity" name="addressCity" required></td>
                    </tr>
                    <tr>
                        <td><label for="addressState">State</label></td>
                        <td><input type="text" id="addressState" name="addressState" required></td>
                    </tr>
                    <tr>
                        <td><label for="addressZip">Zip Code</label></td>
                        <td><input type="text" id="addressZip" name="addressZip" required></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password</label></td>
                        <td><input type="password" id="password" name="password" required></td>
                    </tr>
                </table>

                <!-- Toggle password visibility -->
                <div style="margin-top: 10px;">
                    <input type="checkbox" id="togglePassword"> 
                    <label for="togglePassword">Show Password</label>
                </div>

                <button type="submit">Submit</button>

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

            <!-- Success Popup -->
            <div id="successPopup" class="popup">
                <div class="popup-content">
                    <span class="close">×</span>
                    <h2>Registration Successful!</h2>
                    <p>Your account has been created successfully.</p>
                    <a href="${pageContext.request.contextPath}/LandingPage.jsp" class="button">Go to Landing Page</a>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript placed at the end of the body -->
    <script>
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordField = document.getElementById('password');
            if (this.checked) {
                passwordField.type = 'text'; // Show password
            } else {
                passwordField.type = 'password'; // Hide password
            }
        });

        function showSuccessPopup() {
            var popup = document.getElementById("successPopup");
            popup.style.display = "block";
        }

        document.querySelector(".close").onclick = function() {
            var popup = document.getElementById("successPopup");
            popup.style.display = "none";
        }

        window.onclick = function(event) {
            var popup = document.getElementById("successPopup");
            if (event.target == popup) {
                popup.style.display = "none";
            }
        }

        <% if (request.getAttribute("registrationSuccess") != null) { %>
            showSuccessPopup();
        <% } %>
    </script>
</body>
</html>


