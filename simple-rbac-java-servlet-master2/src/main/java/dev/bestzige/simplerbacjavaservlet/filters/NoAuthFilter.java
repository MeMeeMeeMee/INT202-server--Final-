package dev.bestzige.simplerbacjavaservlet.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//เป็น Filter ในแอปพลิเคชัน Java Servlet ที่ใช้สำหรับการตรวจสอบการตรวจสอบสิทธิ์ผู้ใช้เมื่อพยายามเข้าถึง URL ที่ตรงกับ "/auth/login" หรือ "/auth/register".
@WebFilter(filterName = "noAuthFilter", urlPatterns = {"/auth/login", "/auth/register"})
public class NoAuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //HttpServletRequest และ HttpSession: ใช้ HttpServletRequest เพื่อดึงข้อมูลเกี่ยวกับ request และ HttpSession เพื่อตรวจสอบ session ของผู้ใช้.
        HttpServletRequest httpRequest = ((HttpServletRequest) servletRequest);
        HttpSession session = httpRequest.getSession(false);

        //ตรวจสอบ session และ attribute "user": ตรวจสอบว่า session ไม่เป็น null และมี attribute "user" ใน session ไม่เป็น null.
        if (session != null && session.getAttribute("user") != null) {
            //Redirect ไปที่หน้าหลัก: หากมี session และ attribute "user" ใน session ให้ทำการ redirect ผู้ใช้ไปที่หน้าหลักของแอปพลิเคชัน.
            HttpServletResponse response = ((HttpServletResponse) servletResponse);
            response.sendRedirect(httpRequest.getContextPath() + "/");
        } else {
            //FilterChain.doFilter: หากไม่มี session หรือไม่มี attribute "user" ใน session ให้ผ่าน Filter ต่อไปใน chain ของ Filter และ Servlets.
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}