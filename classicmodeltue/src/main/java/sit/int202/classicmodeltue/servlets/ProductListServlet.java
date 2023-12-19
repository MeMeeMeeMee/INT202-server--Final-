package sit.int202.classicmodeltue.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodeltue.entities.Product;
import sit.int202.classicmodeltue.repositories.ProductRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/product-list")
public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //สร้าง Object ProductRepository
        ProductRepository productRepository = new ProductRepository();

        //ดึงพารามิเตอร์ "page" และ "pageSize" จาก Request:
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        //แปลงค่า "page" และ "pageSize" เป็นตัวเลข:
        int page = pageParam == null ? 1 : Integer.valueOf(pageParam);
        int pageSize = pageSizeParam == null ? productRepository.getDefaultPageSize() : Integer.valueOf(pageSizeParam);

        //ดึงข้อมูลสินค้าตามหน้าและขนาดหน้าที่กำหนดจาก ProductRepository:
        List<Product> productList = productRepository.findAll(page, pageSize);

        //เก็บข้อมูลสินค้าและข้อมูลอื่น ๆ ใน Attribute ของ Request เพื่อนำไปแสดงผลที่หน้า JSP:
        request.setAttribute("products", productList);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);

        //คำนวณข้อมูลเพิ่มเติมเกี่ยวกับหน้าและขนาดหน้า (itemCount, totalPage) และเก็บไว้ใน Attribute ของ Request:
        int itemCount = productRepository.countAll();
        request.setAttribute("itemCount", itemCount);
        int totalPage = itemCount / pageSize + (itemCount % pageSize == 0 ? 0 : 1);
        request.setAttribute("totalPage", totalPage);

        //ส่งข้อมูลไปที่หน้า JSP ("new-product-list.jsp") ด้วย getRequestDispatcher:
        getServletContext().getRequestDispatcher("/new-product-list.jsp").forward(request, response);
//        getServletContext().getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}
