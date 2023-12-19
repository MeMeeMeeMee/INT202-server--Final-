package dev.bestzige.simplerbacjavaservlet.filters;

import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.repositories.UserRepository;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//Annotation นี้ใช้เพื่อระบุว่าคลาสนี้คือ Filter ที่มีชื่อ "adminFilter" และจะถูกใช้กับ URL ที่ตรงกับ "/admin/*".
@WebFilter(filterName = "adminFilter", urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter { //คลาสนี้มีการ implement interface Filter ซึ่งจำเป็นต้องมีเมธอด doFilter เพื่อดำเนินการตรวจสอบและกระทำตามที่กำหนด.
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        // ดึงข้อมูล HttpServletRequest, HttpSession, และ HttpServletResponse
        HttpServletRequest httpRequest = ((HttpServletRequest) servletRequest);
        HttpSession session = httpRequest.getSession(false);
        HttpServletResponse response = ((HttpServletResponse) servletResponse);

        // ตรวจสอบว่า session ไม่เป็น null และมี attribute "user" ไม่เป็น null
        if (session == null || session.getAttribute("user") == null) {
            // หากไม่มี session หรือไม่มี attribute "user" ใน session ให้ redirect ไปที่หน้า login
            response.sendRedirect(httpRequest.getContextPath() + "/auth/login");
        } else {
            // ดึงข้อมูลผู้ใช้จากฐานข้อมูลโดยใช้ UserRepository
            UserRepository userRepository = new UserRepository();
            User userSession = (User) session.getAttribute("user");
            User user = userRepository.findById(userSession.getId());

            // ตรวจสอบสิทธิ์ของผู้ใช้
            if (user.getRole().equals("ADMIN")) {
                // ถ้าผู้ใช้มีสิทธิ์ "ADMIN" ให้ผ่าน Filter ไปยัง servlet ถัดไป
                filterChain.doFilter(servletRequest, servletResponse);
            } else { // ถ้าผู้ใช้ไม่มีสิทธิ์ "ADMIN" ให้ redirect ไปที่หน้า "/no-permission"
                response.sendRedirect(httpRequest.getContextPath() + "/no-permission");
            }
        }
    }
}