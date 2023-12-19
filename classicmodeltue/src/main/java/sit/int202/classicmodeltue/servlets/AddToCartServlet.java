package sit.int202.classicmodeltue.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodeltue.entities.Product;
import sit.int202.classicmodeltue.models.Cart;
import sit.int202.classicmodeltue.models.ClassicModelLineItem;
import sit.int202.classicmodeltue.repositories.ProductRepository;

import java.io.IOException;

//AddToCartServlet เป็น Servlet ที่ใช้สำหรับการเพิ่มสินค้าลงในตะกร้าช็อปปิ้ง (Shopping Cart) ของผู้ใช้
//ประกาศ Servlet ด้วย @WebServlet annotation โดยระบุชื่อว่า "AddToCartServlet" และพาธ ("/add-to-cart") ที่จะเรียกใช้ Servlet.
@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode = request.getParameter("productCode"); //ดึงข้อมูล productCode จาก parameter ของ request:
        HttpSession session = request.getSession(); //ดึงหรือสร้าง HttpSession เพื่อเก็บข้อมูลของผู้ใช้:

        //ดึงหรือสร้าง Cart จาก HttpSession เพื่อเก็บข้อมูลสินค้าในตะกร้า:
        Cart<String, ClassicModelLineItem> cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart<>();
            session.setAttribute("cart", cart);
        }

        //ดึงข้อมูลสินค้า (Product) จาก ProductRepository โดยใช้ productCode:
        ProductRepository productRepository = new ProductRepository();
        Product product = productRepository.findProduct(productCode);

        //เพิ่มสินค้าลงในตะกร้า (Cart) โดยใช้ addItem ของ Cart:
        if (product != null) {
            cart.addItem(productCode, new ClassicModelLineItem(product));
        }

        //ส่งผลลัพธ์กลับไปที่ client ด้วย response.getWriter().print(cart.getNoOfItem()):
        response.getWriter().print(cart.getNoOfItem());
    }

    //doPost เป็นเมธอดที่ถูกเรียกเมื่อมี HTTP POST request ถูกส่งมาที่ Servlet นี้ ในที่นี้ ไม่มีการดำเนินการใด ๆ ที่ได้รับการกำหนดในเมธอด doPost นี้
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
