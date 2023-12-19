<%--
  Created by IntelliJ IDEA.
  User: INT202&204
  Date: 11/7/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: INT202&204
  Date: 11/7/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office-Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    นี้คือโค้ด HTML ที่มีการเพิ่ม <head> สำหรับเข้ารหัสตัวอักษร UTF-8, การกำหนดขนาดหน้าจอ (viewport), และลิงก์ไปยังไฟล์ CSS ของ Bootstrap 5.0.2. คุณสามารถเพิ่มเนื้อหา HTML และสคริปต์ JavaScript ของคุณในส่วนที่มี comment <!-- Your HTML content goes here --> และ <!-- Optional: Add your JavaScript scripts here --> ตามลำดับ.--%>
</head>
<body>
<div class="container">
    <%--    นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap class container เพื่อจัดเรียงเนื้อหาในคอลัมน์กลาง.--%>

    <div class="row bg-primary"><h2>Classic Model Offices ::</h2></div>
    <%--    นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap class row และกำหนดสีพื้นหลังเป็น bg-primary. ภายใน <div> นี้มี <h2> element ที่แสดงข้อความ "Classic Model Offices ::".--%>

    <div class="row">
        <c:forEach items="${offices}" var="office">
            <div class="col-2 border border-secondary p-2 m-2
             ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : ''}">
                <div>
                    <a href="office-list?officeCode=${office.officeCode}"> ${office.city}</a>, ${office.country}
                </div>
                <div> ${office.phone}</div>
            </div>
        </c:forEach>
    </div>
    <%--    <div class="row">: สร้างแถวในระบบกริดของ Bootstrap.--%>
    <%--    <c:forEach items="${offices}" var="office">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน offices ที่ถูกส่งมาจาก Java Controller หรือ Servlet.--%>
    <%--    <div class="col-2 border border-secondary p-2 m-2 ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : ''}">: สร้างคอลัมน์ขนาด 2 บนกริด Bootstrap และกำหนดสไตล์ขอบ, ระยะขอบ, และสีพื้นหลังของ div ตามเงื่อนไขที่กำหนด.--%>
    <%--    <a href="office-list?officeCode=${office.officeCode}">${office.city}</a>, ${office.country}: สร้างลิงก์ที่มีที่อยู่ที่ส่งไปยัง "office-list" พร้อมกับพารามิเตอร์ officeCode และแสดงข้อความ "city, country".--%>
    <%--    <div>${office.phone}</div>: แสดงข้อมูลหมายเลขโทรศัพท์ของสำนักงาน.--%>

    <br>

    <div class="row bg-light"><b>Employees ::</b></div>
    <%--    นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap class row และกำหนดสีพื้นหลังเป็น bg-light. ภายใน <div> นี้มี <b> element ที่แสดงข้อความ "Employees ::" โดยใช้ tag <b> เพื่อทำให้ข้อความเป็นตัวหนา.--%>

    <div class="row">
        <c:forEach items="${selectedOffice.employeeList}" var="employee">
            <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">
                <div> ${employee.firstName}
                        ${employee.lastName} - ${employee.jobTitle}
                </div>
            </div>
        </c:forEach>
    </div>
    <%--    <div class="row">: สร้างแถวในระบบกริดของ Bootstrap.--%>
    <%--    <c:forEach items="${selectedOffice.employeeList}" var="employee">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน selectedOffice.employeeList ที่เป็นรายชื่อของพนักงานในสำนักงานที่ถูกเลือก.--%>
    <%--    <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">: สร้างคอลัมน์ขนาด 2 บนกริด Bootstrap และกำหนดสไตล์ขอบ, ระยะขอบ, และรูปร่างแบบกลม (rounded-pill) ของ div.--%>
    <%--    <div>${employee.firstName} ${employee.lastName} - ${employee.jobTitle}</div>: แสดงข้อมูลของพนักงานที่รวมถึงชื่อ, นามสกุล, และตำแหน่งงาน.--%>

</div>
</body>
</html>