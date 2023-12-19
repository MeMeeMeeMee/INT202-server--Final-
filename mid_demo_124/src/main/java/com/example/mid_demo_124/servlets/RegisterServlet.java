package com.example.mid_demo_124.servlets;

import com.example.mid_demo_124.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegisterServlet" ,value = "/register")
public class RegisterServlet extends HttpServlet {
    List<User> users = new ArrayList<>();
    @Override //ส่งไปหน้าregister.jsp
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req,resp);
    }


    @Override //รับค่าที่ได้จากการกรอกข้อมูลในหน้าregister.jsp
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); //รับค่าที่ใส่เข้ามาด้วยชื่อaction

        String name = req.getParameter("name");
        String email = req.getParameter("email");

        if (action.equalsIgnoreCase("addCustomer")) {  //equalsIgnoreCase เอาไว้ตรวจสอบแบบไม่สนใจตัวเล็ก-ใหญ่ เช็คค่าที่ถูกใส่เข้ามาถ้าตรงสิ่งที่เราต้องการเราจะทำอะไรต่อ
            users.add(new User(name,email)); //ทำการเพิ่มหรือสร้างobject ใหม่ขึ้นมาและค่าด้านในเป็นตัวแปรที่เราเพิ่งรับค่าเข้ามาใหม่
        }
        getServletContext().setAttribute("users",users); //เอาobjectลงไปบันทึกค่าไว้ใน "users"
        getServletContext().getRequestDispatcher("/prime.jsp").forward(req,resp); //ส่งค่าไปที่prime.jsp
    }
}
