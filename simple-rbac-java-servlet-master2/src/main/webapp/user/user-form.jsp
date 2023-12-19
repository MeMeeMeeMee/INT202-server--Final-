<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Edit Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex items-center justify-center h-screen">
<%--class="flex": ทำให้ element มีลักษณะของ Flex Container, ทำให้ลูกค้าข้างใน element นี้สามารถใช้งาน Flexbox ได้.--%>
<%--items-center: จัดวางลูกค้าในแนวทะแยงของ container (vertically centered).--%>
<%--justify-center: จัดวางลูกค้าในทิศทางที่ขยับกันไกลออกจากกัน (horizontally centered).--%>
<%--h-screen: กำหนดความสูงของ element ให้เต็มระยะสูงของหน้าจอ (viewport), ทำให้ element นี้เต็มพื้นที่จอแสดงผล.--%>



<div class="w-full max-w-xs">
<%--    class="w-full": กำหนดความกว้างของ <div> ให้เต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    class="max-w-xs": กำหนดความกว้างสูงสุดของ <div> เท่ากับขนาด Extra Small (xs) ที่กำหนดไว้ใน Tailwind CSS. การใช้ max-w-xs จะทำให้ <div> ไม่เกินขนาดกว้างที่กำหนด, แม้ว่าหน้าจอจะมีขนาดใหญ่ขึ้น.--%>


    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" method="post" action="users">
<%--            class="bg-white": กำหนดสีพื้นหลัง (background color) ให้กับ <form> เป็นสีขาว.--%>
<%--            class="shadow-md": เพิ่มเงาให้กับ <form> โดยมีขนาดเม็ดเล็ก (shadow-md).--%>
<%--            class="rounded": ทำให้มีมุมโค้ง.--%>
<%--            class="px-8": กำหนด padding ด้านซ้ายและด้านขวาของ <form> เท่ากับ 8 หน่วย.--%>
<%--            class="pt-6": กำหนด padding ด้านบนของ <form> เท่ากับ 6 หน่วย.--%>
<%--            class="pb-8": กำหนด padding ด้านล่างของ <form> เท่ากับ 8 หน่วย.--%>
<%--            class="mb-4": กำหนด margin ด้านล่างของ <form> เท่ากับ 4 หน่วย.--%>
<%--            method="post": ระบุว่าการส่งข้อมูลจะใช้วิธี HTTP POST.--%>
<%--            action="users": ระบุ URL หรือ URI ที่จะส่งข้อมูลไปยัง (ในที่นี้คือ "users").--%>



        <input type="hidden" name="action" value="update"/>
<%--    type="hidden": ระบุประเภทของ input เป็น hidden, ทำให้ input นี้ไม่แสดงผลบนหน้าเว็บ แต่ยังสามารถส่งข้อมูลไปยังเซิร์ฟเวอร์ได้.--%>
<%--    name="action": ระบุชื่อของ input ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่ถูกส่งไปยังเซิร์ฟเวอร์.--%>
<%--    value="update": ระบุค่าที่จะถูกส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง (submitted), ในที่นี้คือ "update".--%>



        <input type="hidden" name="id" value="${requestScope.user.id}"/>
<%--    type="hidden": ระบุประเภทของ input เป็น hidden, ทำให้ input นี้ไม่แสดงผลบนหน้าเว็บ แต่ยังสามารถส่งข้อมูลไปยังเซิร์ฟเวอร์ได้.--%>
<%--    name="id": ระบุชื่อของ input ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่ถูกส่งไปยังเซิร์ฟเวอร์.--%>
<%--    value="${requestScope.user.id}": ระบุค่าที่จะถูกส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง (submitted), ในที่นี้คือ ${requestScope.user.id} ซึ่งหมายถึง ID ของผู้ใช้ที่ถูกเก็บไว้ใน requestScope จากฝั่งเซิร์ฟเวอร์.--%>


        <p class="text-gray-900 font-bold text-xl mb-2">Edit User (${requestScope.user.id})</p>
<%--    class="text-gray-900": กำหนดสีของข้อความให้เป็นสีเทาเข้ม (gray-900).--%>
<%--    class="font-bold": ทำให้ข้อความใน <p> มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    class="text-xl": กำหนดขนาดของข้อความให้เป็น Extra Large (xl).--%>
<%--    class="mb-2": กำหนด margin ด้านล่างของ <p> เท่ากับ 2 หน่วย.--%>
<%--    ${requestScope.user.id}: เป็นการใช้ JavaScript template literal เพื่อแทรกร่างโค้ด JavaScript ภายในข้อความ. ${requestScope.user.id} จะแสดงค่า ID ของผู้ใช้ที่ถูกเก็บไว้ใน requestScope ซึ่งน่าจะเป็นตัวเลขหรือข้อมูลที่แทน ID ของผู้ใช้.--%>


        <div class="mb-4">
