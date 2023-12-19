package sit.int202.classicmodeltue.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodeltue.repositories.OfficeRepository;

import java.io.IOException;

@WebServlet(name = "OfficeListServlet", value = "/office-list")
public class OfficeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository(); //สร้าง Object OfficeRepository:
        request.setAttribute("offices", officeRepository.findAll()); //ดึงข้อมูลสำนักงานทั้งหมดและเก็บไว้ใน Attribute ของ Request:
        String officeCode = request.getParameter("officeCode"); //ตรวจสอบการมีการส่ง Parameter "officeCode" มาหรือไม่:

        //หากมี Parameter "officeCode" ถูกส่งมา:
        //ดึงข้อมูลสำนักงานที่มีรหัส (officeCode) ที่ระบุและเก็บไว้ใน Attribute ของ Request ด้วยชื่อ "selectedOffice":
        if (officeCode != null) {
            request.setAttribute("selectedOffice", officeRepository.find(officeCode));
        }
        //ส่งข้อมูลไปที่หน้า JSP ("new-office-list.jsp") ด้วย getRequestDispatcher
        getServletContext().getRequestDispatcher("/new-office-list.jsp").forward(request, response);
        //getServletContext().getRequestDispatcher("/office-list.jsp").forward(request, response);
    }
}
