package dev.bestzige.simplerbacjavaservlet.servlets;

import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.repositories.AuthRepository;
import dev.bestzige.simplerbacjavaservlet.utils.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AuthLoginServlet", value = "/auth/login")
public class AuthLoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
    }
    //doGet คือเมธอดที่ถูกเรียกเมื่อมี HTTP GET request ถูกทำการส่งมายัง Servlet นี้.
    //req.getRequestDispatcher("/auth/login.jsp"): ใช้เพื่อดึง RequestDispatcher ที่เชื่อมโยงกับ JSP ที่ต้องการแสดงผล (ในที่นี้คือ "login.jsp").
    //.forward(req, resp): ทำการส่งต่อ Request และ Response ไปยัง JSP ที่ได้รับจาก RequestDispatcher.
    //จากนั้น JSP จะถูกประมวลผลและส่ง HTML กลับไปยัง Client เพื่อแสดงผล.


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username"); // ใช้เพื่อดึงค่า parameter ที่ชื่อ "username" ที่ถูกส่งมาใน HTTP request. ค่านี้จะถูกเก็บไว้ในตัวแปร username.
        String password = req.getParameter("password"); // req.getParameter("password"): ใช้เพื่อดึงค่า parameter ที่ชื่อ "password" ที่ถูกส่งมาใน HTTP request. ค่านี้จะถูกเก็บไว้ในตัวแปร password.

        if (StringUtils.isNullOrEmpty(username) && StringUtils.isNullOrEmpty(password)) {
            req.setAttribute("error", "Username and password cannot be empty");
            doGet(req, resp);
            // โค้ดนี้ใช้ setAttribute เพื่อกำหนดค่า attribute ใน HttpServletRequest, ซึ่งจะถูกใช้ในหน้า JSP หรือส่วนอื่น ๆ ของโค้ด Servlet ต่อไป.
            return;
        }
        // ได้แสดงการใช้ StringUtils.isNullOrEmpty เพื่อตรวจสอบว่า username และ password
        // มีค่าเป็น null หรือว่าเป็นสตริงที่ว่างเปล่าหรือไม่. ในกรณีที่ทั้ง username และ password
        // ไม่ได้รับค่าหรือเป็นสตริงที่ว่างเปล่าทั้งคู่, โค้ดจะทำการตั้งค่า attribute "error" ใน HttpServletRequest
        // เพื่อส่งข้อความข้อผิดพลาดไปยังหน้า JSP และจะเรียกเมธอด doGet เพื่อแสดงหน้า login พร้อมกับข้อความข้อผิดพลาดที่ถูกตั้งค่าไว้.



        AuthRepository authRepository = new AuthRepository(); //สร้างอ็อบเจ็กต์ของ AuthRepository ด้วยการเรียกใช้คอนสตรักเตอร์ (constructor) ของ AuthRepository.
        User user = authRepository.login(username, password); //เรียกใช้เมธอด login ของ AuthRepository และส่ง username และ password เพื่อทำการตรวจสอบการเข้าสู่ระบบ.

        if (user == null) {
            // ในกรณีที่ user มีค่าเป็น null, ถือว่าการเข้าสู่ระบบไม่ถูกต้อง จึงทำการตั้งค่า attribute "error" ใน HttpServletRequest เพื่อส่งข้อความข้อผิดพลาดไปยังหน้า JSP หรือส่วนต่าง ๆ ของโค้ด Servlet ที่เรียกใช้.
            req.setAttribute("error", "Invalid username or password");
        } else {
            //ในทางกลับกัน, ถ้า user ไม่เป็น null, แสดงว่าการเข้าสู่ระบบถูกต้อง จึงทำการสร้างหรือดึง HttpSession และทำการเก็บข้อมูลผู้ใช้ (user)
            // ไว้ใน session ด้วย session.setAttribute("user", user) เพื่อให้สามารถใช้ข้อมูลผู้ใช้ในระหว่าง session ที่ผู้ใช้ยังคงอยู่ในระบบ.
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
        }

        //โค้ดนี้ทำงานเมื่อมีการเข้าสู่ระบบที่ถูกต้องและเมื่อบันทึกข้อมูลผู้ใช้ลงใน session แล้ว จะทำการเปลี่ยนทิศทางการเรียกใช้งานไปยังหน้าหลักของเว็บแอปพลิเคชัน.
        resp.sendRedirect(getServletContext().getContextPath() + "/");
    }
}
