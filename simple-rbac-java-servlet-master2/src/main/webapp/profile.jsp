<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Profile Page</title>
<%--    กำหนดหัวข้อหน้าเว็บ (title) เป็น "Profile Page".--%>

    <meta charset="UTF-8">
<%--    กำหนด character set ของหน้าเว็บเป็น UTF-8 เพื่อรองรับการแสดงผลข้อความที่มีตัวอักษรพิเศษและภาษาต่าง ๆ ได้ถูกต้อง.--%>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    กำหนด viewport ของหน้าเว็บให้เป็นขนาดของอุปกรณ์ที่กำลังใช้งาน (device-width) และตั้งค่า initial scale เป็น 1.0 เพื่อให้หน้าเว็บแสดงผลอย่างเหมาะสมกับขนาดหน้าจอของอุปกรณ์.--%>

    <script src="https://cdn.tailwindcss.com"></script>
<%--    โหลดไฟล์ JavaScript จาก CDN เพื่อให้เว็บไซต์สามารถใช้งาน Tailwind CSS ได้.--%>
</head>
<body class="flex items-center justify-center h-screen">

<div class="w-full max-w-xs">
<%--    flex: ให้ element นี้เป็น flex container.--%>
<%--    items-center: จัดให้ children elements อยู่ตรงกลางในแนวแกนตั้ง.--%>
<%--    justify-center: จัดให้ children elements อยู่ตรงกลางในแนวนอน.--%>
<%--    h-screen: กำหนดความสูงของ element <body> ให้เท่ากับความสูงของหน้าจอ (full screen height).--%>

    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 w-full" method="post" action="auth/logout">
<%--        class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 w-full": กำหนด class ที่ใช้สำหรับการจัดการลักษณะการแสดงผลของ form. โดยมีคำสั่งดังนี้:--%>

<%--        bg-white: กำหนด background color ให้เป็นสีขาว.--%>
<%--        shadow-md: เพิ่มเงาใต้ form.--%>
<%--        rounded: กำหนดมุมของ form เป็นรูปมนต์โค้ง.--%>
<%--        px-8 pt-6 pb-8 mb-4: กำหนด padding และ margin ให้กับ form.--%>
<%--        w-full: กำหนดความกว้างของ form ให้เต็มขอบเขต (full width).--%>
<%--        method="post": กำหนดว่า form นี้จะใช้วิธีการส่งข้อมูลผ่าน HTTP POST method.--%>

<%--        action="auth/logout": กำหนด URL ที่จะให้ form นี้ส่งข้อมูลไปยังเมื่อผู้ใช้กด submit form. ในที่นี้คือ URL "auth/logout" ซึ่งอาจเป็น URL ที่ใช้ในการทำการ logout จากระบบ.--%>


        <p class="text-center text-gray-700 text-xl mb-4">User: ${user.username}</p>
<%--    class="text-center text-gray-700 text-xl mb-4": กำหนด class ที่ใช้สำหรับการจัดการลักษณะการแสดงผลข้อความ. โดยมีคำสั่งดังนี้:--%>

<%--    text-center: จัดให้อยู่ตรงกลางของพื้นที่ที่กำหนด.--%>
<%--    text-gray-700: กำหนดสีข้อความให้เป็นสีเทาเข้ม (gray-700).--%>
<%--    text-xl: กำหนดขนาดข้อความให้เป็นขนาดใหญ่ (extra-large).--%>
<%--    mb-4: กำหนด margin-bottom ให้มีขนาด 4 (medium bottom margin).--%>
<%--    User: ${user.username}: นำไปแสดงผลชื่อผู้ใช้ที่ได้จากตัวแปร ${user.username} ซึ่งอาจเป็นชื่อของผู้ใช้ที่เข้าสู่ระบบ.--%>

        <p class="text-center text-gray-700 text-xl mb-4">Role: ${user.role}</p>
<%--    class="text-center text-gray-700 text-xl mb-4": กำหนด class ที่ใช้สำหรับการจัดการลักษณะการแสดงผลข้อความ โดยมีคำสั่งดังนี้:--%>

<%--    text-center: จัดให้อยู่ตรงกลางของพื้นที่ที่กำหนด.--%>
<%--    text-gray-700: กำหนดสีข้อความให้เป็นสีเทาเข้ม (gray-700).--%>
<%--    text-xl: กำหนดขนาดข้อความให้เป็นขนาดใหญ่ (extra-large).--%>
<%--    mb-4: กำหนด margin-bottom ให้มีขนาด 4 (medium bottom margin).--%>
<%--    Role: ${user.role}: นำไปแสดงผลบทบาทของผู้ใช้ที่ได้จากตัวแปร ${user.role} ซึ่งอาจเป็นบทบาทที่กำหนดให้กับผู้ใช้.    --%>


        <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full"
                type="submit">
            Logout
        </button>
<%--    class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full": กำหนด class ที่ใช้สำหรับการจัดการลักษณะของปุ่ม โดยมีคำสั่งดังนี้:--%>
<%--    bg-red-500: กำหนดสีพื้นหลังของปุ่มเป็นสีแดงเข้ม (red-500).--%>
<%--    hover:bg-red-700: กำหนดสีพื้นหลังของปุ่มเป็นสีแดงเข้ม (red-700) เมื่อนำเมาส์ไปวางที่ปุ่ม (hover).--%>
<%--    text-white: กำหนดสีข้อความในปุ่มเป็นสีขาว.--%>
<%--    font-bold: กำหนดให้ข้อความในปุ่มมีน้ำหนักตัวหนา (bold).--%>
<%--    py-2: กำหนด padding ในแนวแกน y (top และ bottom) ให้มีขนาด 2 (small padding).--%>
<%--    px-4: กำหนด padding ในแนวแกน x (left และ right) ให้มีขนาด 4 (medium padding).--%>
<%--    rounded: กำหนดขอบมุมให้เป็นรูปทรงมน (rounded).--%>
<%--    focus:outline-none: กำหนดให้ไม่แสดงเส้นขอบเมื่อปุ่มได้รับ focus.--%>
<%--    focus:shadow-outline: กำหนดเงาในกรณีที่ปุ่มได้รับ focus.--%>
<%--    w-full: กำหนดให้ปุ่มเต็มความกว้าง (full width).--%>

    </form>

</div>
</body>
</html>
