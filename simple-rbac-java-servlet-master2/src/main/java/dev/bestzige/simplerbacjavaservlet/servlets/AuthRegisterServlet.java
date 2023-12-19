package dev.bestzige.simplerbacjavaservlet.servlets;

import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.repositories.AuthRepository;
import dev.bestzige.simplerbacjavaservlet.repositories.UserRepository;
import dev.bestzige.simplerbacjavaservlet.utils.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AuthRegisterServlet", value = "/auth/register")
public class AuthRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // ใช้เพื่อดึง RequestDispatcher ที่เกี่ยวข้องกับ URL "/auth/register.jsp".
        req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username"); //ใช้เพื่อดึงค่าของ parameter ที่มีชื่อ "username" จาก HTTP request.
        String password = req.getParameter("password"); //ใช้เพื่อดึงค่าของ parameter ที่มีชื่อ "password" จาก HTTP request.

        // ถ้าค่าของ "role" ที่ได้มาจาก parameter นี้เป็น null หรือว่างเปล่า, จะกำหนดค่า role เป็น "USER", ถ้าไม่ใช่ จะใช้ค่าที่ได้มาจาก parameter นั้นๆ.
        String role = StringUtils.isNullOrEmpty(req.getParameter("role")) ? "USER" : req.getParameter("role");


        if (StringUtils.isNullOrEmpty(username) && StringUtils.isNullOrEmpty(password)) { //ใช้เพื่อตรวจสอบว่า username,password เป็น null หรือเป็นสตริงที่ว่างเปล่าหรือไม่.
            //ถ้ามีการตรวจสอบแล้วพบว่า username และ password มีค่าว่างเปล่า, จะตั้งค่า attribute "error" ใน request object เพื่อเก็บข้อความข้อผิดพลาด.
            req.setAttribute("error", "Username and password cannot be empty");

            doGet(req, resp); //น่าจะเป็นการเรียกเมทอด doGet ซึ่งนั่นคือเมทอดที่ได้มาจาก HttpServlet และมีลักษณะการประมวลผล request แบบ GET. ในที่นี้, ถูกเรียกเพื่อแสดงหน้าเว็บที่เกี่ยวข้องกับข้อผิดพลาด.
            return;  //ใช้เพื่อจบการทำงานของเมทอด, ไม่ให้โค้ดด้านล่างทำงานต่อ.
        }


        if(!role.equals("ADMIN") && !role.equals("USER")) { //ใช้เพื่อตรวจสอบว่าค่าของ role ไม่เท่ากับ "ADMIN", ใช้เพื่อตรวจสอบว่าค่าของ role ไม่เท่ากับ "USER".
//          //ถ้ามีการตรวจสอบแล้วพบว่า role ไม่เท่ากับ "ADMIN" และไม่เท่ากับ "USER", จะตั้งค่า attribute "error" ใน request object เพื่อเก็บข้อความข้อผิดพลาด.
            req.setAttribute("error", "Invalid role");

            doGet(req, resp); //น่าจะเป็นการเรียกเมทอด doGet ซึ่งนั่นคือเมทอดที่ได้มาจาก HttpServlet และมีลักษณะการประมวลผล request แบบ GET. ในที่นี้, ถูกเรียกเพื่อแสดงหน้าเว็บที่เกี่ยวข้องกับข้อผิดพลาด.
            return; //ใช้เพื่อจบการทำงานของเมทอด, ไม่ให้โค้ดด้านล่างทำงานต่อ.
        }


        UserRepository userRepository = new UserRepository(); // สร้างอ็อบเจ็กต์ของ UserRepository. นี่อาจจะเป็นคลาสที่คุณได้สร้างขึ้นเพื่อจัดการกับข้อมูลผู้ใช้ในฐานข้อมูล.

        //เรียกใช้เมทอด findByUsername ของ UserRepository เพื่อค้นหาผู้ใช้ด้วย username ที่ได้รับมาจาก HTTP request parameter. findByUsername
        // น่าจะเป็นเมทอดที่คุณได้สร้างขึ้นใน UserRepository เพื่อทำการ query ข้อมูลผู้ใช้จากฐานข้อมูล.
        User user = userRepository.findByUsername(username);

        if (user != null) {  //ใช้เพื่อตรวจสอบว่าตัวแปร user ที่ได้มาจากการค้นหาในฐานข้อมูลไม่เท่ากับ null, ซึ่งหมายความว่ามีผู้ใช้ที่มี username นี้แล้วในระบบ.
            req.setAttribute("error", "Username already exists"); //ถ้ามีผู้ใช้ที่มี username นี้แล้ว, จะตั้งค่า attribute "error" ใน request object เพื่อเก็บข้อความข้อผิดพลาด.
            doGet(req, resp); //น่าจะเป็นการเรียกเมทอด doGet ซึ่งนั่นคือเมทอดที่ได้มาจาก HttpServlet และมีลักษณะการประมวลผล request แบบ GET. ในที่นี้, ถูกเรียกเพื่อแสดงหน้าเว็บที่เกี่ยวข้องกับข้อผิดพลาด.
            return; //ใช้เพื่อจบการทำงานของเมทอด, ไม่ให้โค้ดด้านล่างทำงานต่อ.
        }

        AuthRepository authRepository = new AuthRepository(); //สร้างอ็อบเจ็กต์ของ AuthRepository. นี่อาจจะเป็นคลาสที่คุณได้สร้างขึ้นเพื่อจัดการกับการทำงานที่เกี่ยวข้องกับการยืนยันตัวตน.
        User newUser = new User(); //สร้างอ็อบเจ็กต์ของ User ใหม่. น่าจะเป็นคลาสที่แสดงถึงข้อมูลผู้ใช้ในระบบของคุณ.
        newUser.setUsername(username); //กำหนดค่า username ให้กับ newUser จากค่าที่ได้รับจาก HTTP request parameter.
        newUser.setRole(role); //กำหนดค่า role ให้กับ newUser จากค่าที่ได้รับจาก HTTP request parameter.


        boolean success = authRepository.register(newUser, password);//เรียกใช้เมทอด register ของ AuthRepository โดยส่ง newUser (ข้อมูลผู้ใช้ใหม่) และ password (รหัสผ่าน) เพื่อทำการลงทะเบียนผู้ใช้ใหม่ในระบบ.

        if (!success) { //ในกรณีที่ success เป็น false (การลงทะเบียนไม่สำเร็จ), จะตั้งค่า attribute "error" ใน request object เพื่อเก็บข้อความข้อผิดพลาดที่เกี่ยวข้อง.
            req.setAttribute("error", "Failed to register"); //ถ้าการลงทะเบียนไม่สำเร็จ, จะตั้งค่า attribute "error" ใน request object เพื่อเก็บข้อความ "Failed to register".
        } else { //ในกรณีที่ success เป็น true (การลงทะเบียนสำเร็จ), จะทำการสร้าง session ใหม่และเก็บข้อมูลผู้ใช้ (newUser) ใน session.
            HttpSession session = req.getSession(); //สร้าง session ใหม่หากยังไม่มี session ที่มีอยู่.
            session.setAttribute("user", newUser); //เก็บข้อมูลผู้ใช้ (newUser) ใน session ซึ่งจะช่วยในการระบุตัวตนของผู้ใช้ในระบบต่อไป.
        }

        resp.sendRedirect(getServletContext().getContextPath() + "/"); //การใช้ resp.sendRedirect(...) จะทำให้เบราว์เซอร์ของผู้ใช้ถูกนำไปยัง URL ใหม่ที่ระบุ, ซึ่งจะแสดงหน้าหลักหรือหน้าที่กำหนดไว้ตามที่คุณต้องการ.
    }
}