<%--            class="mb-4": กำหนด margin ด้านล่างของ <div> เท่ากับ 4 หน่วย.--%>



            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                Username
            </label>
<%--    class="block": ทำให้ <label> กลายเป็น block element ทำให้มีขนาดเต็มกว้างของ container ที่ครอบ.--%>
<%--    class="text-gray-700": กำหนดสีของข้อความใน <label> เป็นสีเทาเข้ม (gray-700).--%>
<%--    class="text-sm": กำหนดขนาดของข้อความใน <label> เป็น Small (sm).--%>
<%--    class="font-bold": ทำให้ข้อความใน <label> มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    class="mb-2": กำหนด margin ด้านล่างของ <label> เท่ากับ 2 หน่วย.--%>
<%--    for="username": ระบุ ID ของ input element ที่เชื่อมโยงกับ <label>. นี้เป็นวิธีที่ช่วยให้ผู้ใช้คลิกที่ label เพื่อเข้าถึง input element ที่เกี่ยวข้อง.--%>


            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                   id="username" name="username" type="text" placeholder="Username" value="${requestScope.user.username}">
<%--    class="shadow": เพิ่มเงาให้กับ <input>.--%>
<%--    class="appearance-none": ทำให้ <input> ไม่มีสไตล์เดิมที่ถูกกำหนดโดย browser.--%>
<%--    class="border": เพิ่มเส้นขอบสีดำรอบ <input>.--%>
<%--    class="rounded": ทำให้ <input> มีมุมโค้ง.--%>
<%--    class="w-full": กำหนดให้ <input> มีความกว้างเต็มขอบขวางของ container.--%>
<%--    class="py-2": กำหนด padding ด้านบนและด้านล่างของ <input> เท่ากับ 2 หน่วย.--%>
<%--    class="px-3": กำหนด padding ด้านซ้ายและด้านขวาของ <input> เท่ากับ 3 หน่วย.--%>
<%--    class="text-gray-700": กำหนดสีของข้อความใน <input> เป็นสีเทาเข้ม (gray-700).--%>
<%--    class="leading-tight": กำหนด line height ของ <input>.--%>
<%--    class="focus:outline-none": ทำให้ไม่แสดงเส้นขอบ (outline) เมื่อ <input> อยู่ในสถานะ focus.--%>
<%--    class="focus:shadow-outline": เพิ่มเงาเมื่อ <input> อยู่ในสถานะ focus.--%>
<%--    id="username": ระบุ ID ของ <input> ที่ให้เหมาะสำหรับใช้ในการเชื่อมโยงกับ <label> ที่มี for="username".--%>
<%--    name="username": ระบุชื่อของ input ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่ถูกส่งไปยังเซิร์ฟเวอร์.--%>
<%--    type="text": ระบุประเภทของ <input> ว่าเป็นช่องใส่ข้อความ.--%>
<%--    placeholder="Username": แสดงข้อความ placeholder ภายใน <input>.--%>
<%--    value="${requestScope.user.username}": กำหนดค่าเริ่มต้นใน <input> ให้เท่ากับค่า username ที่ถูกเก็บไว้ใน requestScope.--%>



        </div>


        <div class="mb-6">
<%--            class="mb-6": กำหนด margin ด้านล่างของ <div> เท่ากับ 6 หน่วย.--%>


            <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                Password
            </label>
<%--    class="block": ทำให้ <label> กลายเป็น block element ทำให้มีขนาดเต็มกว้างของ container ที่ครอบ.--%>
<%--    class="text-gray-700": กำหนดสีของข้อความใน <label> เป็นสีเทาเข้ม (gray-700).--%>
<%--    class="text-sm": กำหนดขนาดของข้อความใน <label> เป็น Small (sm).--%>
<%--    class="font-bold": ทำให้ข้อความใน <label> มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    class="mb-2": กำหนด margin ด้านล่างของ <label> เท่ากับ 2 หน่วย.--%>
<%--    for="password": ระบุ ID ของ input element ที่เชื่อมโยงกับ <label> ที่มี for="password".--%>



            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                   id="password" name="password" type="password" placeholder="******************" value="">
