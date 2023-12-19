<%--
  Created by IntelliJ IDEA.
  User: INT202&204
  Date: 11/7/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    นี้คือโค้ด HTML ที่มีการเพิ่ม <head> สำหรับเข้ารหัสตัวอักษร UTF-8, การกำหนดขนาดหน้าจอ (viewport), และลิงก์ไปยังไฟล์ CSS ของ Bootstrap 5.0.2. คุณสามารถเพิ่มเนื้อหา HTML--%>

</head>
<body>
<div class="container ml-2 p-2">
    <%--    นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap class container, ml-2 (margin-left: 2), และ p-2 (padding: 2).--%>

    <div class="d-flex flex-row">Product List ::</div>
    <%--    นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap classes d-flex (display: flex) และ flex-row (flex-direction: row) เพื่อให้เนื้อหาอยู่ในแนวนอน. ข้อความ "Product List ::" ถูกเพิ่มลงใน <div> นี้.--%>

    <hr>

    <c:forEach items="${products}" var="p" varStatus="vs">
        <div class="row">
            <div class="col-1">${vs.count + (page-1)*pageSize})</div>
            <div class="col-4"> ${p.productCode}: ${p.productName}</div>
            <div class="col-1"> ${p.productScale}</div>
            <div class="col-1" style="text-align: right">${p.price}</div>
        </div>
    </c:forEach>
    <%--    <c:forEach items="${products}" var="p" varStatus="vs">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน products ที่ถูกส่งมาจาก Java Controller หรือ Servlet.--%>
    <%--    <div class="row">: สร้างแถวในระบบกริดของ Bootstrap สำหรับแต่ละรายการสินค้า.--%>
    <%--    <div class="col-1">${vs.count + (page-1)*pageSize}</div>: สร้างคอลัมน์ขนาด 1 ในกริด Bootstrap แสดงเลขที่รายการ.--%>
    <%--    <div class="col-4">${p.productCode}: ${p.productName}</div>: สร้างคอลัมน์ขนาด 4 ในกริด Bootstrap แสดงรหัสสินค้าและชื่อสินค้า.--%>
    <%--    <div class="col-1">${p.productScale}</div>: สร้างคอลัมน์ขนาด 1 ในกริด Bootstrap แสดงขนาดของสินค้า.--%>
    <%--    <div class="col-1" style="text-align: right">${p.price}</div>: สร้างคอลัมน์ขนาด 1 ในกริด Bootstrap แสดงราคาของสินค้าด้านขวาของคอลัมน์.--%>

    <hr>

    <div class="d-flex flex-row">
        <%--        นี้คือโค้ด HTML ที่มี <div> element ที่ใช้ Bootstrap classes d-flex (display: flex) และ flex-row (flex-direction: row) เพื่อจัดวางเนื้อหาในแนวนอน.--%>

        <div>page:</div> <%--  นี้คือโค้ด HTML ที่มี <div> element ที่มีข้อความ "page:". คุณสามารถเพิ่มเนื้อหาหรือแก้ไขตามที่ต้องการในส่วนนี้.--%>

        <c:forEach begin="1" end="${itemCount/pageSize + (itemCount%pageSize>0?1 :0)}" varStatus="vs">
            <c:choose>
                <c:when test="${vs.count==page}">
                    <div class="p-1 text-danger">[${vs.count}]</div>
                </c:when> <c:otherwise>
                <div class="p-1">
                    <a href="product-list?pageSize=${pageSize}&page=${vs.count}">[${vs.count}]</a>
                </div>
            </c:otherwise>
            </c:choose>
        </c:forEach>
        <%--    <c:forEach begin="1" end="${itemCount/pageSize + (itemCount%pageSize>0 ? 1 : 0)}" varStatus="vs">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปตามจำนวนหน้า.--%>
        <%--    <c:choose>: ใช้ตัวเลือกเพื่อตรวจสอบว่าหน้าปัจจุบันถูกเลือกหรือไม่.--%>
        <%--    <c:when test="${vs.count==page}">: ถ้าหน้าปัจจุบันถูกเลือก, สร้าง <div> ที่มีคลาส p-1 text-danger เพื่อให้ข้อความอยู่ในสีแดง.--%>
        <%--    <div class="p-1 text-danger">[${vs.count}]</div>: สร้าง <div> ที่มีข้อความเลขหน้าและอยู่ในสีแดง.--%>
        <%--    <c:otherwise>: ถ้าหน้าปัจจุบันไม่ถูกเลือก, สร้าง <div> ที่มีคลาส p-1 เพื่อให้ข้อความอยู่ในสีปกติ.--%>
        <%--    <div class="p-1">: สร้าง <div> ที่มีลิงก์ที่ส่งไปยังหน้าที่เกี่ยวข้อง.--%>
        <%--    <a href="product-list?pageSize=${pageSize}&page=${vs.count}">[${vs.count}]</a>: สร้างลิงก์ที่ส่งค่า pageSize และหน้าที่เกี่ยวข้อง.--%>

    </div>

</div>
</body>
</html>
