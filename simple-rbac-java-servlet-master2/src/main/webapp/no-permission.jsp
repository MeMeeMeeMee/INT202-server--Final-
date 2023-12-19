<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>No Permission Page</title>
<%--    กำหนดชื่อหน้าเว็บใน tag <title>.--%>

    <meta charset="UTF-8">
<%--    กำหนด encoding เป็น UTF-8 เพื่อรองรับตัวอักษรทุกภาษา.--%>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    ใช้กำหนด viewport เพื่อทำให้หน้าเว็บไซต์สามารถปรับขนาดให้เหมาะสมกับอุปกรณ์ที่ใช้ดู เช่น มือถือหรือแท็บเล็ต.--%>

    <script src="https://cdn.tailwindcss.com"></script>
<%--    เพิ่มไฟล์ Tailwind CSS เพื่อให้สามารถใช้คลาสที่ถูกกำหนดไว้ใน Tailwind CSS.--%>

</head>
<body class="flex items-center justify-center h-screen">
<%--flex: เป็น Flex Container ที่จัดเรียงลำดับของ Flex Items.--%>
<%--items-center: จัด Flex Items ไปตรงกลางในแนวแกนตั้ง (Y-axis).--%>
<%--justify-center: จัด Flex Items ไปตรงกลางในแนวนอน (X-axis).--%>
<%--h-screen: กำหนดความสูงของ Flex Container ให้เต็มหน้าจอ (100% ของความสูงของหน้าจอ).--%>


<div class="w-full max-w-xs">
<%--    w-full: กำหนดความกว้างของ element ให้เต็มตามพื้นที่ที่ให้ (100%).--%>
<%--    max-w-xs: กำหนดความกว้างสูงสุดของ element เป็น xs (extra small) ซึ่งจะมีค่าที่กำหนดไว้ในไฟล์ CSS ของ Tailwind CSS.--%>

    <h1 class="text-center text-2xl font-bold mb-4">
        You don't have permission to access this page.
    </h1>
<%--    class="text-center": จะกำหนดให้ข้อความอยู่ในส่วนกลางของ element.--%>
<%--    class="text-2xl": จะกำหนดขนาดของ font เป็น extra-large ในระดับที่ 2 ตามขนาดที่กำหนดไว้ในไฟล์ CSS ของ Tailwind CSS.--%>
<%--    class="font-bold": จะกำหนดให้ข้อความมี font หนา (bold).--%>
<%--    class="mb-4": จะกำหนด margin ด้านล่างของ element เพื่อให้มีระยะห่างจาก element ด้านล่าง.--%>


    <a href="index.jsp" class="block text-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        Back to Home
    </a>
<%--    <a href="index.jsp" class="block text-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">: ใช้ HTML <a> tag เพื่อสร้างลิงก์ (link) ไปยังหน้า index.jsp. คุณสมบัติที่ใช้มีดังนี้:--%>

<%--        href="index.jsp": กำหนด URL ของหน้าที่ต้องการไป (index.jsp).--%>

<%--        class="block text-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded": กำหนด class ที่ใช้กำหนดลักษณะของลิงก์. คุณสมบัติที่ใช้มีดังนี้:--%>

<%--        class="block": จะกำหนดให้ลิงก์เป็น block-level element, ซึ่งจะทำให้มีขนาดเต็มแนวกว้างของพื้นที่ที่ใช้แสดงผล.--%>
<%--        class="text-center": จะกำหนดให้ข้อความอยู่ในส่วนกลางของ element.--%>
<%--        class="bg-blue-500": จะกำหนดสีพื้นหลังเป็นสีน้ำเงิน (blue) ที่มีค่าเข้ม (500) ตามที่กำหนดไว้ในไฟล์ CSS ของ Tailwind CSS.--%>
<%--        class="hover:bg-blue-700": จะกำหนดสีพื้นหลังให้เปลี่ยนเมื่อเมาส์ชี้ไป (hover) ที่ลิงก์, ซึ่งจะเป็นสีน้ำเงินเข้ม (700) ตามที่กำหนดไว้ในไฟล์ CSS ของ Tailwind CSS.--%>
<%--        class="text-white": จะกำหนดสีข้อความเป็นสีขาว.--%>
<%--        class="font-bold": จะกำหนดให้ข้อความมี font หนา (bold).--%>
<%--        class="py-2 px-4": จะกำหนด padding ในทิศทางตั้ง (py) และทางนอน (px) ของ element.--%>
<%--        class="rounded": จะกำหนดให้มีขอบโค้ง (rounded).--%>

</div>


</body>
</html>
