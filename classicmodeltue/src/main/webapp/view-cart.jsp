<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Modal--%>
<c:choose>

    <c:when test="${cart==null || empty cart.allItem}">
        <h3 class="text-danger">No item in your shopping cart</h3>
    </c:when>
    <%--    <c:when test="${cart==null || empty cart.allItem}">: ถ้าตะกร้าสินค้าว่างหรือไม่มีสินค้า, แสดงข้อความ "No item in your shopping cart" ในสีแดง.--%>

    <c:otherwise> <%-- <c:otherwise>: ถ้าตะกร้าสินค้ามีสินค้า, แสดงตารางสินค้าที่อยู่ในตะกร้า.--%>
        <table class="table table-striped table-bordered w-100">
                <%--       <table class="table table-striped table-bordered w-100">: สร้างตารางด้วย Bootstrap classes เพื่อแสดงรายละเอียดของสินค้า.--%>

            <thead>
            <th>#</th>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            </thead>

            <tbody>

            <c:forEach items="${cart.allItem}" var="lineItem" varStatus="vs">
                <%--            <c:forEach items="${cart.allItem}" var="lineItem" varStatus="vs">: ใช้ JSTL เพื่อวนลูปแสดงรายละเอียดของแต่ละสินค้าในตะกร้า.--%>

                <tr> <%--<tr>: สร้างแถวสำหรับแต่ละรายการสินค้า.--%>
                    <td>${vs.count}</td>
                    <td>${lineItem.product.productCode}</td>
                    <td>${lineItem.product.productName}</td>
                    <td>${lineItem.quantity}</td>
                    <td>${lineItem.product.price}</td>
                    <td>${lineItem.total}</td>
                        <%--                    <td>${vs.count}</td>: แสดงลำดับที่ของรายการ.--%>
                        <%--                    <td>${lineItem.product.productCode}</td>: แสดงรหัสสินค้า.--%>
                        <%--                    <td>${lineItem.product.productName}</td>: แสดงชื่อสินค้า.--%>
                        <%--                    <td>${lineItem.quantity}</td>: แสดงจำนวนสินค้า.--%>
                        <%--                    <td>${lineItem.product.price}</td>: แสดงราคาสินค้า.--%>
                        <%--                    <td>${lineItem.total}</td>: แสดงราคารวมของรายการสินค้า.--%>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="5" style="text-align: right;margin-right: 5px">Total</td>
                    <%--            style="text-align: right; margin-right: 5px": ใช้ CSS เพื่อจัดวางข้อความทางขวาของ--%>
                <td>${cart.totalPrice}</td>
                    <%--            <tr>...<td>${cart.totalPrice}</td></tr>: แสดงราคารวมของทั้งตะกร้า.--%>
            </tr>

            </tbody>

        </table>
    </c:otherwise>

</c:choose>