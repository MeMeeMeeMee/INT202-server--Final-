<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register Page</title>
<%--    กำหนดชื่อหน้าเว็บที่จะแสดงบนแท็บของเบราว์เซอร์.--%>

    <meta charset="UTF-8">
<%--    ระบุชุดอักขระที่ใช้ในหน้าเว็บเป็น UTF-8 เพื่อรองรับตัวอักษรทุกชนิด.--%>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    ใช้กำหนดการแสดงผลบนอุปกรณ์ที่มีหน้าจอขนาดต่าง ๆ โดยกำหนดความกว้างของหน้าจอเท่ากับความกว้างของอุปกรณ์และความเริ่มต้นของการซูม (scale).--%>

    <script src="https://cdn.tailwindcss.com"></script>
<%--    เรียกใช้ไฟล์ JavaScript จาก CDN (Content Delivery Network) ของ Tailwind CSS. Tailwind CSS เป็นเฟรมเวิร์ก CSS ที่ช่วยให้การสร้างหน้าเว็บง่ายขึ้นด้วยการใช้คลาสที่กำหนดไว้ล่วงหน้า.--%>

</head>

<body class="flex items-center justify-center h-screen">
<%--class="flex items-center justify-center h-screen": นี่คือ attribute class ที่กำหนดคุณสมบัติสไตล์ของ <body> โดยใช้ CSS class ต่าง ๆ ดังนี้:--%>
<%--flex: ใช้เป็น Flexbox layout model ซึ่งเป็นโมเดลการจัดวางที่ช่วยทำให้การออกแบบของหน้าเว็บเป็นไปอย่างยืดหยุ่นและ Responsive.--%>
<%--items-center: ทำให้元素ลูกของ flex container ถูกวางตรงกลางตามแกนทะแยง (vertically).--%>
<%--justify-center: ทำให้元素ลูกของ flex container ถูกวางตรงกลางตามแกนหลัก (horizontally).--%>
<%--h-screen: กำหนดความสูงของ body เท่ากับความสูงของหน้าจอทั้งหมด (100vh). นิยมใช้เพื่อสร้าง container ที่ใหญ่เต็มหน้าจอ.--%>


<div class="w-full max-w-xs">
<%--    class="w-full": คลาส w-full จะทำให้ element ครอบคลุม (take up) ทั้งความกว้างของ container หรือพ่อครัว (parent element) ที่มี element นี้อยู่ภายใน.--%>
<%--    class="max-w-xs": คลาส max-w-xs จะกำหนดความกว้างสูงสุดของ element เป็น xs (extra-small) ตามค่าที่กำหนดไว้ในไฟล์การกำหนดค่าของ Tailwind CSS. ทำให้ element นี้จะไม่มีความกว้างเกินที่กำหนดไว้แม้ว่าพ่อครัวหรือ container อาจจะมีขนาดใหญ่กว่า.--%>



    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" method="post" action="register">
<%--        class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4": กำหนดคลาส CSS ของ Tailwind เพื่อให้มีสไตล์ดังนี้:--%>
<%--        bg-white: กำหนดสีพื้นหลังของฟอร์มเป็นสีขาว.--%>
<%--        shadow-md: เพิ่มเงาให้ฟอร์ม โดย md หมายถึง medium shadow.--%>
<%--        rounded: ทำให้มีมุมโค้งที่มน.--%>
<%--        px-8: กำหนด padding ในแนวนอน (horizontal padding) ของฟอร์มเท่ากับ 8 หน่วย.--%>
<%--        pt-6: กำหนด padding ด้านบน (top padding) ของฟอร์มเท่ากับ 6 หน่วย.--%>
<%--        pb-8: กำหนด padding ด้านล่าง (bottom padding) ของฟอร์มเท่ากับ 8 หน่วย.--%>
<%--        mb-4: กำหนด margin ด้านล่าง (margin bottom) ของฟอร์มเท่ากับ 4 หน่วย.--%>
<%--        method="post": กำหนดวิธีการส่งข้อมูลฟอร์มไปยังเซิร์ฟเวอร์, ในที่นี้คือ "post" ซึ่งมักจะใช้สำหรับการส่งข้อมูลที่ต้องการปกปิดเช่นการลงทะเบียนหรือเข้าสู่ระบบ.--%>
<%--        action="register": กำหนด URL หรือ path ที่ฟอร์มจะส่งข้อมูลไป. ในที่นี้คือ "register" ซึ่งน่าจะเป็น path หรือ endpoint ที่จะจัดการข้อมูลการลงทะเบียน.--%>


        <div class="mb-4">
