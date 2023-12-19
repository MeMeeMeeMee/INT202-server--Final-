<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>


<body class="flex flex-col justify-center p-10">
<%--flex: กำหนดให้ <body> เป็น Flex container, ทำให้ลำดับขององค์ประกอบภายในสามารถจัดการเรียงตามแนวแกนแนวนอนหรือแนวตั้งได้ตามต้องการ.--%>
<%--flex-col: กำหนดให้ลำดับขององค์ประกอบภายในถูกจัดเรียงตามแนวตั้ง.--%>
<%--justify-center: กำหนดให้องค์ประกอบภายในถูกจัดตำแหน่งตรงกลางในแนวแกนตั้ง.--%>
<%--p-10: กำหนด Padding ทั้งสี่ขอบของ <body> ให้มีความห่าง 10 หน่วย.--%>


<form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 w-full" method="post" action="users">
<%--    bg-white: กำหนดสีพื้นหลังของแบบฟอร์มเป็นสีขาว.--%>
<%--    shadow-md: กำหนดเงา (shadow) ของแบบฟอร์มให้มีความเข้ม (md คือ medium).--%>
<%--    rounded: กำหนดให้มีมุมของแบบฟอร์มเป็นรูปกลม.--%>
<%--    px-8: กำหนด padding ในแนวแกนนอน (px) ให้มีขนาด 8.--%>
<%--    pt-6: กำหนด padding ในแนวตั้ง (pt) ให้มีขนาด 6.--%>
<%--    pb-8: กำหนด padding ด้านล่าง (pb) ให้มีขนาด 8.--%>
<%--    mb-4: กำหนด margin ด้านล่าง (mb) ให้มีขนาด 4.--%>
<%--    w-full: กำหนดให้แบบฟอร์มมีความกว้างเต็มหน้าจอ.--%>
<%--    method="post": ระบุว่าแบบฟอร์มนี้จะใช้วิธีการส่งข้อมูลแบบ POST.--%>
<%--    action="users": ระบุ URL ที่จะส่งข้อมูลไปยัง, ในที่นี้คือ "users".--%>


    <input type="hidden" name="action" value="search">
<%--    type="hidden": กำหนดประเภทของ input เป็น "hidden", ทำให้ input นี้ไม่แสดงผลในหน้าเว็บ แต่สามารถส่งข้อมูลไปยังเซิร์ฟเวอร์ได้.--%>
<%--    name="action": กำหนดชื่อของ input ซึ่งจะถูกใช้เป็นชื่อของพารามิเตอร์ที่จะส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง.--%>
<%--    value="search": กำหนดค่าที่จะถูกส่งไปกับพารามิเตอร์นี้ เมื่อฟอร์มถูกส่ง, ในที่นี้คือ "search".--%>


    <div class="mb-4">
<%--        mb-4: กำหนด margin ด้านล่าง (mb) ให้มีขนาด 4. Margin คือพื้นที่ว่างระหว่าง element กับ element ที่อยู่รอบ ๆ มัน.--%>



        <label class="block text-gray-700 text-sm font-bold mb-2" for="search">
            Search
        </label>
<%--    class="block text-gray-700 text-sm font-bold mb-2": กำหนดลักษณะทางการแสดงผลของ label ด้วยคลาส CSS ที่ได้จาก Tailwind CSS, ดังนี้:--%>
<%--    block: กำหนดให้ label เป็น block element, ทำให้มีขึ้นบรรทัดใหม่.--%>
<%--    text-gray-700: กำหนดสีของตัวอักษรใน label เป็นสีเทา (Gray) ที่มีความเข้มของ 700.--%>
<%--    text-sm: กำหนดขนาดของตัวอักษรใน label เป็นขนาดเล็ก (small).--%>
<%--    font-bold: กำหนดให้ตัวอักษรใน label มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    mb-2: กำหนด margin ด้านล่าง (mb) ให้มีขนาด 2.--%>
<%--    for="search": ระบุ id ขององค์ประกอบ <input> ที่ต้องการจับคู่กับ label นี้ ในที่นี้คือ "search".--%>



        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
               id="search" name="search" type="text" placeholder="Search" value="${requestScope.search}">
