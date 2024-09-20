
<!-- Jeremy Ginter : Moffat Bay Assignment : Login Page -->
<!-- Login Page JSP file -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
    <!-- Link to registration.css for Registration page styles --> 
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/login.css">
    <!-- Includes TopMenu.jsp for the top navigation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <!-- Link to bottomNav.css for footer Navigation bar -->
    <jsp:include page="BottomMenu.jsp" flush="true" />

<title>Moffat Bay Lodge</title>
</head>
<body>
<div class="wrapper">
<div class="body">
<p> 
<!-- Top Image Under Top Menu Bar, placeholder for now -->
<!-- <img src="/Moffat_Bay/images/landing_page1.png" alt="Moffat Bay Lodge" class="landing-page-image"><br />  -->
</p>

<!--  Contains Login Box with fields for username and password, and button to login after entering information.  -->
<div class="loginBox">
<form id="loginForm" method="post" action="${pageContext.request.contextPath}/LoginServlet" style="display: flex; flex-direction: column; align-items: center;">
<h2 style="text-align: center;">Login</h2>
<table>

<tbody>
<tr>
<td><label for="username">Username:</label></td>
<td><input type="text" id="username" name="username" /></td>
</tr>
<tr>
<td><label for="password">Password:</label></td>
<td><input type="text" id="password" name="password" /></td>
</tr>
</tbody>

</table>
<!-- Login Button -->

<button type="submit" >Submit</button>
</form>

</div>
</div>
</div>



</body>
</html>