<%--            class="mb-4": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--            mb-4: กำหนด margin ด้านล่าง (bottom margin) ของ <div> เท่ากับ 4 หน่วย.--%>



            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                Username
            </label>
<%--    class="block text-gray-700 text-sm font-bold mb-2": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    block: ทำให้ป้ายชื่อ (label) มีลักษณะ block-level element, ทำให้มีความกว้างเต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    text-gray-700: กำหนดสีของข้อความเป็นสีเทา (gray-700).--%>
<%--    text-sm: กำหนดขนาดของข้อความเป็น small.--%>
<%--    font-bold: ทำให้ข้อความมีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    mb-2: กำหนด margin ด้านล่างของป้ายชื่อ (label) เท่ากับ 2 หน่วย, ทำให้มีระยะห่างด้านล่าง.--%>
<%--    for="username": กำหนดให้ label เชื่อมต่อกับ element ที่มี id เป็น "username". สิ่งนี้ช่วยให้ผู้ใช้สามารถคลิกที่ป้ายชื่อ (label) เพื่อเข้าสู่ช่องป้อนข้อมูลที่มี id "username" ได้.--%>



            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                   id="username" name="username" type="text" placeholder="Username">
<%--    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    shadow: เพิ่มเงาให้กับช่องป้อนข้อมูล.--%>
<%--    appearance-none: ลบสไตล์ที่ถูกกำหนดจากเบราว์เซอร์ (browser default styles).--%>
<%--    border: กำหนดเส้นขอบ (border) ในช่องป้อนข้อมูล.--%>
<%--    rounded: ทำให้มีมุมโค้งที่มน.--%>
<%--    w-full: กำหนดความกว้างของช่องป้อนข้อมูลให้เต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    py-2: กำหนด padding ด้านบนและด้านล่างของช่องป้อนข้อมูลเท่ากับ 2 หน่วย.--%>
<%--    px-3: กำหนด padding ด้านซ้ายและด้านขวาของช่องป้อนข้อมูลเท่ากับ 3 หน่วย.--%>
<%--    text-gray-700: กำหนดสีของข้อความในช่องป้อนข้อมูลเป็นสีเทา (gray-700).--%>
<%--    leading-tight: กำหนดระยะห่างระหว่างบรรทัดในช่องป้อนข้อมูลให้เล็ก (tight).--%>
<%--    focus:outline-none: ลบเส้นกรอบที่ปรากฏขึ้นเมื่อช่องป้อนข้อมูลได้รับการโฟกัส.--%>
<%--    focus:shadow-outline: เพิ่มเงาเมื่อช่องป้อนข้อมูลได้รับการโฟกัส.--%>
<%--    id="username": กำหนดรหัสบุคคลิก (id) ให้ช่องป้อนข้อมูลเพื่อให้ป้ายชื่อ (label) เชื่อมโยงกับช่องป้อนข้อมูล.--%>
<%--    name="username": กำหนดชื่อ (name) ของช่องป้อนข้อมูล, ซึ่งจะถูกส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง.--%>
<%--    type="text": กำหนดประเภทของช่องป้อนข้อมูลเป็นข้อความ.--%>
<%--    placeholder="Username": กำหนดข้อความ placeholder ที่จะแสดงในช่องป้อนข้อมูลเมื่อไม่มีข้อมูลถูกป้อนเข้าไป.--%>



        </div>


        <div class="mb-6">
<%--            class="mb-6": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--            mb-6: กำหนด margin ด้านล่าง (bottom margin) ของ <div> เท่ากับ 6 หน่วย.--%>



            <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                Password
            </label>