<%--    shadow: เพิ่มเงาให้กับ input.--%>
<%--    appearance-none: ยกเลิกสไตล์ปกติของ input ที่ถูกกำหนดโดย browser.--%>
<%--    border: กำหนดเส้นขอบใน input.--%>
<%--    rounded: กำหนดให้มีมุมของ input เป็นรูปกลม.--%>
<%--    w-full: กำหนดให้ input มีความกว้างเต็มหน้าจอ.--%>
<%--    py-2: กำหนด padding ในแนวแกนตั้ง (py) ให้มีขนาด 2.--%>
<%--    px-3: กำหนด padding ในแนวแกนนอน (px) ให้มีขนาด 3.--%>
<%--    text-gray-700: กำหนดสีของตัวอักษรใน input เป็นสีเทา (Gray) ที่มีความเข้มของ 700.--%>
<%--    leading-tight: กำหนด line-height ให้ใกล้เคียงกับขนาดตัวอักษร.--%>
<%--    focus:outline-none: ในสถานะ focus, ยกเลิกการแสดง outline.--%>
<%--    focus:shadow-outline: ในสถานะ focus, เพิ่มเงาใน input.--%>
<%--    id="search": ระบุ id ของ input, ซึ่งจะถูกใช้เพื่อจับคู่กับ label ที่มี for="search".--%>
<%--    name="search": ระบุชื่อของ input, ซึ่งจะถูกใช้เมื่อส่งฟอร์มไปยังเซิร์ฟเวอร์.--%>
<%--    type="text": ระบุประเภทของ input เป็น "text", ทำให้มีกล่องข้อความสำหรับป้อนข้อมูล.--%>
<%--    placeholder="Search": ระบุข้อความ placeholder ที่จะแสดงใน input ก่อนที่จะมีการป้อนข้อมูล.--%>
<%--    value="${requestScope.search}": กำหนดค่าเริ่มต้นของ input จากตัวแปร "search" ที่ถูกเก็บไว้ใน request scope.--%>



    </div>


    <div class="flex items-center justify-between">
<%--        flex: กำหนดให้ <div> เป็น Flex container, ทำให้ลำดับขององค์ประกอบภายในสามารถจัดการเรียงตามแนวแกนแนวนอนหรือแนวตั้งได้ตามต้องการ.--%>
<%--        items-center: กำหนดให้องค์ประกอบภายในถูกจัดตำแหน่งตรงกลางในแนวแกนตั้ง.--%>
<%--        justify-between: กำหนดให้องค์ประกอบภายในถูกจัดตำแหน่งสองข้างสุดในแนวแกนนอน.--%>




        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                type="submit">
            Search
        </button>
<%--    bg-blue-500: กำหนดสีพื้นหลังของปุ่มเป็นสีน้ำเงิน (Blue) ที่มีความเข้มของ 500.--%>
<%--    hover:bg-blue-700: กำหนดสีพื้นหลังของปุ่มในขณะโฮเวอร์ (hover) ให้เป็นสีน้ำเงิน (Blue) ที่มีความเข้มของ 700.--%>
<%--    text-white: กำหนดสีของตัวอักษรในปุ่มเป็นสีขาว.--%>
<%--    font-bold: กำหนดให้ตัวอักษรในปุ่มมีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    py-2: กำหนด padding ในแนวแกนตั้ง (py) ให้มีขนาด 2.--%>
<%--    px-4: กำหนด padding ในแนวแกนนอน (px) ให้มีขนาด 4.--%>
<%--    rounded: กำหนดให้มุมของปุ่มเป็นรูปกลม.--%>
<%--    focus:outline-none: ในสถานะ focus, ยกเลิกการแสดง outline.--%>
<%--    focus:shadow-outline: ในสถานะ focus, เพิ่มเงาในปุ่ม.--%>
<%--    type="submit": ระบุประเภทของปุ่มเป็นปุ่มที่ใช้สำหรับส่งข้อมูล (submit) ในฟอร์ม.--%>
<%--    เนื้อหาภายใน <button>: ในที่นี้คือ "Search", ซึ่งจะแสดงข้อความนี้บนปุ่ม.--%>




    </div>


</form>



<table class="table-auto w-full my-4">
<%--    table-auto: กำหนดให้ตารางปรับขนาดของคอลัมน์อัตโนมัติตามข้อมูล.--%>
<%--    w-full: กำหนดให้ตารางมีความกว้างเต็มหน้าจอ.--%>
<%--    my-4: กำหนด margin ด้านบนและด้านล่าง (my) ให้มีขนาด 4.--%>

    <thead>
    <tr>
        <th class="px-4 py-2">ID</th>
        <th class="px-4 py-2">Username</th>
        <th class="px-4 py-2">Role</th>
        <th class="px-4 py-2">Edit</th>
        <th class="px-4 py-2">Delete</th>
    </tr>
    </thead>
