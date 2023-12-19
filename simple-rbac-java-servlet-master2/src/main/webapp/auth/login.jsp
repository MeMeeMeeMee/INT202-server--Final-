<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex items-center justify-center h-screen">
<%--        กำหนดการใช้ flexbox เพื่อจัดวางแนวตั้งและแนวนอน, จัดวางเนื้อหาตรงกลางทั้งแนวตั้งและแนวนอน, และกำหนดความสูงเต็มหน้าจอ. นอกจากนี้, กำหนดสีพื้นหลังของหน้าเว็บเป็นสีเทา (bg-gray-200).--%>


    <div class="w-full max-w-xs">
<%--        ใช้ในการกำหนดขนาดของคอนเทนเนอร์เพื่อให้เต็มพื้นที่ของหน้าจอ:--%>

        <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" method="post" action="login">
<%--            class="bg-white": กำหนดสีพื้นหลังของฟอร์มให้เป็นสีขาว.--%>
<%--            class="shadow-md": เพิ่มเงาให้กับฟอร์ม.--%>
<%--            class="rounded": กำหนดให้มีขอบที่มีรูปร่างเป็นวงรี.--%>
<%--            class="px-8 pt-6 pb-8 mb-4": กำหนดระยะขอบฟอร์มและระยะห่างระหว่างฟอร์ม.--%>


            <div class="mb-4">
<%--            ใช้เพื่อกำหนดขอบล่าง (margin-bottom) ขององค์ประกอบภายในทั้งหมดของ <form> ที่อยู่ภายในบล็อก <div>.--%>

                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                    Username
                </label>
<%--            class="block": ให้ label เป็น block element, ทำให้ label นี้จะเริ่มที่บรรทัดใหม่.--%>
<%--            class="text-gray-700": กำหนดสีข้อความเป็นสีเทาเข้ม.--%>
<%--            class="text-sm": กำหนดขนาดของข้อความเป็น small.--%>
<%--            class="font-bold": ทำให้ข้อความมีตัวหนา.--%>
<%--            class="mb-2": กำหนดขอบล่าง (margin-bottom) เท่ากับ 2 (ในหน่วย rem) เพื่อให้มีระยะห่างด้านล่างจาก element ถัดไป.--%>


                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="username" name="username" type="text" placeholder="Username">
<%--    <input> เป็น element ที่ใช้สร้างช่องป้อนข้อมูล ในที่นี้คือช่องป้อนชื่อผู้ใช้ (Username).--%>
<%--    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline": กำหนดรูปแบบของ input element โดยใช้คลาสที่ถูกกำหนดด้วย Tailwind CSS.--%>
<%--    shadow: ให้มีเงา.--%>
<%--    appearance-none: ลบสไตล์ปกติของ input ที่ถูกกำหนดมาจาก browser.--%>
<%--    border: กำหนดเส้นขอบ.--%>
<%--    rounded: ทำให้มีมุมโค้ง.--%>
<%--    w-full: ทำให้กว้างเต็ม.--%>
<%--    py-2: กำหนด padding ด้านบนและด้านล่าง.--%>
<%--    px-3: กำหนด padding ด้านซ้ายและด้านขวา.--%>
<%--    text-gray-700: กำหนดสีของตัวอักษรเป็นสีเทาเข้ม.--%>
<%--    leading-tight: กำหนดระยะห่างระหว่างบรรทัด.--%>
<%--    focus:outline-none: ทำให้ไม่มีเส้นกรอบเมื่อ element ได้รับ focus.--%>
<%--    focus:shadow-outline: กำหนดเงาเมื่อ element ได้รับ focus.--%>
<%--    id="username": ระบุ ID ของ input element เพื่อให้ label สามารถเชื่อมโยงกับ input element นี้.--%>
<%--    name="username": ระบุชื่อของ input element ซึ่งจะถูกใช้เมื่อ submit form ในการส่งข้อมูล.--%>
<%--    type="text": ระบุประเภทของ input element เป็น "text" ซึ่งให้ผู้ใช้ป้อนข้อความ.--%>
<%--    placeholder="Username": ระบุข้อความที่จะแสดงในช่องป้อนข้อมูลก่อนที่ผู้ใช้จะป้อนข้อมูล.--%>

            </div>




            <div class="mb-6"> <%-- คลาสที่ใช้กำหนด margin-bottom ให้มีขนาด 6 (tailwind CSS).--%>

                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                    Password
                </label>
<%--                block: จะทำให้ label เป็น block element ซึ่งทำให้ข้อความของ label อยู่บนบรรทัดใหม่เมื่อแสดงผล--%>
<%--                text-gray-700: กำหนดสีของข้อความใน label เป็นสีเทา (gray)--%>
<%--                text-sm: กำหนดขนาดของข้อความใน label เป็น small--%>
<%--                font-bold: กำหนดให้ข้อความใน label เป็นตัวหนา (bold)--%>
<%--                mb-2: คลาสที่ใช้กำหนด margin-bottom ให้มีขนาด 2 (tailwind CSS).--%>


                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       id="password" name="password" type="password" placeholder="******************">
<%--                <input> นี้เป็นตัวแทนของ input field ที่ใช้สำหรับรับข้อมูลจากผู้ใช้ โดยมีคุณสมบัติต่าง ๆ ดังนี้:--%>

<%--                class: กำหนดคลาสของ input field โดยใช้ utility classes จาก Tailwind CSS ซึ่งมีคำอธิบายดังนี้:--%>

