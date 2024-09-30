<!-- Louis Capps : Anthony Williams: Moffat Bay Assignment : Reservation Page -->
<!-- Datepicker code provided by https://jqueryui.com/datepicker/ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Reservation</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Reservation.css">
    <jsp:include page="TopMenu.jsp" flush="true" />
    <jsp:include page="BottomMenu.jsp" flush="true" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
    <script>
        $(function() {
            const today = new Date();
            const tomorrow = new Date();
            tomorrow.setDate(today.getDate() + 1);

            $("#checkIn").datepicker({
                minDate: today,
                onSelect: function(selectedDate) {
                    const checkInDate = $(this).datepicker("getDate");
                    $("#checkOut").datepicker("option", "minDate", new Date(checkInDate.getTime() + 24 * 60 * 60 * 1000));
                    calculateTotalPrice();
                }
            });

            $("#checkOut").datepicker({
                minDate: tomorrow,
                onSelect: function(selectedDate) {
                    const checkOutDate = $(this).datepicker("getDate");
                    $("#checkIn").datepicker("option", "maxDate", new Date(checkOutDate.getTime() - 24 * 60 * 60 * 1000));
                    calculateTotalPrice();
                }
            });

            $('#roomSize').change(function() {
                const roomImage = $('#roomImage');
                const selectedRoom = $(this).val();
                let imagePath = '';

                switch (selectedRoom) {
                    case '1':
                        imagePath = '${pageContext.request.contextPath}/images/double-full.jpg';
                        break;
                    case '2':
                        imagePath = '${pageContext.request.contextPath}/images/queen.jpg';
                        break;
                    case '3':
                        imagePath = '${pageContext.request.contextPath}/images/double-queen.jpg';
                        break;
                    case '4':
                        imagePath = '${pageContext.request.contextPath}/images/king.jpg';
                        break;
                    default:
                        imagePath = ''; // Handle unexpected values
                        break;
                }

                roomImage.attr('src', imagePath).show();
            });

            // Trigger change event on page load to ensure image updates correctly
            $('#roomSize').trigger('change');
        });

        function calculateTotalPrice() {
            const checkInDate = $("#checkIn").datepicker("getDate");
            const checkOutDate = $("#checkOut").datepicker("getDate");
            const guests = $("#guests").val();
            const pricePerNight = guests <= 2 ? 120.75 : 157.50;

            if (checkInDate && checkOutDate) {
                const timeDiff = Math.abs(checkOutDate - checkInDate);
                const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                const totalPrice = diffDays * pricePerNight;
                $("#totalPrice").text("Total Price: $" + totalPrice.toFixed(2));
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Make a Reservation</h1>
        <form action="${pageContext.request.contextPath}/ReservationServlet" method="post">
            <div class="details">
                <div class="dropdown-menus">
                    <label for="guests">Guests: </label>
                    <select id="guests" name="guests" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <br/>
                    <label for="roomSize">Room Size: </label>
                    <select id="roomSize" name="roomSize" required>
                        <option value="1">Double Full Bed</option>
                        <option value="2">Queen</option>
                        <option value="3">Double Queen Beds</option>
                        <option value="4">King</option>
                    </select>
                    <br/>
                    <label for="checkIn">Check-In: </label>
                    <input type="text" id="checkIn" name="checkIn" required><br/>
                    <label for="checkOut">Check-Out: </label>
                    <input type="text" id="checkOut" name="checkOut" required><br/>
                </div>
            </div>

            <!-- Image below the input data -->
            <div class="image-container">
                <img id="roomImage" src="" alt="Room Image" style="width: 350px; display: none;">
            </div>

            <div class="total-price-container">
                <h2 id="totalPrice">Total Price: $0.00</h2>
            </div>

            <div class="total-button">
                <button type="submit">Book Now!</button>
            </div>
        </form>
    </div>
</body>
</html>
