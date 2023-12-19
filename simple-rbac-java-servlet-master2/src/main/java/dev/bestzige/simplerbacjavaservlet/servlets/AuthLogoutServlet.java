package dev.bestzige.simplerbacjavaservlet.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AuthLogoutServlet", value = "/auth/logout")
public class AuthLogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); //ใช้เพื่อดึง session ที่เกี่ยวข้องกับ HTTP request นี้ แต่ถ้า session ไม่มีอยู่จริง (null), จะไม่สร้าง session ใหม่ และจะไม่ให้เกิด session fixation attack.

        if(session != null) {
            session.invalidate(); //ใช้เพื่อทำการลงทะเบียน (invalidate) session, ทำให้ session นั้นไม่สามารถใช้งานได้ต่อไป.
        }

        // ใช้เพื่อส่งข้อความ HTTP redirect ไปยัง URL หลักของเว็บแอปพลิเคชัน (/). เมื่อ session ถูกลงทะเบียน, ผู้ใช้จะถูกนำไปยังหน้าหลักของเว็บแอปพลิเคชัน.
        resp.sendRedirect(getServletContext().getContextPath() + "/");
    }
}
