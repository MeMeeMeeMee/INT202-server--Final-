<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <style>
        .cart-info {
            margin-left: -1em;
            border-radius: 12px;
            background-color: bisque;
            position: absolute;
            z-index: 100;
            border: none;
            padding-left: 5px;
            padding-right: 5px;
            display: none;
        }

        .div-link {
            cursor: pointer;
            border: 1px burlywood solid;
        }

        .div-link:hover {
            background-color: bisque;
        }
    </style>
    <script>
        let count = 1;

        function testAjax() {
            //alert("This is testAjax() function !!!");
            let xhr = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อให้เราสามารถทำงานกับเซิร์ฟเวอร์ได้

            xhr.onload = function () { //ฟังก์ชันนี้จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์ มันจะตรวจสอบรหัสสถานะ HTTP และอัปเดตเนื้อหา HTML ตามที่เห็นพอดี
                if (xhr.status != 200) {
                    //ถ้ารหัสสถานะ HTTP ไม่ใช่ 200 (OK) จะแสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาด
                    alert('Errror: ' + xhr.status);
                } else { // show the result
                    //ถ้ารหัสสถานะเป็น 200 จะตั้งค่า HTML ภายในอิลิเมนต์ที่มี ID "result" เป็นข้อความที่ได้รับจากเซิร์ฟเวอร์
                    document.getElementById("result").innerHTML = xhr.responseText;
                }
            };
            //เปิดคำขอ GET ใหม่ด้วย URL ที่ได้จากอิลิเมนต์อินพุตที่มี ID "url" และส่งคำขอไปยังเซิร์ฟเวอร์
            xhr.open("GET", document.getElementById("url").value);
            xhr.send();
        }

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            //บรรทัดนี้ถูก comment out ไว้ (ปิดการใช้งาน) แต่ถ้าคุณต้องการให้มีการแจ้งเตือนเมื่อโปรแกรมกำลังโหลดข้อมูล คุณสามารถเปิดการใช้งาน alert นี้ได้.
            //alert('page: '+ page + ", size: "+ pageSize)


            setLoading('on'); //หากฟังก์ชัน setLoading นี้ถูกนิยามที่อื่น คาดว่ามันทำหน้าที่ตั้งค่าสถานะการโหลดให้เป็น 'on'.
            const xhttp = new XMLHttpRequest(); //URL ที่ใช้ในคำขอ GET นี้สร้างขึ้นโดยรวมเว็บเซิร์ฟเวอร์ที่คุณกำลังใช้.

            xhttp.onload = function () {
                setLoading('off'); // ปิดสถานะการโหลด
                if (xhttp.status == 200) { // ตรวจสอบว่ารหัสสถานะ HTTP เป็น 200 (OK) หรือไม่
                    //นี้คือส่วนที่ทำให้เนื้อหา HTML ของอิลิเมนต์ที่กำหนดด้วย ID "body-content" ถูกอัปเดตโดยข้อมูลที่ได้รับจากเซิร์ฟเวอร์.
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    // แสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาด
                    alert('Errror: ' + xhttp.status + " --- " + xhttp.responseText);
                }
            }
            xhttp.open("GET", "product-list?page=" + page + "&pageSize=" + pageSize); // เปิดคำขอ GET ด้วย URL ที่ระบุ
            xhttp.send();  // ส่งคำขอ
        }

        function loadOffice(officeCode) {
            setLoading('on'); // น่าจะมีฟังก์ชัน setLoading ที่ถูกนิยามที่อื่นเพื่อกำหนดสถานะการโหลดให้เป็น 'on'.
            const xhttp = new XMLHttpRequest(); // สร้างอ็อบเจกต์ XMLHttpRequest เพื่อให้สามารถทำการร้องขอ HTTP ไปยังเซิร์ฟเวอร์ได้.
            xhttp.onload = function () { //นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์. ในนี้, มันจะปิดสถานะการโหลดและตรวจสอบรหัสสถานะ HTTP.
                setLoading('off');

                if (xhttp.status == 200) {// ตรวจสอบว่ารหัสสถานะ HTTP เป็น 200 (OK) หรือไม่
                    //อัปเดตเนื้อหา HTML ของอิลิเมนต์ที่กำหนดด้วย ID "body-content" ด้วยข้อมูลที่ได้รับจากเซิร์ฟเวอร์.
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    //ถ้ารหัสสถานะ HTTP ไม่ใช่ 200, จะมีการแสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาดที่ได้.
                    alert('Errror: ' + xhttp.status + " --- " + xhttp.responseText);
                }
            }
            xhttp.open("GET", "office-list?officeCode=" + officeCode); //URL ที่ใช้ในคำขอ GET นี้จะรวมเว็บเซิร์ฟเวอร์ที่ใช้ และรหัสสำนักงาน (office code) ที่ถูกส่งเข้าไป.
            xhttp.send(); //ส่งคำขอ HTTP GET ไปยังเซิร์ฟเวอร์.
        }

        var thisContent = '';

        function setLoading(on_off) { //นี่คือการดึงอิลิเมนต์ที่มี ID "loading" โดยใช้ document.getElementById ซึ่งในที่นี้สมมติว่ามีอิลิเมนต์นี้ใน HTML และถูกตั้งชื่อ "loading".
            let loading = document.getElementById("loading");
            if (on_off == 'on') { //ฟังก์ชันรับพารามิเตอร์ on_off ซึ่งคาดว่าจะเป็นสตริงที่มีค่า 'on' หรือ 'off'. ถ้าเป็น 'on' จะทำการเปิดสถานะการโหลด, ถ้าเป็น 'off' จะทำการปิดสถานะการโหลด.

                //ถ้าต้องการเปิดสถานะการโหลด, จะลบคลาส "d-none" ที่ซ่อนอิลิเมนต์และเพิ่มคลาส "d-inline" เพื่อแสดง.
                loading.classList.remove("d-none");
                loading.classList.add("d-inline");

            } else {

                //ถ้าต้องการปิดสถานะการโหลด, จะลบคลาส "d-inline" ที่แสดงอิลิเมนต์และเพิ่มคลาส "d-none" เพื่อซ่อน.
                loading.classList.remove("d-inline");
                loading.classList.add("d-none");

            }
        }

        function addToCart(productCode) {
            setLoading('on') // เรียกใช้ฟังก์ชัน setLoading เพื่อเปิดสถานะการโหลด.
            const xhttp = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อทำการร้องขอ HTTP.
            xhttp.onload = function () { // นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์.
                setLoading('off');  // เรียกใช้ฟังก์ชัน setLoading เพื่อปิดสถานะการโหลดหลังจากที่คำขอถูกส่ง.
                if (xhttp.status == 200) { // ตรวจสอบว่ารหัสสถานะ HTTP เป็น 200 (OK) หรือไม่

                    //ดึงข้อมูลจำนวนสินค้าในตะกร้าจากการตอบกลับ.
                    cartInfo = document.getElementById("noOfItemInCart");
                    noOfItem = xhttp.responseText;

                    //ถ้ามีสินค้าในตะกร้า, ให้แสดง (inline) อิลิเมนต์ที่มี ID "noOfItemInCart", ถ้าไม่มีให้ซ่อน (none). และทำการอัปเดตข้อมูลจำนวนสินค้าในตะกร้า.
                    if (noOfItem > 0) {
                        cartInfo.style.display = 'inline'
                    } else {
                        cartInfo.style.display = 'none'
                    }
                    cartInfo.innerHTML = noOfItem;

                } else {
                    // ถ้ารหัสสถานะ HTTP ไม่ใช่ 200, จะมีการแสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาดที่ได้จากเซิร์ฟเวอร์.
                    alert('Errror: ' + xhttp.status + " --- " + xhttp.getResponseHeader("error"));
                }
            }
            xhttp.open("GET", "add-to-cart?productCode=" + productCode); //URL ที่ใช้ในคำขอ GET นี้รวมเว็บเซิร์ฟเวอร์และรหัสสินค้าที่จะถูกเพิ่มลงในตะกร้า.
            xhttp.send(); //ส่งคำขอ HTTP GET ไปยังเซิร์ฟเวอร์.
        }

        function viewCart() {
            setLoading('on') // เรียกใช้ฟังก์ชัน setLoading เพื่อเปิดสถานะการโหลด.
            const xhttp = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อทำการร้องขอ HTTP.
            xhttp.onload = function () { //นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์.
                setLoading('off'); //เรียกใช้ฟังก์ชัน setLoading เพื่อปิดสถานะการโหลดหลังจากที่คำขอถูกส่ง.
                if (xhttp.status == 200) {
                    //อัปเดตเนื้อหา HTML ของอิลิเมนต์ที่มี ID "view-cart" ด้วยข้อมูลที่ได้รับจากเซิร์ฟเวอร์.
                    document.getElementById("view-cart").innerHTML = xhttp.responseText;

                    //ในที่นี้, ใช้ jQuery เพื่อเรียกใช้โมดัล 'viewCartModal' และทำการแสดงโมดัล.
                    $('#viewCartModal').modal('show');
                } else {
                    // ถ้ารหัสสถานะ HTTP ไม่ใช่ 200, จะมีการแสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาดที่ได้จากเซิร์ฟเวอร์.
                    alert('Errror: ' + xhttp.status + " --- " + xhttp.getResponseHeader("error"));
                }
            }
            xhttp.open("GET", "view-cart"); //URL ที่ใช้ในคำขอ GET นี้ระบุว่าเราต้องการดูข้อมูลในตะกร้า.
            xhttp.send(); //ส่งคำขอ HTTP GET ไปยังเซิร์ฟเวอร์.
        }

        function searchProduct(searchParam) {
            // alert('Search by ' + searchParam);
            setLoading('on'); //เรียกใช้ฟังก์ชัน setLoading เพื่อเปิดสถานะการโหลด.
            const xhttp = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อทำการร้องขอ HTTP.
            xhttp.onload = function () { //นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์.
                setLoading('off'); //เรียกใช้ฟังก์ชัน setLoading เพื่อปิดสถานะการโหลดหลังจากที่คำขอถูกส่ง.
                if (xhttp.status == 200) {
                    //อัปเดตเนื้อหา HTML ของอิลิเมนต์ที่มี ID "body-content" ด้วยข้อมูลที่ได้รับจากเซิร์ฟเวอร์.
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    //ถ้ารหัสสถานะ HTTP ไม่ใช่ 200, จะมีการแสดงแอลเลิร์ตพร้อมรหัสข้อผิดพลาดที่ได้จากเซิร์ฟเวอร์.
                    alert('Errror: ' + xhttp.status + " --- " + xhttp.getResponseHeader("error"));
                }
            }
            xhttp.open("GET", "product-search?searchParam=" + searchParam); //URL ที่ใช้ในคำขอ GET ระบุว่าเราต้องการทำการค้นหาสินค้าโดยใช้พารามิเตอร์ searchParam.
            xhttp.send(); //ส่งคำขอ HTTP GET ไปยังเซิร์ฟเวอร์.
        }

        function showLoginForm() {
            //ใช้ document.getElementById เพื่อดึงเนื้อหา HTML ของอิลิเมนต์ที่มี ID "login-menu" มาเก็บไว้ในตัวแปร menu.
            let menu = document.getElementById("login-menu").innerHTML;

            if (menu.includes('Logout')) { //ใช้ includes เพื่อตรวจสอบว่าเนื้อหา HTML มีคำว่า 'Logout' หรือไม่.
                logout(); //เรียกใช้ฟังก์ชัน logout() เพื่อทำการออกจากระบบ.
            } else {
                //ใช้ jQuery เพื่อเรียกใช้โมดัล 'modalLoginForm' และทำการแสดงโมดัล. นี่คือกระบวนการแสดงหน้าต่างล็อกอินเมื่อผู้ใช้ยังไม่ได้เข้าสู่ระบบ.
                $('#modalLoginForm').modal('show');
            }
        }

        function logout() {
            const xhttp = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อทำการร้องขอ HTTP.
            xhttp.onload = function () { //นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์.
                //เมื่อล็อกเอาท์เรียบร้อยแล้ว, ให้ใช้ location.reload() เพื่อรีโหลดหน้าเพจ ทำให้ผู้ใช้ถูกนำกลับไปยังสถานะที่ไม่ได้เข้าสู่ระบบ.
                location.reload();
            }
            xhttp.open("GET", "logout"); //URL ที่ใช้ในคำขอ GET ระบุว่าเราต้องการทำการล็อกเอาท์.
            xhttp.send(); //ส่งคำขอ HTTP GET ไปยังเซิร์ฟเวอร์. เมื่อเซิร์ฟเวอร์ได้รับคำขอล็อกเอาท์, จะทำการทำล็อกเอาท์และทำให้ผู้ใช้รีโหลดหน้าเพจ.
        }

        function login(userName, password) {
            //ตรวจสอบว่าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้องหรือไม่ ถ้าไม่ถูกต้อง ให้แสดงข้อความแจ้งเตือน.
            if (userName == '' || password == '' || userName == undefined) {
                document.getElementById("login-message").innerHTML = "Invalid user name or password !!!";
            }
            setLoading('on'); //เรียกใช้ฟังก์ชัน setLoading เพื่อเปิดสถานะการโหลด.
            const xhttp = new XMLHttpRequest(); //สร้างอ็อบเจกต์ XMLHttpRequest เพื่อทำการร้องขอ HTTP.
            xhttp.onload = function () { //นี่คือฟังก์ชันที่จะถูกเรียกเมื่อคำขอเสร็จสมบูรณ์.
                setLoading('off');
                if (xhttp.status == 200) { //ตรวจสอบว่ารหัสสถานะ HTTP เป็น 200 หรือไม่.

                    //ซ่อนโมดัลล็อกอินและอัปเดตเนื้อหา HTML ของอิลิเมนต์ที่มี ID "login-menu" เพื่อแสดงว่าผู้ใช้เข้าสู่ระบบแล้ว.
                    $('#modalLoginForm').modal('hide');
                    document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout";

                } else {
                    //แสดงข้อความข้อผิดพลาดพร้อมรหัสข้อผิดพลาดที่ได้รับจากเซิร์ฟเวอร์.
                    document.getElementById("login-message").innerHTML =
                        "Login Error :" + xhttp.status + " --- " + xhttp.getResponseHeader("error");
                }
            }
            //สร้างข้อมูลที่จะส่งไปยังเซิร์ฟเวอร์ในรูปแบบ URL-encoded.
            let urlEncodedData = "", urlEncodedDataPairs = [];
            urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
            urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
            urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');

            xhttp.open("POST", "login");//เปิดคำขอ POST ไปยัง URL "login".

            //กำหนดส่วนหัวของคำขอเป็น 'application/x-www-form-urlencoded' เนื่องจากเรากำลังส่งข้อมูลในรูปแบบนี้.
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhttp.send(urlEncodedData); //ส่งคำขอ POST พร้อมกับข้อมูลที่เตรียมไว้.
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <%--  .navbar: เป็นคลาสที่ใช้กำหนดลักษณะของ Navbar.--%>
    <%--  .navbar-expand-sm: Navbar จะถูกขยายในขณะที่ขนาดของหน้าจอเล็กกว่าหรือเท่ากับ sm (small).--%>
    <%--  .navbar-dark: Navbar มีสีพื้นหลังเข้ม (dark).--%>
    <%--  .bg-dark: กำหนดสีพื้นหลังของ Navbar เป็นสีเข้ม (dark).--%>

    <div class="container-fluid"><a class="navbar-brand text-warning" href="javascript:void(0)">Classic Model</a>
        <%--        <div class="container-fluid">: Container ที่มีความกว้างเต็มหน้าจอเพื่อให้เนื้อหาของ Navbar ไม่ถูกยืดหรือบีบเมื่อเปลี่ยนขนาดหน้าจอ.--%>
        <%--        <a class="navbar-brand text-warning" href="javascript:void(0)">Classic Model</a>: ลิงก์หลักของ Navbar เป็นข้อความ "Classic Model" ที่มีสีข้อความเป็นสีเหลือง (text-warning).--%>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">: ปุ่ม Toggle Navbar สำหรับหน้าจอขนาดเล็ก.--%>

        <div class="collapse navbar-collapse" id="mynavbar">
            <%--            <div class="collapse navbar-collapse" id="mynavbar">: ส่วนที่จะถูกซ่อนหลังจากการกดปุ่ม Toggle.--%>

            <ul class="navbar-nav me-auto">
                <%--                <ul class="navbar-nav me-auto">: Unordered list สำหรับเมนูนำทางซ้าย.--%>

                <li class="nav-item"><a class="nav-link" href="javascript:loadOffice('')">Office</a></li>
                <%--                <li class="nav-item">: List item ใน Navbar.--%>
                <%--                <a class="nav-link" href="javascript:loadOffice('')">Office</a>: ลิงก์สำหรับการโหลดข้อมูลที่เกี่ยวกับ "Office" โดยใช้ JavaScript function loadOffice('').--%>

                <li class="nav-item"><a class="nav-link" href="javascript:loadProduct(1,15)">Product</a></li>
                <%--                <li class="nav-item">, <a class="nav-link" href="javascript:loadProduct(1,15)">Product</a>: ลิงก์สำหรับการโหลดข้อมูลที่เกี่ยวกับ "Product" โดยใช้ JavaScript function loadProduct(1,15).--%>

                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Order History</a>
                </li>
                <%--                <li class="nav-item">, <a class="nav-link" href="javascript:void(0)">Order History</a>: ลิงก์สำหรับ "Order History" (ยังไม่ได้ใส่การดำเนินการ).--%>

                <li class="nav-item ml-4">
                    <a class="nav-link text-light" href="javascript:showLoginForm()" id="login-menu">
                        <i class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
                <%--                <li class="nav-item ml-4">, <a class="nav-link text-light" href="javascript:showLoginForm()" id="login-menu">: ลิงก์สำหรับการแสดงหน้าต่างล็อกอินหรือแสดงหน้าต่างออก, และ ID คือ "login-menu".--%>
            </ul>

            <div style="margin-right: 20px">
                <img src="assets/images/cart.png" width="42" onclick="viewCart()"/>
                <button id="noOfItemInCart" class="cart-info" onclick="viewCart()"></button>
                <%--                <img src="assets/images/cart.png" width="42" onclick="viewCart()"/>: รูปภาพที่ใช้เป็นไอคอนตะกร้าสินค้า และเมื่อคลิกที่รูปภาพจะทำการเรียกฟังก์ชัน viewCart().--%>
                <%--                <button id="noOfItemInCart" class="cart-info" onclick="viewCart()"></button>: ปุ่มที่จะแสดงจำนวนรายการในตะกร้าสินค้า และเมื่อคลิกที่ปุ่มจะทำการเรียกฟังก์ชัน viewCart().--%>
            </div>

            <form class="d-flex">
                <%--                <form class="d-flex">: ฟอร์มสำหรับการค้นหาสินค้า.--%>
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">
                <%--                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">: Input field สำหรับการใส่ข้อความค้นหา.--%>

                <button class="btn btn-primary" type="button"
                        onclick="searchProduct(document.getElementById('searchBox').value)">Search
                </button>
                <%--    <button class="btn btn-primary" type="button" onclick="searchProduct(document.getElementById('searchBox').value)">: ปุ่มสำหรับการทำการค้นหา โดยใช้ JavaScript function searchProduct().--%>
            </form>
        </div>
    </div>
</nav>

<div class="container" id="body-content">
    <jsp:include page="assets/home-info.html"/>
</div>
<%--    <div class="container" id="body-content">: Container สำหรับแสดงข้อมูลหลัก.--%>
<%--    <jsp:include page="assets/home-info.html"/>: ใช้ JSP (JavaServer Pages) เพื่อ include ไฟล์ assets/home-info.html เข้ามาแสดงในส่วนนี้.--%>

<div class="d-flex justify-content-center modal d-none" id="loading">
    <div class="spinner-border text-primary"
         style="margin-top: 10%; width: 6rem; height: 6rem;"></div>
</div>
<%--    <div class="d-flex justify-content-center modal d-none" id="loading">: Container สำหรับแสดง Spinner ในกรณีที่มีการโหลดข้อมูล.--%>
<%--    <div class="spinner-border text-primary" style="margin-top: 10%; width: 6rem; height: 6rem;"></div>: Spinner สีน้ำเงินที่ใช้แสดงในระหว่างโหลดข้อมูล.--%>

<div class="modal" tabindex="-1" id="viewCartModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="$('#viewCartModal').modal('hide')"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body" id="view-cart"><p>Modal body text goes here.</p></div>
        </div>
    </div>
</div>
<%--<div class="modal" tabindex="-1" id="viewCartModal">: ตัวโมดัลที่ใช้แสดงข้อมูลตะกร้าสินค้า.--%>
<%--    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">: กำหนดขนาดและตำแหน่งของโมดัล.--%>
<%--        <div class="modal-content">: ส่วนของเนื้อหาภายในโมดัล.--%>
<%--            <div class="modal-header">: ส่วนหัวของโมดัล.--%>
<%--                <h5 class="modal-title">Your Cart</h5>: หัวข้อของโมดัล "Your Cart".--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#viewCartModal').modal('hide')"> <span aria-hidden="true">&times;</span> </button>: ปุ่มปิดโมดัล.--%>
<%--                <div class="modal-body" id="view-cart">: ส่วนที่ใช้แสดงเนื้อหาของตะกร้าสินค้า.--%>


<jsp:include page="WEB-INF/jsp/login-form.html"/>
<%--    นี้คือการใช้ JSP (JavaServer Pages) ในการ include ไฟล์ login-form.html ที่อยู่ภายในไดเรกทอรี WEB-INF/jsp/ ลงในหน้า JSP ปัจจุบัน.--%>
</body>
</html>