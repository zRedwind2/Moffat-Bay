<!-- Brett Stovall w/ minor edits and comments by Louis Capps : Moffat Bay Assignment : Landing Page -->
<!-- This jsp file sets up the Landing Page of the website. -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="Moffat Bay Lodge - Your new favorite getaway spot on the gorgeous shores of Portland, Maine.">
    <meta name="keywords" content="Moffat Bay Lodge, Portland, Maine, getaway, nature, luxury">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Referencing stylesheet -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/LandingPageStyle.css">
    
    <!-- Includes TopMenu.jsp for the top naviation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    
    <jsp:include page="BottomMenu.jsp" flush="true" />
    <title>Moffat Bay Lodge</title>
</head>
<body>
    <div class="wrapper">
        <div class="body-content">
        	<div class = "header">
            	<div class = "fishb">
        		<img src="/Moffat_Bay/images/fishb.png">
        		</div>
            	<h1>Moffat Bay Lodge</h1>
        		<div class = "fishf">
        		<img src="/Moffat_Bay/images/fishf.png">
        		</div>
            </div>
            <!-- Image and text blurb about Moffat Bay Lodge. -->
            <p>
                <img src="/Moffat_Bay/images/landing_page1.png" alt="Moffat Bay Lodge" class="landing-page-image"><br />
                Hey there! Welcome to Moffat Bay Lodge, your new favorite getaway spot tucked away on the gorgeous shores of
                Portland, right off the stunning coast of Maine! We can't wait for you to dive into the incredible beauty and 
                peace that Maine has to offer. At Moffat Bay Lodge, we are all about mixing the wild charm of nature with a 
                sprinkle of luxurious comfort. Picture this: a cozy haven where you can kick back, listen to the soothing ocean 
                waves, and soak in the tranquil vibes of the ancient forest. So come along with us on an exciting adventure through 
                the wonders of Moffat Bay Lodge, where relaxation, adventure, and the enchanting spirit of Maine are just waiting for you!
            </p>
            <!-- div class links contains three different items for the three image/link/input field sections of the landing page. -->
            <div class="links">
            	<!-- This link-item div class contains an image and a button. -->
                <div class="link-item">
                    <div class="image-box image-box-small">
                    	<!-- Uses the div image-small class to define the size of the picture in the css file. -->
                    	<img src="/Moffat_Bay/images/pexels-hikaique-775201.jpg" alt="Link 1 Image" class="image-small">
                    	<!-- A button div class is used for the buttons on the page. -->
						<div class="button">
                        	<button onclick="location.href='/Moffat_Bay/jsp/AboutUs.jsp'">Moffat Bay Lodge</button>
                        </div>
                    </div>
                </div>
                <!-- This link-item div class contains an image and a button. -->
                <div class="link-item">
                    <div class="image-box image-box-medium">
                    	<!-- Uses the div image-medium class to define the size of the picture in the css file. -->
                        <img src="/Moffat_Bay/images/pexels-rich-howard-1910092-12084941.jpg" alt="Link 2 Image" class="image-medium">
                        <!-- A button div class is used for the buttons on the page. -->
						<div class="button">
                        	<button onclick="location.href='/Moffat_Bay/jsp/Attractions.jsp'">Attractions
                        </div>
                    </div>
                </div>
                <!-- The following link-item contains an image, two buttons, and two input fields. -->
                <div class="link-item">
                    <div class="image-box image-box-large">
                    	<!-- Uses the div image-large no-cursor class to define the size of the picture in the css file. -->
                        <img src="/Moffat_Bay/images/istockphoto-135565559-612x612.jpg" alt="Link 3 Image" class="image-large no-cursor">
                        <div class="reservation-options">
                       		<!-- A button div class is used for the buttons on the page. -->
                        	<div class="button">
                        		<button onclick="location.href='/Moffat_Bay/jsp/Reservation.jsp'">Make a Reservation</button>
                            </div>
                            <!-- A seperate dive class for the reservation look-up button and text fields. -->
                            <div class="reservation-inputs">
							    <br/>
							    Reservation Look-up
							    <br/>
							    <br/>
							    <form action="${pageContext.request.contextPath}/ReservationReviewServlet" method="get">
							        <label for="reservation-id">ID</label>
							        <input type="text" id="reservation-id" name="bookingId" required>
							        <br/>
							        <label for="reservation-email">Email</label>
							        <input type="email" id="reservation-email" name="email" required>
							        <button type="submit">Enter</button>
							    </form>
							</div>
                        </div>
                    </div>
                </div>
            </div>
            <br /><br /><br />
        </div>
    </div>
</body>
</html>