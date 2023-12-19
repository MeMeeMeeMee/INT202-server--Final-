<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: INT202&204
  Date: 11/23/2022
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row pt-4 align-items-center">
    <c:forEach items="${products}" var="p" varStatus="vs">
        <div class="col-2 my-1 mx-3">
            <div class="img-fluid img-thumbnail" title="${p.productCode}">
                <img src="model-images/${p.productLine}/${p.productCode}.jpg" height="120" width="180"/>
            </div>
            <div>${p.productName} <span style="text-align: right">${p.price}</span>
                <span style="color: darkred;margin-left: 2px;cursor: pointer">
                    <i class="bi bi-bag-plus" onclick="addToCart('${p.productCode}')"></i></span>
            </div>
        </div>
    </c:forEach>
</div>
<%--    <div class="row pt-4 align-items-center">: สร้างแถวในระบบกริดของ Bootstrap โดยกำหนดระยะขอบด้านบน (pt-4) และให้สมการแนวนอนจากกึ่งกลาง (align-items-center).--%>
<%--    <c:forEach items="${products}" var="p" varStatus="vs">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปผ่าน products ที่ถูกส่งมาจาก Java Controller หรือ Servlet.--%>
<%--    <div class="col-2 my-1 mx-3">: สร้างคอลัมน์ขนาด 2 บนกริด Bootstrap โดยกำหนดระยะขอบด้านบน (my-1) และด้านซ้าย-ขวา (mx-3).--%>
<%--    <div class="img-fluid img-thumbnail" title="${p.productCode}">: สร้าง <div> สำหรับรูปภาพสินค้าที่มีความคมชัดและขอบโค้งมน (thumbnail) พร้อมทั้งกำหนด title ด้วยรหัสสินค้า (${p.productCode}).--%>
<%--    <img src="model-images/${p.productLine}/${p.productCode}.jpg" height="120" width="180"/>: แสดงรูปภาพสินค้าโดยระบุที่อยู่ของรูปภาพ.--%>
<%--    <div>${p.productName} <span style="text-align: right">${p.price}</span>...: แสดงชื่อสินค้าและราคาพร้อมทั้งเพิ่มปุ่ม "Add to Cart" ที่สามารถคลิกได้.--%>
<%--    <span style="color: darkred; margin-left: 2px; cursor: pointer;">...: กำหนดสีของตัวอักษรเป็น darkred, ระยะขอบซ้าย (margin-left: 2px), และเปลี่ยนเป็น cursor ที่บอกว่าเป็นปุ่มที่สามารถคลิกได้.--%>
<%--    <i class="bi bi-bag-plus" onclick="addToCart('${p.productCode}')"></i>: ใช้ไอคอนจาก Bootstrap Icons (bi-bag-plus) และกำหนดฟังก์ชัน addToCart('${p.productCode}') ให้ทำงานเมื่อคลิก.--%>

<hr>


