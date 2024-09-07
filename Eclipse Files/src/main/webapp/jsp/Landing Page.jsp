<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="Moffat Bay Lodge - Your new favorite getaway spot on the gorgeous shores of Portland, Maine.">
    <meta name="keywords" content="Moffat Bay Lodge, Portland, Maine, getaway, nature, luxury">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <link rel="stylesheet" type="text/css" href="/Moffat_Bay/css/LandingPageStyle.css">
    <title>Moffat Bay Lodge</title>
</head>
<body>
    <div class="wrapper">
        <div class="body-content">
            <h1>Moffat Bay<br />Lodge</h1>
            <p>
                <img src="/Moffat_Bay/images/landing_page1.jpg" alt="Moffat Bay Lodge" class="landing-page-image"><br />
                Hey there! Welcome to Moffat Bay Lodge, your new favorite getaway spot tucked away on the gorgeous shores of
                Portland, right off the stunning coast of Maine! We can't wait for you to dive into the incredible beauty and 
                peace that Maine has to offer. At Moffat Bay Lodge, we are all about mixing the wild charm of nature with a 
                sprinkle of luxurious comfort. Picture this: a cozy haven where you can kick back, listen to the soothing ocean 
                waves, and soak in the tranquil vibes of the ancient forest. So come along with us on an exciting adventure through 
                the wonders of Moffat Bay Lodge, where relaxation, adventure, and the enchanting spirit of Maine are just waiting for you!
            </p>
            <div class="links">
                <div class="link-item">
                    Moffat Bay Lodge
                    <div class="image-box image-box-small">
                        <a href="https://www.example1.com">
                            <img src="/Moffat_Bay/images/pexels-hikaique-775201.jpg" alt="Link 1 Image" class="image-small">
                        </a>
                    </div>
                </div>
                <div class="link-item">
                    Attractions
                    <div class="image-box image-box-medium">
                        <a href="https://www.example2.com">
                            <img src="/Moffat_Bay/images/pexels-rich-howard-1910092-12084941.jpg" alt="Link 2 Image" class="image-medium">
                        </a>
                    </div>
                </div>
                <div class="link-item">
                    Make a reservation
                    <div class="image-box image-box-large">
                        <img src="/Moffat_Bay/images/istockphoto-135565559-612x612.jpg" alt="Link 3 Image" class="image-large no-cursor">
                        <div class="reservation-options">
                            <button>Make a Reservation</button>
                            <button>Reservation Look-up</button>
                            <div class="reservation-inputs">
                                <label for="reservation-id">ID</label>
                                <input type="text" id="reservation-id" name="reservation-id">
                                <label for="reservation-email">Email</label>
                                <input type="email" id="reservation-email" name="reservation-email">
                                <button>Enter</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="login"><i class="fa fa-user-circle-o" style="float:right;font-size:56px;color:#dad7cd"></i></a>
            <br /><br /><br />
        </div>
    </div>
</body>
</html>