<%--                shadow: ให้มีเงา--%>
<%--                appearance-none: ลบสไตล์ default ของ browser--%>
<%--                border: กำหนดให้มีเส้นขอบ--%>
<%--                rounded: กำหนดให้มีขอบโค้ง--%>
<%--                w-full: กำหนดให้ความกว้างเต็มหน้าจอ--%>
<%--                py-2: กำหนด padding ในแนวแกน y ของข้อความใน input field เป็น 2--%>
<%--                px-3: กำหนด padding ในแนวแกน x ของข้อความใน input field เป็น 3--%>
<%--                text-gray-700: กำหนดสีของข้อความใน input field เป็นสีเทา (gray)--%>
<%--                leading-tight: กำหนด line height ให้เข้ากับข้อความใน input field--%>
<%--                focus:outline-none: ลบ outline เมื่อ input field มีการ focus--%>
<%--                focus:shadow-outline: กำหนด shadow เมื่อ input field มีการ focus--%>
<%--                id: กำหนด id ให้ input field เพื่อให้ label สามารถเชื่อมโยงกับ input field นี้ได้--%>

<%--                name: กำหนดชื่อของ input field เพื่อให้สามารถอ้างอิงถึงค่าของ input field นี้ในภายหลังได้--%>

<%--                type: กำหนดประเภทของ input field ในกรณีนี้เป็น "password" ซึ่งจะแสดงด้วยตัวอักษรที่ถูกปกป้อง (asterisks) แทนตัวอักษรที่ผู้ใช้ป้อน--%>

<%--                placeholder: กำหนดข้อความ-placeholder ที่จะแสดงใน input field เมื่อไม่มีข้อมูลถูกป้อน--%>

            </div>


            <div class="flex items-center justify-between">
<%--                flex: กำหนดให้มีลักษณะเป็น flex container--%>
<%--                items-center: จัด elements ภายใน flex container ให้ชิดต่อกันในแนวแกนตั้ง (vertical centering)--%>
<%--                justify-between: จัด elements ภายใน flex container ให้กระจายไปทางสองข้างของ container ในแนวแกนนอน (horizontal spacing)--%>



                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                        type="submit">
                    Login
                </button>
<%--        <button> นี้ใช้สำหรับแสดงปุ่ม "Login" ในฟอร์ม login และมีคุณสมบัติต่าง ๆ ดังนี้:--%>
<%--        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline": กำหนดลักษณะทางสี, รูปร่าง, และ style ของปุ่ม--%>
<%--        bg-blue-500: กำหนดสีพื้นหลังของปุ่มเป็นสีน้ำเงิน (#3490dc)--%>
<%--        hover:bg-blue-700: กำหนดสีพื้นหลังของปุ่มเมื่อ hover เป็นสีน้ำเงินเข้มขึ้น (#2779bd)--%>
<%--        text-white: กำหนดสีของตัวอักษรในปุ่มเป็นสีขาว--%>
<%--        font-bold: กำหนดให้ตัวอักษรในปุ่มเป็นตัวหนา--%>
<%--        py-2 px-4: กำหนดขนาดของ padding ในแนวแกนตั้ง (py) และแนวนอน (px)--%>
<%--        rounded: กำหนดให้มีขอบโค้ง (border-radius)--%>
<%--        focus:outline-none: ลบเส้นกรอบ (outline) เมื่อปุ่มได้รับ focus--%>
<%--        focus:shadow-outline: เพิ่มเงาเมื่อปุ่มได้รับ focus เพื่อแสดงถึงการ focus ของ element--%>


                <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="register">
                    Register
                </a>
<%--        <a> นี้ใช้สำหรับสร้างลิงก์ไปยังหน้า "Register" และมีคุณสมบัติต่าง ๆ ดังนี้:--%>
<%--        class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800": กำหนดลักษณะทางรูปร่างและสีของลิงก์--%>
<%--        inline-block: กำหนดให้ลิงก์มีลักษณะ inline-block ซึ่งหมายความว่าจะแสดงบนบรรทัดเดียวกันแต่มีความกว้างและความสูงเหมือน block element--%>
<%--        align-baseline: จัดวางลิงก์ให้มี baseline ตรงกับบรรทัดของข้อความรอบ ๆ--%>
<%--        font-bold: กำหนดให้ข้อความในลิงก์เป็นตัวหนา--%>
<%--        text-sm: กำหนดขนาดของตัวอักษรเป็น small--%>
<%--        text-blue-500: กำหนดสีของข้อความในลิงก์เป็นสีน้ำเงิน (#3490dc)--%>
<%--        hover:text-blue-800: กำหนดสีของข้อความในลิงก์เมื่อ hover เป็นสีน้ำเงินเข้มขึ้น (#1d4ed8)--%>


            </div>



        </form>


       <c:if test="${requestScope.error != null}"><%--  ตรวจสอบว่า attribute error ใน scope ของ request ไม่เท่ากับ null--%>


            <p class="text-red-500 text-xs italic">${requestScope.error}</p>
<%--        ถ้าเงื่อนไขเป็นจริง (attribute error มีค่า), จะแสดง <p> element ที่มีลักษณะดังนี้:--%>
<%--        class="text-red-500 text-xs italic": กำหนดสีข้อความเป็นสีแดง (#ef4444) และขนาดตัวอักษรเล็ก (text-xs) และให้เน้นตัวอักษรตัวเอียง (italic)--%>
<%--        ${requestScope.error}: แสดงข้อความข้อผิดพลาดที่เกิดขึ้นจาก attribute error ใน scope ของ request--%>


        </c:if>


    </div>
</body>
</html>
