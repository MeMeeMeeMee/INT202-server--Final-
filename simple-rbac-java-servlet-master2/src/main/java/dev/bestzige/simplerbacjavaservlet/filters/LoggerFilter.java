package dev.bestzige.simplerbacjavaservlet.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

//คำอธิบายนี้ใช้ Annotation @WebFilter เพื่อระบุว่านี้คือ Filter ที่ชื่อ "loggerFilter" และถูกใช้กับทุก URL ด้วย urlPatterns = {"/*"}.
@WebFilter(filterName = "loggerFilter", urlPatterns = {"/*"})

// คลาสนี้ได้ implement อินเทอร์เฟซ Filter ซึ่งต้องมีเมธอด init, doFilter, และ destroy เพื่อทำงานเป็นตัวกรอง.
public class LoggerFilter implements Filter {
    private FilterConfig filterConfig; //เก็บค่า FilterConfig ซึ่งจะถูกใช้ใน init method.

    @Override
    public void init(FilterConfig filterConfig) { //เมธอดนี้ถูกเรียกในขั้นตอนการเริ่มต้น Filter และใช้เพื่อกำหนดค่าในตัวแปร filterConfig.
        this.filterConfig = filterConfig;
    }

    //เมธอดนี้เป็นที่สำคัญและถูกเรียกเมื่อมี request ผ่าน Filter. ในที่นี้, มีการบันทึกเวลาที่เริ่มต้นการประมวลผล,
    //ผ่าน FilterChain เพื่อให้ request ทำงานต่อไปใน chain ของ Filter และ Servlets, และหลังจากนั้นบันทึกเวลาสิ้นสุดและสร้างข้อความ log เกี่ยวกับ request ที่ผ่าน.
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        long startTime = System.currentTimeMillis(); //ก่อนที่ request จะผ่านไปยัง Filter ต่อไปใน chain (filterChain.doFilter), เวลาเริ่มต้นถูกบันทึก.

        filterChain.doFilter(servletRequest, servletResponse); // คำสั่งนี้ทำให้ request ผ่านต่อไปใน chain ของ Filter และ Servlets.

        long endTime = System.currentTimeMillis(); //เมื่อ request ผ่านไปทั้งหมดและกลับมาที่ Filter, เวลาสิ้นสุดถูกบันทึก.

        //ดึงข้อมูลเกี่ยวกับ request: ในขั้นตอนนี้, ข้อมูลเกี่ยวกับ request ที่ถูกดึงมามี URL ที่เข้าถึงและเมธอด HTTP (GET, POST, ฯลฯ).
        String pathInfo = ((HttpServletRequest) servletRequest).getRequestURI();
        String httpMethod = ((HttpServletRequest) servletRequest).getMethod();

        //สร้างข้อความ log: ข้อความ log ถูกสร้างโดยใช้ข้อมูลที่ดึงมา, เวลาที่ใช้ในการประมวลผล request ถูกคำนวณโดยการลบเวลาเริ่มต้นจากเวลาสิ้นสุด.
        String message = String.format("Request to %s with method %s took %d ms", pathInfo, httpMethod, endTime - startTime);

        //บันทึกข้อความ log ไปยัง ServletContext: ข้อความ log นี้ถูกส่งไปยัง ServletContext เพื่อทำการบันทึก.
        // นั่นหมายถึงข้อมูล log นี้จะถูกเก็บไว้ในเครื่องตรงนั้น ๆ หรือถูกส่งไปยังที่ตั้งของ Servlet Container (เช่น Tomcat) ซึ่งสามารถให้ข้อมูล log นี้ในรูปแบบที่ตั้งค่าไว้ (logs files, console, ฯลฯ).
        filterConfig.getServletContext().log(message);
    }
}