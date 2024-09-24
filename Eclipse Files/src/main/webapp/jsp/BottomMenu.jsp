<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/BottomNav.css">

<div class="bottomnav" id="bottomBar">
    <ul>
        <li><a href="/Moffat_Bay/jsp/Landing Page.jsp">Home</a></li>
        <li>-</li>
        <li><a href="/Moffat_Bay/jsp/AboutUs.jsp">About Us</a></li>
</div>

<script>
    window.onscroll = function() {
        var bottomBar = document.getElementById("bottomBar");
        if ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight) {
            bottomBar.style.display = "block"; // Show the bottom bar when at the bottom
        } else {
            bottomBar.style.display = "none"; // Hide the bottom bar otherwise
        }
    };
</script>