<%--    class="shadow": เพิ่มเงาให้กับ <input>.--%>
<%--    class="appearance-none": ทำให้ <input> ไม่มีสไตล์เดิมที่ถูกกำหนดโดย browser.--%>
<%--    class="border": เพิ่มเส้นขอบสีดำรอบ <input>.--%>
<%--    class="rounded": ทำให้ <input> มีมุมโค้ง.--%>
<%--    class="w-full": กำหนดให้ <input> มีความกว้างเต็มขอบขวางของ container.--%>
<%--    class="py-2": กำหนด padding ด้านบนและด้านล่างของ <input> เท่ากับ 2 หน่วย.--%>
<%--    class="px-3": กำหนด padding ด้านซ้ายและด้านขวาของ <input> เท่ากับ 3 หน่วย.--%>
<%--    class="text-gray-700": กำหนดสีของข้อความใน <input> เป็นสีเทาเข้ม (gray-700).--%>
<%--    class="leading-tight": กำหนด line height ของ <input>.--%>
<%--    class="focus:outline-none": ทำให้ไม่แสดงเส้นขอบ (outline) เมื่อ <input> อยู่ในสถานะ focus.--%>
<%--    class="focus:shadow-outline": เพิ่มเงาเมื่อ <input> อยู่ในสถานะ focus.--%>
<%--    id="password": ระบุ ID ของ <input> ที่ให้เหมาะสำหรับใช้ในการเชื่อมโยงกับ <label> ที่มี for="password".--%>
<%--    name="password": ระบุชื่อของ input ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่ถูกส่งไปยังเซิร์ฟเวอร์.--%>
<%--    type="password": ระบุประเภทของ <input> ว่าเป็นช่องใส่ข้อความแบบ password.--%>
<%--    placeholder="******************": แสดงข้อความ placeholder ภายใน <input>.--%>
<%--    value="": กำหนดค่าเริ่มต้นใน <input> ให้เป็นค่าว่าง.--%>



        </div>


        <div class="mb-6">
<%--            class="mb-6": กำหนด margin ด้านล่างของ <div> เท่ากับ 6 หน่วย.--%>

            <label class="block text-gray-700 text-sm font-bold mb-2" for="role">
                Role
            </label>
<%--    class="block": ทำให้ <label> กลายเป็น block element ทำให้มีขนาดเต็มกว้างของ container ที่ครอบ.--%>
<%--    class="text-gray-700": กำหนดสีของข้อความใน <label> เป็นสีเทาเข้ม (gray-700).--%>
<%--    class="text-sm": กำหนดขนาดของข้อความใน <label> เป็น Small (sm).--%>
<%--    class="font-bold": ทำให้ข้อความใน <label> มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    class="mb-2": กำหนด margin ด้านล่างของ <label> เท่ากับ 2 หน่วย.--%>
<%--    for="role": ระบุ ID ของ input element ที่เชื่อมโยงกับ <label> ที่มี for="role".--%>


            ${requestScope.user.role} <%-- เป็นการใช้ JavaScript template literal เพื่อแทรกร่างโค้ด JavaScript ลงใน HTML ของ JavaServer Pages (JSP) หรือหน้าเว็บที่ใช้ Java.--%>


            <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    id="role" name="role" value="${requestScope.user.role}">
                <option value="USER" ${requestScope.user.role == "USER" ? "selected" : ""}>User</option>
                <option value="ADMIN" ${requestScope.user.role == "ADMIN" ? "selected" : ""}>Admin</option>
            </select>
<%--    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline": ให้กำหนดสไตล์ของ <select> element ในหน้าเว็บ, ทำให้มีเงา, มีขอบ, และข้อความที่ถูกกรอกอยู่เรียงต่อกัน.--%>
<%--    id="role": ระบุ ID ของ <select> ที่ใช้ในการเชื่อมโยงกับ <label> ที่มี for="role".--%>
<%--    name="role": ระบุชื่อของ <select> ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่ถูกส่งไปยังเซิร์ฟเวอร์.--%>
<%--    value="${requestScope.user.role}": กำหนดค่าเริ่มต้นของ <select> ให้เป็นค่าของ requestScope.user.role.--%>
<%--    <option value="USER" ${requestScope.user.role == "USER" ? "selected" : ""}>User</option>: <option> สำหรับค่า "USER". ถ้า requestScope.user.role มีค่าเท่ากับ "USER" จะเพิ่ม attribute selected ใน <option>.--%>
<%--    <option value="ADMIN" ${requestScope.user.role == "ADMIN" ? "selected" : ""}>Admin</option>: <option> สำหรับค่า "ADMIN". ถ้า requestScope.user.role มีค่าเท่ากับ "ADMIN" จะเพิ่ม attribute selected ใน <option>.--%>



        </div>




        <div class="flex items-center justify-between">