<%--    class="block text-gray-700 text-sm font-bold mb-2": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    block: ทำให้ป้ายชื่อ (label) มีลักษณะ block-level element, ทำให้มีความกว้างเต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    text-gray-700: กำหนดสีของข้อความในป้ายชื่อ (label) เป็นสีเทา (gray-700).--%>
<%--    text-sm: กำหนดขนาดของข้อความในป้ายชื่อ (label) เป็น small.--%>
<%--    font-bold: ทำให้ข้อความในป้ายชื่อ (label) มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    mb-2: กำหนด margin ด้านล่างของป้ายชื่อ (label) เท่ากับ 2 หน่วย, ทำให้มีระยะห่างด้านล่าง.--%>
<%--    for="password": กำหนดให้ label เชื่อมต่อกับ element ที่มี id เป็น "password". สิ่งนี้ช่วยให้ผู้ใช้สามารถคลิกที่ป้ายชื่อ (label) เพื่อเข้าสู่ช่องป้อนข้อมูลรหัสผ่าน.--%>



            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                   id="password" name="password" type="password" placeholder="******************">
<%--    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    shadow: เพิ่มเงาให้กับช่องป้อนข้อมูล.--%>
<%--    appearance-none: ลบสไตล์ที่ถูกกำหนดจากเบราว์เซอร์ (browser default styles).--%>
<%--    border: กำหนดเส้นขอบ (border) ในช่องป้อนข้อมูล.--%>
<%--    rounded: ทำให้มีมุมโค้งที่มน.--%>
<%--    w-full: กำหนดความกว้างของช่องป้อนข้อมูลให้เต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    py-2: กำหนด padding ด้านบนและด้านล่างของช่องป้อนข้อมูลเท่ากับ 2 หน่วย.--%>
<%--    px-3: กำหนด padding ด้านซ้ายและด้านขวาของช่องป้อนข้อมูลเท่ากับ 3 หน่วย.--%>
<%--    text-gray-700: กำหนดสีของข้อความในช่องป้อนข้อมูลเป็นสีเทา (gray-700).--%>
<%--    leading-tight: กำหนดระยะห่างระหว่างบรรทัดในช่องป้อนข้อมูลให้เล็ก (tight).--%>
<%--    focus:outline-none: ลบเส้นกรอบที่ปรากฏขึ้นเมื่อช่องป้อนข้อมูลได้รับการโฟกัส.--%>
<%--    focus:shadow-outline: เพิ่มเงาเมื่อช่องป้อนข้อมูลได้รับการโฟกัส.--%>
<%--    id="password": กำหนดรหัสบุคคลิก (id) ให้ช่องป้อนข้อมูลเพื่อให้ป้ายชื่อ (label) เชื่อมโยงกับช่องป้อนข้อมูล.--%>
<%--    name="password": กำหนดชื่อ (name) ของช่องป้อนข้อมูล, ซึ่งจะถูกส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง.--%>
<%--    type="password": กำหนดประเภทของช่องป้อนข้อมูลเป็นรหัสผ่าน (password).--%>
<%--    placeholder="******************": กำหนดข้อความ placeholder ที่จะแสดงในช่องป้อนข้อมูลเมื่อไม่มีข้อมูลถูกป้อนเข้าไป. ในที่นี้, placeholder ถูกกำหนดให้เป็นเครื่องหมายดอกจันทร์ (*), แสดงให้ทราบว่านี่คือช่องป้อนรหัสผ่าน.--%>



        </div>


        <div class="mb-6">
<%--            class="mb-6": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--            mb-6: กำหนด margin ด้านล่าง (bottom margin) ของ <div> เท่ากับ 6 หน่วย.--%>


            <label class="block text-gray-700 text-sm font-bold mb-2" for="role">
                Role
            </label>
