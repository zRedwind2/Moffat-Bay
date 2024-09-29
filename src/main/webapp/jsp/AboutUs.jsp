<!-- Brett Stovall : Moffat Bay Assignment : About Us page -->
<!-- Edits by Louis Capps -->
<!-- This jsp file sets up the About Us page of the website. -->


<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
    <!-- Includes TopMenu.jsp for the top navigation bar. -->
    <jsp:include page="TopMenu.jsp" flush="true" />
    <!-- Includes BottomMenu.jsp for the bottom navigation bar. -->
    <jsp:include page="BottomMenu.jsp" flush="true" />
    <title>About Us</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Link to AboutUs.css for specific page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/AboutUs.css">
</head>
<body>
    <div class="container">
        <!-- Landing page image -->
        <img src="/Moffat_Bay/images/landing_page1.png" alt="Moffat Bay Lodge" class="landing-page-image"><br />
        <div class="content-box">
            <!-- Main heading -->
            <h1 class="main-heading">Moffat Bay Lodge</h1>
            <div class="image-row">
                <!-- Above description images -->
                <img src="/Moffat_Bay/images/about us page image 2.jpg" alt="Above Description Image 1" class="above-description1">
                <img src="/Moffat_Bay/images/about us image 1.jpg" alt="Above Description Image 2" class="above-description2">
            </div>
            <div class="description-box">
                <!-- Description text -->
                <p class="description">
                    Welcome to Moffat Bay Lodge, your serene escape nestled in the heart of nature. Our lodge offers a perfect 
                    blend of rustic charm and modern comfort, making it an ideal destination for those seeking tranquility and 
                    adventure alike. Founded in 2000, Moffat Bay Lodge has been a sanctuary for nature lovers and adventure seekers. 
                    Our mission is to provide a peaceful retreat where guests can reconnect with nature and themselves. Over the years, 
                    we have grown from a small family-run lodge to a beloved destination known for its warm hospitality and stunning 
                    surroundings. At Moffat Bay Lodge, we offer a variety of accommodations to suit every need. From cozy cabins to spacious 
                    suites, each room is designed with comfort and relaxation in mind. Enjoy breathtaking views of the bay, modern amenities, 
                    and the rustic charm that makes our lodge unique.
                </p>
            </div>
            
            <div class="description-box">
				<h2>Contact Us</h2>
				<p class="phone"><strong>Phone number:</strong> 123-456-7890</p>
				<p class="email"><strong>Email:</strong> MoffatBay@email.com</p>
				<p class="address"><strong>Address:</strong> 123 Moffat Bay Dr. Moffat Bay City, FL, 98765 </p>
            </div>
            <!-- Below description image -->
            <img src="/Moffat_Bay/images/about us page image 3.jpg" alt="Moffat Bay Lodge" class="below-description"><br />
        </div>
    </div>
</body>
</html>