<%--            flex: ใช้สำหรับการกำหนด Flexbox container, ทำให้ลำดับขององค์ประกอบภายในสามารถจัดการเรียงตามแนวแกนแนวนอนหรือแนวตั้งได้ตามต้องการ.--%>
<%--            items-center: ใช้สำหรับการจัดตำแหน่งขององค์ประกอบภายในแกนตั้ง (แนวตั้ง) ให้อยู่ตรงกลาง.--%>
<%--            justify-between: ใช้สำหรับการจัดตำแหน่งขององค์ประกอบภายในแกนนอน (แนวนอน) ให้อยู่ในขอบสุดของ container และคั่นระหว่างองค์ประกอบแต่ละตัวให้มีระยะห่าง.--%>



            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                    type="submit">
                Update
            </button>
<%--    bg-blue-500: กำหนดสีพื้นหลังของปุ่มเป็นสีน้ำเงิน (Blue) โดยใช้คลาสที่มีค่าคือ 500 ซึ่งอาจแทนถึงระดับความเข้มของสีน้ำเงินตามตำแหน่งในพาเลทสี (palette) ของ Tailwind CSS.--%>
<%--    hover:bg-blue-700: กำหนดสีพื้นหลังของปุ่มเป็นสีน้ำเงิน (Blue) ที่มีความเข้มของ 700 เมื่อผู้ใช้โฮเวอร์ (hover) ที่ปุ่มนี้.--%>
<%--    text-white: กำหนดสีของตัวอักษรในปุ่มเป็นสีขาว.--%>
<%--    font-bold: กำหนดให้ตัวอักษรในปุ่มมีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    py-2 px-4: กำหนดระยะขอบ (padding) ของปุ่มในทิศทางแนวตั้ง (py) และแนวนอน (px) ด้วยขนาดที่กำหนด.--%>
<%--    rounded: กำหนดให้มุมของปุ่มเป็นรูปกลม.--%>
<%--    focus:outline-none focus:shadow-outline: กำหนดลักษณะเมื่อปุ่มได้รับการโฟกัส (focus) โดยลบเส้นขอบ (outline) และเพิ่มเงา (shadow).--%>
<%--    type="submit": ระบุประเภทของปุ่มเป็นปุ่มที่ใช้สำหรับส่งข้อมูล (submit) ในฟอร์ม.--%>


            <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="users">
                Back
            </a>
<%--    inline-block: กำหนดให้ลิงก์เป็นองค์ประกอบแบบ inline-block, ทำให้ลิงก์นี้มีความสามารถในการจัดวางบนหน้าเว็บเป็นบล็อกและอนุญาตให้มีการกำหนดความกว้างและความสูง.--%>
<%--    align-baseline: กำหนดให้ลิงก์มีการจัดแนว (align) ตาม baseline ของข้อความบรรทัดเดียวกัน.--%>
<%--    font-bold: กำหนดให้ข้อความในลิงก์มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    text-sm: กำหนดขนาดของตัวอักษรเป็นขนาดเล็ก (small).--%>
<%--    text-blue-500: กำหนดสีของตัวอักษรในลิงก์เป็นสีน้ำเงิน (Blue) ที่มีความเข้มของ 500.--%>
<%--    hover:text-blue-800: กำหนดสีของตัวอักษรในลิงก์เป็นสีน้ำเงิน (Blue) ที่มีความเข้มของ 800 เมื่อผู้ใช้โฮเวอร์ (hover) ที่ลิงก์นี้.--%>
<%--    href="users": ระบุ URL ที่ลิงก์นี้จะนำไปยัง, ในที่นี้คือ "users".--%>



        </div>


    </form>




    <c:if test="${requestScope.error != null}">
        <p class="text-red-500 text-xs italic">${requestScope.error}</p>
    </c:if>
<%--    <c:if>: เป็นแท็ก JSTL ที่ใช้สำหรับทำการตรวจสอบเงื่อนไข เงื่อนไขที่ถูกต้องจะทำให้เนื้อหาภายในแท็กนี้ถูกทำงาน.--%>
<%--    test="${requestScope.error != null}": เงื่อนไขที่ตรวจสอบ คือว่าถ้าตัวแปร "error" ที่ถูกเก็บไว้ใน request scope ไม่เท่ากับ null ก็ให้ทำงาน.--%>
<%--    <p class="text-red-500 text-xs italic">${requestScope.error}</p>: ถ้าเงื่อนไขเป็นจริง, จะแสดงประโยค <p> ที่มีคลาส CSS เพื่อกำหนดลักษณะของข้อความ โดย:--%>
<%--    text-red-500: กำหนดสีของตัวอักษรเป็นสีแดง (Red) ที่มีความเข้มของ 500.--%>
<%--    text-xs: กำหนดขนาดของตัวอักษรเป็นขนาดเล็ก (extra small).--%>
<%--    italic: กำหนดให้ตัวอักษรเป็นตัวเอียง.--%>
<%--    ${requestScope.error}: แสดงค่าของตัวแปร "error" ที่ถูกเก็บไว้ใน request scope.--%>









</div>
</body>
</html>