<%--    class="block text-gray-700 text-sm font-bold mb-2": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    block: ทำให้ป้ายชื่อ (label) มีลักษณะ block-level element, ทำให้มีความกว้างเต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    text-gray-700: กำหนดสีของข้อความในป้ายชื่อ (label) เป็นสีเทา (gray-700).--%>
<%--    text-sm: กำหนดขนาดของข้อความในป้ายชื่อ (label) เป็น small.--%>
<%--    font-bold: ทำให้ข้อความในป้ายชื่อ (label) มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    mb-2: กำหนด margin ด้านล่างของป้ายชื่อ (label) เท่ากับ 2 หน่วย, ทำให้มีระยะห่างด้านล่าง.--%>
<%--    for="role": กำหนดให้ label เชื่อมต่อกับ element ที่มี id เป็น "role". สิ่งนี้ช่วยให้ผู้ใช้สามารถคลิกที่ป้ายชื่อ (label) เพื่อเข้าสู่ช่องเลือกข้อมูล (dropdown) หรือองค์ประกอบที่เกี่ยวข้องได้.--%>


            <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    id="role" name="role">
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
<%--    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    shadow: เพิ่มเงาให้กับช่องเลือกข้อมูล.--%>
<%--    appearance-none: ลบสไตล์ที่ถูกกำหนดจากเบราว์เซอร์ (browser default styles).--%>
<%--    border: กำหนดเส้นขอบ (border) ในช่องเลือกข้อมูล.--%>
<%--    rounded: ทำให้มีมุมโค้งที่มน.--%>
<%--    w-full: กำหนดความกว้างของช่องเลือกข้อมูลให้เต็มระยะขอบขวาง (full width) ของ container หรือพ่อครัวที่ครอบ.--%>
<%--    py-2: กำหนด padding ด้านบนและด้านล่างของช่องเลือกข้อมูลเท่ากับ 2 หน่วย.--%>
<%--    px-3: กำหนด padding ด้านซ้ายและด้านขวาของช่องเลือกข้อมูลเท่ากับ 3 หน่วย.--%>
<%--    text-gray-700: กำหนดสีของข้อความในช่องเลือกข้อมูลเป็นสีเทา (gray-700).--%>
<%--    leading-tight: กำหนดระยะห่างระหว่างบรรทัดในช่องเลือกข้อมูลให้เล็ก (tight).--%>
<%--    focus:outline-none: ลบเส้นกรอบที่ปรากฏขึ้นเมื่อช่องเลือกข้อมูลได้รับการโฟกัส.--%>
<%--    focus:shadow-outline: เพิ่มเงาเมื่อช่องเลือกข้อมูลได้รับการโฟกัส.--%>
<%--    id="role": กำหนดรหัสบุคคลิก (id) ให้ช่องเลือกข้อมูลเพื่อให้ป้ายชื่อ (label) เชื่อมโยงกับช่องเลือกข้อมูล.--%>
<%--    name="role": กำหนดชื่อ (name) ของช่องเลือกข้อมูล, ซึ่งจะถูกส่งไปยังเซิร์ฟเวอร์เมื่อฟอร์มถูกส่ง.--%>
<%--    <option>: แท็ก HTML ที่ใช้สร้างตัวเลือกในช่องเลือกข้อมูล.--%>
<%--        value="USER": กำหนดค่าที่จะถูกส่งไปยังเซิร์ฟเวอร์เมื่อตัวเลือกนี้ถูกเลือกเป็น "USER".--%>
<%--        value="ADMIN": กำหนดค่าที่จะถูกส่งไปยังเซิร์ฟเวอร์เมื่อตัวเลือกนี้ถูกเลือกเป็น "ADMIN".--%>



        </div>


        <div class="flex items-center justify-between">
<%--            flex: ทำให้ <div> เป็น flex container ซึ่งทำให้ลูกค้าภายในของ <div> นี้สามารถใช้งาน flexbox ได้.--%>
<%--            items-center: จัดวางลูกค้าในแนวทะแยงของ container (vertically centered).--%>
<%--            justify-between: จัดวางลูกค้าในทิศทางที่ขยับกันไกลออกจากกัน (horizontally spaced between).--%>



            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                    type="submit">
                Register
            </button>
