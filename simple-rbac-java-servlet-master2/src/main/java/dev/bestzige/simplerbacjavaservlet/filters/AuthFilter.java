package dev.bestzige.simplerbacjavaservlet.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//มีการทำงานเป็น Filter ที่ตรวจสอบการตรวจสอบสิทธิ์ของผู้ใช้เมื่อพยายามเข้าถึง URL ที่ตรงกับ "/profile" หรือ "/admin/*" และทำการเปลี่ยนเส้นทางตามเงื่อนไขที่กำหนดในรหัสคำสั่ง.
@WebFilter(filterName = "authFilter", urlPatterns = {"/profile", "/admin/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        // ดึงข้อมูล request และ session เพื่อให้สามารถตรวจสอบการตรวจสอบสิทธิ์ของผู้ใช้.
        HttpServletRequest httpRequest = ((HttpServletRequest) servletRequest);
        HttpSession session = httpRequest.getSession(false);

        //ตรวจสอบว่า session ไม่เป็น null และมี attribute "user" ใน session ไม่เป็น null.
        if (session == null || session.getAttribute("user") == null) {
            HttpServletResponse response = ((HttpServletResponse) servletResponse);

            // Redirect ไปที่หน้า login หากไม่มี session หรือไม่มี attribute "user" ใน session
            response.sendRedirect(httpRequest.getContextPath() + "/auth/login");
        } else { // ในกรณีที่ session และ attribute "user" มีค่าถูกต้อง, ให้ผ่าน Filter ไปยัง servlet ถัดไปใน chain ของ Filter.
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}