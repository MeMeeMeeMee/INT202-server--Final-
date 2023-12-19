package sit.int202.classicmodeltue.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebFilter ถูกใช้เพื่อประกาศ AuthenticationFilter ว่าเป็นตัวกรองที่ควรถูกนำไปใช้กับ servlet ที่มีชื่อ "AddToCartServlet" และ "ViewCartServlet" เท่านั้น
@WebFilter(filterName = "AuthenticationFilter", servletNames = {"AddToCartServlet", "ViewCartServlet"})
public class AuthenticationFilter implements Filter {
    private FilterConfig filterConfig;

    public void init(FilterConfig config) throws ServletException {
        this.filterConfig = config;
    }

    @Override
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        //โค้ดนี้แปลง ServletRequest เป็น HttpServletRequest เพื่อให้เราสามารถใช้เมทอดและคุณสมบัติที่เกี่ยวข้องกับ HTTP ได้ โดยเฉพาะการเข้าถึงข้อมูลที่ถูกส่งมากับคำขอ HTTP เช่น headers, parameters, และ methods
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        //โค้ดนี้ใช้เรียกเมทอด getSession ของ HttpServletRequest เพื่อดึง HttpSession ที่เกี่ยวข้องกับคำขอนี้
        // การใส่ false เป็นพารามิเตอร์จะทำให้เมทอดนี้ไม่สร้าง HttpSession ใหม่หากยังไม่มี HttpSession ที่เกี่ยวข้องกับคำขอนี้อยู่ แต่จะคืนค่า null ถ้าไม่มี HttpSession ที่เกี่ยวข้อง
        // ดึง HttpSession ที่เกี่ยวข้องกับคำขอนี้ (ถ้ามี)
        HttpSession session = httpServletRequest.getSession(false);

        // ทำตรวจสอบสถานะการเข้าสู่ระบบของผู้ใช้
        if (session == null || session.getAttribute("user") == null) {
            // ถ้าไม่ได้เข้าสู่ระบบ ส่งคำตอบ HTTP ที่ไม่ได้รับอนุญาต (HTTP Status 401: Unauthorized)
            ((HttpServletResponse) response).addHeader("error", "Please login first !!!");
            ((HttpServletResponse) response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
        } else {
            // ถ้าเข้าสู่ระบบแล้ว ส่งคำขอไปยังตัวกรองหรือเซิร์ฟเล็ตถัดไปในเชน
            chain.doFilter(request, response);
        }
    }
}
