package sit.int202.classicmodeltue.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ViewCartServlet", value = "/view-cart")
public class ViewCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ตรวจสอบว่ามี Session และตะกร้าสินค้า (cart) ที่ถูกสร้างไว้หรือไม่. ถ้าไม่มีหรือไม่พบตะกร้าสินค้าใน Session จะส่งข้อความผิดพลาดและรหัสสถานะ HTTP 400 Bad Request กลับ.
        HttpSession session = request.getSession(false); //การดึง Session จาก request. false ที่ถูกส่งไปหมายถึงไม่ต้องสร้าง Session ใหม่ถ้าไม่มี Session ที่เชื่อมต่ออยู่.
        if(session==null || session.getAttribute("cart")==null) { //ตรวจสอบว่า Session ไม่มีหรือ cart ไม่ได้ถูกตั้งค่าใน Session.
            response.setHeader("error", "Your cart not available !!!");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Your cart not available !!!");
        } else {
            //หาก Session และตะกร้าสินค้าถูกต้อง จะ Forward ไปยังหน้า JSP (view-cart.jsp) เพื่อแสดงผลตะกร้าสินค้า.
            request.getRequestDispatcher("/view-cart.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
