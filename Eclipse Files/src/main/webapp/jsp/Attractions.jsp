<!-- Brett Stovall : Moffat Bay Assignment : Attraction Page -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Attractions</title>
    <!-- Link to the CSS file for the Attractions page -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/Attractions.css">
    <!-- Link to main.css for other page styles -->
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/main.css">
</head>
<body>
    <!-- Includes TopMenu.jsp for the top navigation bar -->
    <jsp:include page="TopMenu.jsp" flush="true" />

    <main>
        <div class="PageTitle"></div> <!-- Removed the Explore Moffat Bay text -->
        <div class="Overview">
            <div class="OverviewText">
                <p>Overview of the Attraction Available</p>
            </div>
            <div class="OverviewImages">
                <div class="ImagePlaceholder">
                    <img src="/Moffat_Bay/images/multnomah-falls-2.jpg" alt="Local Hiking Trails">
                </div>
                <div class="ImagePlaceholder">
                    <img src="/Moffat_Bay/images/kayak.jpg" alt="Kayak Rental">
                </div>
                <div class="ImagePlaceholder">
                    <img src="/Moffat_Bay/images/scuba_diving.jpg" alt="Scuba Diving">
                </div>
                <div class="ImagePlaceholder">
                    <img src="/Moffat_Bay/images/whale-watching.jpg" alt="Whale Watching">
                </div>
            </div>
        </div>
        <div class="AttractionSection">
            <div class="ImagePlaceholder large">
                <img src="/Moffat_Bay/images/pine-mountain-trail-1486655109.jpg" alt="Local Hiking Trails">
            </div>
            <div class="Description">
                <h1>Hiking Trails</h1>
                <p>Discover the Beauty of Nature on Our Hiking Trails. Embark on an unforgettable journey through our local hiking trails, where nature’s wonders await at every turn. Traverse ancient forests, climb rugged cliffs, and enjoy panoramic vistas of the Atlantic Ocean. Whether you’re an avid hiker or a casual walker, our trails offer a serene escape into the heart of the island’s natural beauty. Breathe in the fresh island air and uncover the secrets of the wilderness on an adventure that promises both tranquility and excitement.</p>
            </div>
        </div>
        <div class="AttractionSection reverse">
            <div class="ImagePlaceholder large">
                <img src="/Moffat_Bay/images/KayakRentals.jpg" alt="Kayak Rental">
            </div>
            <div class="Description">
                <h1>Kayak Rental</h1>
                <p>Explore the Waters with Our Kayak Rentals. Dive into a kayaking adventure that caters to all skill levels, from beginners to seasoned paddlers. Our kayak rentals provide the perfect opportunity to explore calm, scenic routes and rugged coastlines. Paddle through hidden coves, witness breathtaking sunsets, and immerse yourself in the serene beauty of the Atlantic. Whether you’re seeking a peaceful escape or an exhilarating challenge, our kayaking experience promises unforgettable moments on the water.</p>
            </div>
        </div>
        <div class="AttractionSection">
            <div class="ImagePlaceholder large">
                <img src="/Moffat_Bay/images/scuba_dive_asthma_1296x728_header-1024x575.webp" alt="Scuba Diving">
            </div>
            <div class="Description">
                <h1>Scuba Diving</h1>
                <p>Dive into Adventure with Scuba Diving. Experience the mesmerizing underwater world of the Atlantic Ocean with our scuba diving excursions at Moffat Bay. Dive into crystal-clear waters teeming with vibrant marine life, explore kelp forests, and discover captivating shipwrecks. Our secluded diving haven offers an unparalleled opportunity to immerse yourself in an underwater paradise. Whether you’re a novice or an experienced diver, the beauty and mystery of the ocean depths await you.</p>
            </div>
        </div>
        <div class="AttractionSection reverse">
            <div class="ImagePlaceholder large">
                <img src="/Moffat_Bay/images/whale-spotting.jpg" alt="Whale Watching Cruise">
            </div>
            <div class="Description">
                <h1>Whale Watching Cruise</h1>
                <p>Witness the Majesty of Whales on Our Whale Watching Cruise. Join us for a thrilling whale watching cruise and witness the majestic giants of the ocean in their natural habitat. Our expert guides will take you on an unforgettable journey along the stunning coastline of the Atlantic. Marvel at the sight of whales breaching and playing in the water, and learn about their behaviors and habitats. This once-in-a-lifetime experience offers a unique opportunity to connect with nature and create lasting memories.</p>
            </div>
        </div>
    </main>

    <!-- Includes BottomMenu.jsp for the bottom navigation bar -->
    <jsp:include page="BottomMenu.jsp" flush="true" />
</body>
</html>