<%--    <thead>: เป็นแท็ก HTML ที่ใช้สร้างส่วนหัวของตาราง (table header).--%>
<%--    <tr>: เป็นแท็ก HTML ที่ใช้สร้างแถว (row) ในตาราง.--%>
<%--    <th class="px-4 py-2">: เป็นแท็ก HTML ที่ใช้สร้างเซลล์ของส่วนหัวของตาราง (table header cell) โดยใช้ Tailwind CSS กำหนดลักษณะดังนี้:--%>
<%--    px-4: กำหนด padding ในแนวแกนนอน (px) ให้มีขนาด 4.--%>
<%--    py-2: กำหนด padding ในแนวแกนตั้ง (py) ให้มีขนาด 2.--%>


    <tbody>
    <c:forEach var="user" varStatus="loop" items="${requestScope.users}">
        <tr>
            <td class="border px-4 py-2">${loop.index + 1}</td>
            <td class="border px-4 py-2">${user.username}</td>
            <td class="border px-4 py-2">${user.role}</td>
            <td class="border px-4 py-2">
                <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="?id=${user.id}">Edit</a>
            </td>
            <td class="border px-4 py-2">
                <form action="users" method="post" class="m-0">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${user.id}">
                    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" type="submit">
                        Delete
                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
<%--<c:forEach var="user" varStatus="loop" items="${requestScope.users}">: ใช้ JSTL <c:forEach> เพื่อวนลูปผ่าน List ของผู้ใช้ที่ถูกเก็บไว้ใน requestScope.users.--%>
<%--    ${loop.index + 1}: ใช้ loop.index เพื่อดึงค่า index ของลูปและเพิ่ม 1 เพื่อให้เริ่มต้นที่ 1 แทนที่จะเริ่มต้นที่ 0.--%>
<%--    ${user.username}: ดึงข้อมูล username ของผู้ใช้.--%>
<%--    ${user.role}: ดึงข้อมูล role ของผู้ใช้.--%>
<%--    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="?id=${user.id}">Edit</a>: สร้างลิงก์ "Edit" ที่นำไปยัง URL ที่มีพารามิเตอร์ id เพื่อแก้ไขผู้ใช้.--%>
<%--    <form action="users" method="post" class="m-0">: เป็นแบบฟอร์มที่ใช้สำหรับการลบผู้ใช้, กำหนด action เป็น "users" และ method เป็น "post".--%>
<%--    <input type="hidden" name="action" value="delete">: สร้าง input hidden สำหรับส่ง action "delete" ไปยังเซิร์ฟเวอร์.--%>
<%--    <input type="hidden" name="id" value="${user.id}">: สร้าง input hidden สำหรับส่ง ID ของผู้ใช้ที่ต้องการลบไปยังเซิร์ฟเวอร์.--%>
<%--    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" type="submit">Delete</button>: สร้างปุ่ม "Delete" ที่เป็นสีแดง, สามารถ hover เพื่อเปลี่ยนสีเป็นแดงเข้ม, และเมื่อคลิกจะทำการ submit แบบฟอร์มเพื่อลบผู้ใช้.--%>




    <tfoot>
    <tr>
        <td colspan="5">
            <div class="flex justify-center">
                <div class="flex rounded-md mt-4">
                    <c:if test="${requestScope.page > 1}">
                        <a href="?page=${requestScope.page - 1}"
                           class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-l">
                            Previous
                        </a>
                    </c:if>
                    <div class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4">
                        Page ${requestScope.page} of ${requestScope.totalPages}
                    </div>
                    <c:if test="${requestScope.page < requestScope.totalPages}">
                        <a href="?page=${requestScope.page + 1}"
                           class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-r">
                            Next
                        </a>
                    </c:if>
                </div>
            </div>
        </td>
    </tr>
    </tfoot>
<%--    <tfoot>: เป็นแท็ก HTML ที่ใช้สร้างส่วนท้ายของตาราง.--%>
<%--    <td colspan="5">: กำหนดให้เซลล์นี้มีการรวม (colspan) คอลัมน์ 5, เพื่อให้ข้อมูลของ pagination ครอบทั้งหมด.--%>
<%--    <div class="flex justify-center">: สร้าง Flex container ที่จัดตำแหน่งตรงกลาง.--%>
<%--    <div class="flex rounded-md mt-4">: สร้าง Flex container ที่มีขอบโค้งและมี margin-top คือ 4.--%>
<%--    <c:if test="${requestScope.page > 1}">: ใช้ JSTL <c:if> เพื่อตรวจสอบว่าหน้าปัจจุบันมีค่ามากกว่า 1 หรือไม่.--%>
<%--    <a href="?page=${requestScope.page - 1}" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-l">: สร้างลิงก์ "Previous" ที่ให้ไปยังหน้าก่อนหน้า.--%>
<%--    <div class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4">: แสดงข้อมูลเลขหน้าปัจจุบันและทั้งหมด.--%>
<%--    <c:if test="${requestScope.page < requestScope.totalPages}">: ใช้ JSTL <c:if> เพื่อตรวจสอบว่าหน้าปัจจุบันมีค่าน้อยกว่าทั้งหมด.--%>
<%--    <a href="?page=${requestScope.page + 1}" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-r">: สร้างลิงก์ "Next" ที่ให้ไปยังหน้าถัดไป.--%>






        </table>
</body>
</html>