<div class="d-flex flex-row">
    <%--    นี้คือการสร้าง <div> element ที่ใช้กำหนด Flexbox ในรูปแบบแนวนอน (flex row) ด้วย Bootstrap class d-flex และ flex-row. Flexbox ให้ความยืดหยุ่นในการจัดวางและการจัดการพื้นที่ในทิศทางที่ต้องการ.--%>

    <div class="px-1">page:</div>
    <%--    นี้คือการสร้าง <div> element ที่ใช้ Bootstrap class px-1 เพื่อกำหนดระยะขอบแนวนอนด้านซ้ายและด้านขวาของข้อความใน <div>. Class px-1 จะกำหนดระยะขอบเป็น 0.25 ระดับขอบของหน่วย font-size ที่ใช้ในเนื้อหาของหน้าเว็บ.--%>

    <div class="px-1 mx-1 div-link"
         onclick="loadProduct(page=${page<=1?totalPage:page-1}, ${pageSize})"> &lt;
    </div>
    <%--    นี้คือการสร้าง <div> element ที่ใช้ Bootstrap classes px-1 และ mx-1 เพื่อกำหนดระยะขอบแนวนอนและระยะขอบทั้งด้านซ้ายและด้านขวาของข้อความใน <div>. Class div-link อาจถูกใช้เพื่อกำหนดสไตล์เพิ่มเติมตามที่กำหนดไว้ที่อื่น ๆ.--%>
    <%--    โดยที่ onclick attribute จะเรียกใช้ฟังก์ชัน loadProduct() และส่งพารามิเตอร์ page และ pageSize. สัญลักษณ์ &lt; ใน <div> จะแสดงเครื่องหมาย "less than" หรือ "less than symbol" (<).--%>

    <c:forEach begin="1" end="${totalPage}" varStatus="vs">
        <c:choose>
            <c:when test="${vs.count==page}">
                <div class="px-1 mx-1 div-link text-light bg-dark"> ${vs.count} </div>
            </c:when>
            <c:otherwise>
                <div class="px-1 mx-1 div-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">
                        ${vs.count}
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <%--    <c:forEach begin="1" end="${totalPage}" varStatus="vs">: ใช้ JSTL (JavaServer Pages Standard Tag Library) เพื่อวนลูปตามจำนวนหน้าทั้งหมด (totalPage) โดยให้ vs เป็นตัวแปรที่เก็บข้อมูลของการวนลูป.--%>
    <%--    <c:choose>: ใช้ JSTL เพื่อทำการเลือกทำงานตามเงื่อนไข.--%>
    <%--    <c:when test="${vs.count==page}">: ถ้าหน้าปัจจุบัน (page) เท่ากับหน้าที่กำลังวนลูปอยู่ (vs.count) ให้ใส่สไตล์พิเศษ.--%>
    <%--    <div class="px-1 mx-1 div-link text-light bg-dark">${vs.count}</div>: สร้าง <div> ที่มีสไตล์พิเศษเมื่อหน้าปัจจุบัน พร้อมทั้งแสดงหมายเลขหน้า (${vs.count}) และสีพื้นหลัง (bg-dark) และสีตัวอักษร (text-light) ที่ถูกกำหนด.--%>
    <%--    <c:otherwise>: ถ้าไม่ตรงเงื่อนไขข้างบน, ให้ทำงานในส่วนนี้.--%>
    <%--    <div class="px-1 mx-1 div-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">${vs.count}</div>: สร้าง <div> ที่ไม่มีสไตล์พิเศษ และเพิ่มการให้คลิกเพื่อโหลดหน้าที่ต้องการ (onclick attribute).--%>


    <div class="px-1 mx-2 div-link"
         onclick="loadProduct(page=${page>=totalPage?1:page+1}, ${pageSize})"> &gt;
    </div>
    <%--    นี้คือการสร้าง <div> element ที่ใช้ Bootstrap classes px-1 และ mx-2 เพื่อกำหนดระยะขอบแนวนอนและระยะขอบทั้งด้านซ้ายและด้านขวาของข้อความใน <div>. Class div-link อาจถูกใช้เพื่อกำหนดสไตล์เพิ่มเติมตามที่กำหนดไว้ที่อื่น ๆ.--%>
    <%--    โดยที่ onclick attribute จะเรียกใช้ฟังก์ชัน loadProduct() และส่งพารามิเตอร์ page และ pageSize. สัญลักษณ์ &gt; ใน <div> จะแสดงเครื่องหมาย "greater than" หรือ "greater than symbol" (>).--%>

    <div class="px-4 mx-1">
        items per page:
        <select id="itemsPage" onchange="loadProduct(1)">
            <option value="5" ${pageSize==5?'selected':''}>5</option>
            <option value="10" ${pageSize==10?'selected':''}>10</option>
            <option value="15" ${pageSize==15?'selected':''}>15</option>
            <option value="20" ${pageSize==20?'selected':''}>20</option>
            <option value="50" ${pageSize==50?'selected':''}>50</option>
        </select>
    </div>
    <%--     <div class="px-4 mx-1">: สร้าง <div> ที่กำหนดระยะขอบด้านซ้าย (px-4) และระยะขอบด้านขวา (mx-1).--%>
    <%--     items per page:: ข้อความที่แสดงใน <div> เพื่อกำหนดจำนวนรายการต่อหน้า.--%>
    <%--     <select id="itemsPage" onchange="loadProduct(1)">: สร้างเลือก dropdown (<select>) ที่มี id เป็น "itemsPage" และเพิ่มฟังก์ชัน onchange เพื่อเรียกใช้ฟังก์ชัน loadProduct(1) เมื่อมีการเปลี่ยนแปลง.--%>
    <%--     <option value="5" ${pageSize==5?'selected':''}>5</option>: สร้างตัวเลือกใน dropdown ที่มีค่า 5 และถูกเลือก (selected) หาก pageSize เท่ากับ 5.--%>
    <%--     <option value="10" ${pageSize==10?'selected':''}>10</option>: สร้างตัวเลือกใน dropdown ที่มีค่า 10 และถูกเลือก (selected) หาก pageSize เท่ากับ 10.--%>
    <%--     <option value="15" ${pageSize==15?'selected':''}>15</option>: สร้างตัวเลือกใน dropdown ที่มีค่า 15 และถูกเลือก (selected) หาก pageSize เท่ากับ 15.--%>
    <%--     <option value="20" ${pageSize==20?'selected':''}>20</option>: สร้างตัวเลือกใน dropdown ที่มีค่า 20 และถูกเลือก (selected) หาก pageSize เท่ากับ 20.--%>
    <%--     <option value="50" ${pageSize==50?'selected':''}>50</option>: สร้างตัวเลือกใน dropdown ที่มีค่า 50 และถูกเลือก (selected) หาก pageSize เท่ากับ 50.--%>

</div>