<%--    class="bg-blue-500": กำหนดสีพื้นหลัง (background color) ให้กับปุ่มเป็นสีน้ำเงิน (blue-500). เลข 500 ในที่นี้หมายถึงระดับความเข้มของสีในตำแหน่งที่กำหนด.--%>
<%--    hover:bg-blue-700: กำหนดสีพื้นหลังในขณะที่เม้าส์ไปชี้ (hover) ที่ปุ่มให้เป็นสีน้ำเงินเข้มขึ้น (blue-700). เมื่อผู้ใช้เอาเม้าส์ไปชี้ที่ปุ่ม, สีพื้นหลังจะเปลี่ยนตามที่กำหนด.--%>
<%--    text-white: กำหนดสีของข้อความในปุ่มให้เป็นสีขาว.--%>
<%--    font-bold: ทำให้ข้อความในปุ่มมีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    py-2: กำหนด padding ด้านบนและด้านล่างของปุ่มเท่ากับ 2 หน่วย.--%>
<%--    px-4: กำหนด padding ด้านซ้ายและด้านขวาของปุ่มเท่ากับ 4 หน่วย.--%>
<%--    rounded: ทำให้มีมุมโค้ง.--%>
<%--    focus:outline-none: ลบเส้นกรอบที่ปรากฏขึ้นเมื่อปุ่มได้รับการโฟกัส.--%>
<%--    focus:shadow-outline: เพิ่มเงาเมื่อปุ่มได้รับการโฟกัส.--%>
<%--    type="submit": กำหนดประเภทของปุ่มให้เป็นปุ่มส่งฟอร์ม (submit button).--%>
<%--    ข้อความ "Register" ที่ตั้งอยู่ภายใน <button>: แสดงข้อความบนปุ่ม.--%>



            <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="login">
                Login
            </a>
<%--    class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800": คลาส CSS ที่ถูกกำหนดโดย Tailwind CSS ซึ่งมีความหมายดังนี้:--%>
<%--    inline-block: ทำให้ลิงก์เป็น inline-block element, ทำให้สามารถมีความกว้างและความสูงที่กำหนดได้.--%>
<%--    align-baseline: จัดวางลิงก์ให้สอดคล้องกับ baseline ของข้อความในบรรทัดเดียวกัน.--%>
<%--    font-bold: ทำให้ข้อความในลิงก์มีน้ำหนักตัวอักษรหนา (bold).--%>
<%--    text-sm: กำหนดขนาดของข้อความในลิงก์เป็น small.--%>
<%--    text-blue-500: กำหนดสีของข้อความในลิงก์ให้เป็นสีน้ำเงิน (blue-500). เลข 500 ในที่นี้หมายถึงระดับความเข้มของสีในตำแหน่งที่กำหนด.--%>
<%--    hover:text-blue-800: กำหนดสีของข้อความในลิงก์เมื่อเม้าส์ชี้ (hover) ที่ลิงก์ให้เป็นสีน้ำเงินเข้มขึ้น (blue-800). เมื่อผู้ใช้เอาเม้าส์ไปชี้ที่ลิงก์, สีข้อความจะเปลี่ยนตามที่กำหนด.--%>
<%--    href="login": กำหนด URL ที่ลิงก์จะนำไป.--%>
<%--    ข้อความ "Login" ที่ตั้งอยู่ภายใน <a>: แสดงข้อความที่เป็นลิงก์.--%>



        </div>


    </form>



    <c:if test="${requestScope.error != null}"> <%--  เพื่อตรวจสอบว่ามีค่าใน attribute error ที่ถูกตั้งไว้ใน requestScope หรือไม่.--%>

        <p class="text-red-500 text-xs italic">${requestScope.error}</p>
        <%-- ถ้ามี error ใน requestScope แล้วให้แสดง <p> element ที่มี class เพื่อกำหนดสไตล์ให้ข้อความเป็นสีแดง (text-red-500) และขนาดเล็ก (text-xs)
        และตัวเอียง (italic). ข้อความที่จะแสดงจะเป็นค่าที่อยู่ใน error attribute.--%>


    </c:if>


</div>


</body>
</html>
