package sit.int202.classicmodeltue.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodeltue.entities.Product;
import sit.int202.classicmodeltue.repositories.ProductRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductSearchServlet", value = "/product-search")
public class ProductSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchParam = request.getParameter("searchParam"); //เพื่อดึงค่าของพารามิเตอร์ "searchParam" จาก URL ที่ส่งมา.

        //ตรวจสอบว่า "searchParam" ไม่เป็น null และมีความยาวมากกว่า 5 ตัวอักษรหรือไม่ ถ้าไม่, Servlet จะส่งข้อผิดพลาดกลับไปที่ผู้ใช้.
        if (searchParam == null & searchParam.length() < 5) { //
            response.setHeader("error", "Invalid parameter or search text less than 5 letters");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } else {
            ProductRepository productRepository = new ProductRepository(); //เป็นการสร้าง Object ของคลาส ProductRepository ซึ่งเป็นคลาสที่ถูกสร้างขึ้นเพื่อจัดการกับข้อมูลสินค้า (Product) ในฐานข้อมูล.

            //การดึงค่า "page" และ "pageSize" จาก Request เพื่อใช้ในการกำหนดหน้าที่และขนาดหน้าของผลลัพธ์ที่จะแสดง.
            String pageParam = request.getParameter("page");
            String pageSizeParam = request.getParameter("pageSize");

            //การแปลงค่าที่ได้จาก Request ให้กลายเป็นตัวเลข เพื่อให้สามารถนำไปใช้ในการคำนวณหน้าและขนาดหน้าได้.
            //หาก "page" หรือ "pageSize" เป็น null หรือไม่ได้ระบุ, ค่าเริ่มต้นจะถูกกำหนดเป็น 1 และขนาดหน้าที่กำหนดใน ProductRepository ตามลำดับ.
            int page = pageParam == null ? 1 : Integer.valueOf(pageParam);
            int pageSize = pageSizeParam == null ? productRepository.getDefaultPageSize() : Integer.valueOf(pageSizeParam);

            List<Product> productList = productRepository.findByCatOrDesc(searchParam); //การใช้เมธอด findByCatOrDesc ของ ProductRepository เพื่อค้นหาข้อมูลสินค้าที่ตรงกับคำที่ระบุหรือคำที่ใกล้เคียงที่ถูกส่งมาในพารามิเตอร์ searchParam.
            System.out.println("Param: "+ searchParam);

            //การตั้งค่า Attribute ใน Request เพื่อนำข้อมูลสินค้าที่ค้นหาได้, หน้าที่, ขนาดหน้า และอื่น ๆ เพื่อนำไปใช้ในการแสดงผลหน้า JSP ต่อไป.
            request.setAttribute("products", productList);
            request.setAttribute("page", page);
            request.setAttribute("pageSize", pageSize);
            int itemCount = productList.size(); //นับจำนวนรายการทั้งหมดที่ค้นหาได้จาก productList.
            request.setAttribute("itemCount", itemCount); //ตั้งค่า Attribute ของจำนวนรายการและจำนวนหน้า:
            int totalPage = itemCount / pageSize + (itemCount % pageSize == 0 ? 0 : 1); //คำนวณจำนวนหน้าทั้งหมดโดยใช้การหารจำนวนรายการด้วยขนาดหน้า และเพิ่ม 1 หน้าถ้ามีเศษ.
            request.setAttribute("totalPage", totalPage); //ตั้งค่า Attribute ของจำนวนรายการและจำนวนหน้า:
            getServletContext().getRequestDispatcher("/new-product-list.jsp").forward(request, response); //Forward ไปที่ JSP (new-product-list.jsp) เพื่อแสดงผลข้อมูลสินค้าและตัวควบคุมหน้า.
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}
