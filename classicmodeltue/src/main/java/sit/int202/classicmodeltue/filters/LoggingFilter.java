package sit.int202.classicmodeltue.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

//ใช้ประกาศ LoggingFilter ให้เป็นตัวกรองที่ชื่อ "LoggingFilter" และระบุว่าควรใช้กับทุก URL pattern ("/*").
@WebFilter(filterName = "LoggingFilter", urlPatterns = "/*")
public class LoggingFilter implements Filter {
    private FilterConfig config;

    //init(FilterConfig config) Method: เมธอดนี้เป็นส่วนหนึ่งของอินเตอร์เฟซ Filter และถูกเรียกเมื่อตัวกรองถูกเริ่มต้นขึ้น มันทำการกำหนดค่าตัวแปร config ด้วย FilterConfig ที่ได้รับ.
    public void init(FilterConfig config) throws ServletException {
        this.config = config;
    }
    @Override
    //เมธอดนี้คือตรรกะหลักของตัวกรอง มันถูกเรียกสำหรับแต่ละคำขอและการตอบสนองที่ผ่านไปในเชนของตัวกรอง.
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        //บันทึกเวลาปัจจุบันก่อนที่จะเรียกทรัพยากร (เซิร์ฟเล็ตหรือ JSP).
        long before = System.currentTimeMillis();

        //before invoke resources
        //เรียกทรัพยากรถัดไปในเชนหรือเซิร์ฟเล็ตหากนี้คือตัวกรองสุดท้าย. บรรทัดนี้เป็นสำคัญเนื่องจากมันอนุญาตให้คำขอไปที่ขั้นตอนถัดไปในเชนการประมวลผล.
        chain.doFilter(request, response);

        //after invoke resources
        //คำนวณเวลาที่ใช้ในการประมวลผลทรัพยากร.
        long duration = System.currentTimeMillis() - before;

        // ดึง URI ของทรัพยากรที่ร้องขอ.
        String uri = ((HttpServletRequest) request).getRequestURI();

        //uri.substring(uri.lastIndexOf('/')): นำ URI และดึงส่วนสุดท้ายของ URI ซึ่งสามารถแทนที่ด้วยชื่อทรัพยากรที่ถูกเรียกใช้.
        //", execution time: " + duration + " milliseconds": เพิ่มข้อมูลเวลาที่ใช้ในการประมวลผล.
        //config.getServletContext().log(msg): ใช้ getServletContext().log() เพื่อบันทึกข้อความไปยังบันทึกของ servlet context. นี่เป็นวิธีที่สะดวกในการทำ logging ในเซิร์ฟเล็ต.

        String msg = "Resource: " + uri.substring(uri.lastIndexOf('/')) +
                ", execution time: "+ duration+ " milliSeconds";
        config.getServletContext().log(msg);
    }
    public void destroy() {
    }
}