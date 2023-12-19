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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row bg-primary"><h3>Classic Model Offices ::</h3></div>
<%--    นี้คือโค้ด HTML ที่สร้าง <div> element ที่มีคลาส row และสีพื้นหลัง bg-primary พร้อมทั้งมีหัวข้อระดับ 3 (<h3>) ภายใน. นี้จะสร้างแถว (row) ที่มีพื้นหลังสีน้ำเงิน (bg-primary)
        และมีข้อความ "Classic Model Offices ::" ที่เป็นหัวข้อระดับ 3 อยู่ข้างใน.--%>

<div class="row">
    <c:forEach items="${offices}" var="office">
        <div class="col-2 border border-secondary p-2 m-2
             ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : ''}">
            <div>
                <a href="javascript:loadOffice('${office.officeCode}')"> ${office.city}</a>, ${office.country}
            </div>
            <div> ${office.phone}</div>
        </div>
    </c:forEach>
</div>
<%--    <div class="row">: สร้างแถวในระบบกริดของ Bootstrap.--%>
<%--    <c:forEach items="${offices}" var="office">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน offices ที่ถูกส่งมาจาก Java Controller หรือ Servlet.--%>
<%--    <div class="col-2 border border-secondary p-2 m-2 ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : ''}">: สร้างคอลัมน์ขนาด 2 บนกริด Bootstrap โดยมีการเพิ่มขอบ, พื้นหลัง, และการเรียงระดับสีโดยตรวจสอบว่า office.officeCode เท่ากับ selectedOffice.officeCode หรือไม่.--%>
<%--    <a href="javascript:loadOffice('${office.officeCode}')">${office.city}</a>, ${office.country}: สร้างลิงก์ที่เมื่อคลิกจะเรียกฟังก์ชัน JavaScript loadOffice('${office.officeCode}') และแสดงชื่อเมืองและประเทศของสำนักงาน.--%>
<%--    <div>${office.phone}</div>: แสดงหมายเลขโทรศัพท์ของสำนักงาน.--%>
<%--    </div>: ปิด <div> ที่ใช้สำหรับแสดงข้อมูลของแต่ละสำนักงานในลูป.--%>
<br>

<div class="row bg-light"><b>Employees ::</b></div>
<%--    นี้คือโค้ด HTML ที่สร้าง <div> element ที่มีคลาส row และสีพื้นหลัง bg-light พร้อมทั้งมีข้อความ "Employees ::" ที่ถูกใส่ใน tag <b> (bold) อยู่ข้างใน. นี้จะสร้างแถว (row) ที่มีพื้นหลังสีสว่าง (bg-light) และมีข้อความ "Employees ::" ที่เป็นตัวหนาอยู่ข้างใน.--%>

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
<%--    <c:forEach items="${selectedOffice.employeeList}" var="employee">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน selectedOffice.employeeList ซึ่งเป็นรายการพนักงานของสำนักงานที่ถูกเลือก.--%>
<%--    <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">: สร้างคอลัมน์ขนาด 2 บนกริด Bootstrap โดยมีการกำหนดระยะขอบ, ระยะขอบซ้าย, ระยะขอบบน, และใช้รูปร่างมนตรีกลม (rounded-pill).--%>
<%--    <div>${employee.firstName} ${employee.lastName} - ${employee.jobTitle}</div>: แสดงข้อมูลของพนักงานที่ประกอบด้วยชื่อและนามสกุล (${employee.firstName} ${employee.lastName}) และตำแหน่งงาน (${employee.jobTitle}).--%>
<%--    </div>: ปิด <div> ที่ใช้สำหรับแสดงข้อมูลของแต่ละพนักงานในลูป.--%>