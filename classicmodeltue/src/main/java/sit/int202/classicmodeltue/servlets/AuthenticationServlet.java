package sit.int202.classicmodeltue.servlets;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodeltue.entities.Customer;
import sit.int202.classicmodeltue.repositories.CustomerRepository;

import java.io.IOException;

@WebServlet(name = "AuthenticationServlet", value = "/login")
public class AuthenticationServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        doPost(request, response);
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //การรับข้อมูล: ข้อมูลถูกรับมาจาก request parameters ดังนี้
        String password = request.getParameter("password"); //ชื่อผู้ใช้ที่ระบุในฟอร์ม.
        String userName = request.getParameter("userName"); //รหัสผ่านที่ระบุในฟอร์ม.

        //ตรวจสอบ userName: ในที่นี้, มีการตรวจสอบว่า userName ไม่เป็น null และมีความยาวมากกว่า 0 หากไม่ผ่านเงื่อนไขนี้,
        // จะถือว่ามีข้อผิดพลาดและทำการส่ง HTTP response กลับไปพร้อมกับข้อความผิดพลาด.

        //userName == null: ตรวจสอบว่า userName เป็น null หรือไม่.
        //userName.trim().length() == 0: ตรวจสอบว่า userName หลังจากที่ตัดช่องว่างที่อยู่ด้านหน้าและด้านหลังทิ้งไป, มีความยาวเท่ากับ 0 หรือไม่.
        if (userName == null || userName.trim().length() == 0) {
            //การส่ง HTTP response และรหัสสถานะ: ถ้ามีข้อผิดพลาด, จะทำการเพิ่มข้อความผิดพลาดลงใน header ของ response และส่งรหัสสถานะ HTTP ที่ระบุ (ในที่นี้คือ HttpServletResponse.SC_BAD_REQUEST).
            response.addHeader("error", "Invalid user name !!!"); //เพิ่มข้อความ "Invalid user name !!!" ลงใน header ของ response.
            response.sendError(HttpServletResponse.SC_BAD_REQUEST); //ส่ง response กลับไปพร้อมกับรหัสสถานะ HTTP 400 Bad Request.
            return;
        }

        //ค้นหาข้อมูลผู้ใช้ (User): ใช้ customerRepository.findByName(userName) เพื่อค้นหาข้อมูลผู้ใช้จากชื่อผู้ใช้ที่ได้รับมา.
        CustomerRepository customerRepository = new CustomerRepository(); //ป็นคลาสที่ใช้เพื่อทำการ query ข้อมูลจากฐานข้อมูลเกี่ยวกับ Customer.
        Customer customer = customerRepository.findByName(userName); //เป็นเมธอดที่ใช้ค้นหา Customer จากฐานข้อมูลโดยใช้ชื่อผู้ใช้ (userName).

        //ตรวจสอบว่าผู้ใช้มีอยู่หรือไม่: ถ้า customer เป็น null แสดงว่าไม่พบข้อมูลผู้ใช้ที่มีชื่อตรงกับ userName. ในกรณีนี้, จะทำการเพิ่มข้อความผิดพลาดลงใน header ของ response และส่งรหัสสถานะ HTTP 403 Forbidden.
        if (customer == null) {
            response.addHeader("error", "User '"+ userName+ "' does not exist !!!"); // เพิ่มข้อความ "User '...username...' does not exist !!!" ลงใน header ของ response.
            response.sendError(HttpServletResponse.SC_FORBIDDEN); // ส่ง response กลับไปพร้อมกับรหัสสถานะ HTTP 403 Forbidden.
        } else {
            //ตรวจสอบรหัสผ่าน: ถ้าพบข้อมูลผู้ใช้, จะทำการตรวจสอบรหัสผ่านโดยใช้ Argon2. ถ้ารหัสผ่านถูกต้อง, จะทำการเก็บข้อมูลผู้ใช้ใน session.
            //ใช้เพื่อตรวจสอบว่ารหัสผ่านที่ให้มาตรงกับรหัสผ่านที่ถูกเก็บไว้ในฐานข้อมูลหรือไม่. ถ้าตรงกัน, isOk จะเป็น true, ถ้าไม่ตรง, isOk จะเป็น false.
            Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2d, 16, 16); //สร้างอ็อบเจ็กต์ Argon2 ด้วยการใช้งาน Argon2d และกำหนดพารามิเตอร์ให้กับคูณ (lanes) และเวลาการทำงาน (iterations).
            char[] passwordArray = password.toCharArray(); //แปลงรหัสผ่านจาก String เป็น char array.
            System.out.println("-------------------------");
            System.out.println(customer.getPassword()); //แสดงผลลัพธ์รหัสผ่านที่ถูกเก็บไว้ในฐานข้อมูล.
            System.out.println(password); //แสดงผลลัพธ์รหัสผ่านที่ได้รับมาจาก request.

            boolean isOk = argon2.verify(customer.getPassword(), passwordArray); //: ทำการตรวจสอบว่ารหัสผ่านที่ได้รับมาตรงกับรหัสผ่านที่เก็บไว้ของผู้ใช้หรือไม่.

            //จัดการกับผลลัพธ์: ตามผลลัพธ์ที่ได้จากการตรวจสอบรหัสผ่าน, จะมีการจัดการต่าง ๆ ทั้งส่งรหัสสถานะ HTTP และเพิ่มข้อความผิดพลาดใน header ของ response.
            if (!isOk) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED); // ส่ง response กลับไปพร้อมกับรหัสสถานะ HTTP 401 Unauthorized.
                response.addHeader("error", "Incorrect password !!!"); //เพิ่มข้อความ "Incorrect password !!!" ล
            } else {
                request.getSession().setAttribute("user", customer); //ถ้ารหัสผ่านถูกต้อง (isOk เป็น true), ระบบจะเก็บข้อมูลผู้ใช้ลงใน session:
            }
        }
    }
}