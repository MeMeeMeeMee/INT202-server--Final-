package dev.bestzige.simplerbacjavaservlet.servlets;

import com.mysql.cj.util.StringUtils;
import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.repositories.UserRepository;
import dev.bestzige.simplerbacjavaservlet.utils.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagerServlet", value = "/admin/users")
public class UserManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // ดึงข้อมูลจากพารามิเตอร์หรือให้ค่าเริ่มต้น
        int page = StringUtils.isNullOrEmpty(req.getParameter("page")) ? 1 : Integer.parseInt(req.getParameter("page"));
        int limit = StringUtils.isNullOrEmpty(req.getParameter("limit")) ? 10 : Integer.parseInt(req.getParameter("limit"));
        String search = StringUtils.isNullOrEmpty(req.getParameter("search")) ? null : req.getParameter("search");
        int userId = StringUtils.isNullOrEmpty(req.getParameter("id")) ? 0 : Integer.parseInt(req.getParameter("id"));

        UserRepository userRepository = new UserRepository(); // สร้างอ็อบเจ็กต์ UserRepository
        if (userId != 0) {
            // ถ้าระบุ userId, ให้ดึงข้อมูลผู้ใช้ด้วย userId
            User user = userRepository.findById(userId);

            if (user != null) { //การตรวจสอบว่าตัวแปร user ไม่ได้เป็น null หลังจากการดึงข้อมูลผู้ใช้ด้วย findById จาก UserRepository. ในกรณีที่ user ไม่ได้เป็น null
                req.setAttribute("user", user); // นี้หมายความว่าคุณกำลังเตรียมข้อมูลผู้ใช้ (user) เพื่อนำไปใช้ในหน้า JSP ที่ถูก forward ไป.
            }

            req.getRequestDispatcher("/user/user-form.jsp").forward(req, resp); // forward ไปที่หน้าแก้ไขข้อมูลผู้ใช้
        }

        List<User> users = userRepository.findAll(page, limit, search); //ดึงข้อมูลผู้ใช้จาก UserRepository โดยใช้เมธอด findAll โดยกำหนดพารามิเตอร์
        int totalUsers = userRepository.countAll(search); //นับจำนวนผู้ใช้ทั้งหมดที่ตรงกับเงื่อนไขการค้นหาที่กำหนดในตัวแปร search.
        int totalPages = (int) Math.ceil((double) totalUsers / limit); //การคำนวณจำนวนหน้าทั้งหมดที่ต้องการในการแสดงผู้ใช้

        //กำหนดค่า attributes ใน request เพื่อนำไปใช้ในหน้า JSP ที่จะแสดงรายการผู้ใช้
        req.setAttribute("page", page);
        req.setAttribute("limit", limit);
        req.setAttribute("search", search);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("users", users);

        req.getRequestDispatcher("/user/user-list.jsp").forward(req, resp); //การทำการเปลี่ยนเส้นทางการทำงานของ Servlet โดยการ forward (ส่งต่อ) คำขอไปยังหน้า JSP ที่มีชื่อว่า "user-list.jsp"
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //การดึงค่าพารามิเตอร์ "action" จากคำขอ (request) ที่ส่งมายัง Servlet. โดยใช้ req.getParameter("action") เพื่อดึงค่าที่ถูกส่งมากับคำขอ.
        String action = StringUtils.isNullOrEmpty(req.getParameter("action")) ? null : req.getParameter("action");

        if(action.equals("search")) { //โค้ดที่อยู่ภายในบล็อก if(action.equals("search")) จะถูกทำงานในกรณีที่ค่าของ action มีค่าเท่ากับ "search".
            //กำหนดค่า page, limit, และ search จากพารามิเตอร์ที่ถูกส่งมาในคำขอ (request).
            int page = StringUtils.isNullOrEmpty(req.getParameter("page")) ? 1 : Integer.parseInt(req.getParameter("page"));
            int limit = StringUtils.isNullOrEmpty(req.getParameter("limit")) ? 10 : Integer.parseInt(req.getParameter("limit"));
            String search = StringUtils.isNullOrEmpty(req.getParameter("search")) ? "" : req.getParameter("search");

            //เพื่อส่ง redirect คำขอไปยัง URL ใหม่ที่มีรูปแบบเป็น "/admin/users?page=...&limit=...&search=..." ซึ่งสร้าง URL ที่ใช้ในการค้นหาผู้ใช้.
            resp.sendRedirect(getServletContext().getContextPath() + "/admin/users?page=" + page + "&limit=" + limit + "&search=" + search);
            return; //ใช้เพื่อจบการทำงานของ Servlet ในบล็อกนี้.
        }

        if (action.equals("delete")) { //จะถูกทำงานในกรณีที่ค่าของ action มีค่าเท่ากับ "delete".
            //ดึงค่า id จากพารามิเตอร์ที่ถูกส่งมาในคำขอ (request).
            int userId = StringUtils.isNullOrEmpty(req.getParameter("id")) ? 0 : Integer.parseInt(req.getParameter("id"));

            if (userId != 0) { //ตรวจสอบว่าค่าของ id ไม่ใช่ null และไม่เป็นสตริงว่าง (empty). ถ้าเป็นเช่นนั้นจะทำการแปลงค่า id เป็นตัวเลข.
                //หาก userId ไม่เท่ากับ 0 ให้สร้าง UserRepository และใช้ findById เพื่อหา User จาก userId.
                UserRepository userRepository = new UserRepository();
                User user = userRepository.findById(userId);

                if (user == null) {  //ถูกใช้เพื่อตรวจสอบว่า user มีค่าเป็น null หรือไม่ ซึ่งในที่นี้หมายถึงการตรวจสอบว่าพบผู้ใช้ (user) ที่มี id ที่ถูกส่งมาในคำขอหรือไม่
                    //ถ้า user เป็น null แสดงว่าไม่พบผู้ใช้ที่ตรงกับ id ที่ระบุในคำขอ.
                    doGet(req, resp);
                    return;
                }
                userRepository.remove(user); //ถ้า user ไม่เท่ากับ null ให้ทำการลบผู้ใช้ (user) โดยใช้ remove จาก UserRepository.
            }
        }

        if (action.equals("update")) { //จะถูกทำงานในกรณีที่ค่าของ action มีค่าเท่ากับ "update".
            //ดึงค่า id จากพารามิเตอร์ของคำขอ (request) และใช้ Integer.parseInt เพื่อแปลงค่า id จากสตริงเป็นตัวเลข. ถ้า id ไม่ได้รับค่าหรือเป็นสตริงว่าง, ให้ userId มีค่าเป็น 0.
            int userId = StringUtils.isNullOrEmpty(req.getParameter("id")) ? 0 : Integer.parseInt(req.getParameter("id"));

            //ดึงค่า username จากพารามิเตอร์ของคำขอ (request) และตรวจสอบว่า username ไม่เป็น null และไม่เป็นสตริงว่าง. ถ้า username เป็น null หรือสตริงว่าง, ให้ username มีค่าเป็นสตริงว่าง.
            String username = StringUtils.isNullOrEmpty(req.getParameter("username")) ? "" : req.getParameter("username");

            // ดึงค่า role จากพารามิเตอร์ของคำขอ (request) และตรวจสอบว่า role ไม่เป็น null และไม่เป็นสตริงว่าง. ถ้า role เป็น null หรือสตริงว่าง, ให้ role มีค่าเป็น "USER".
            String role = StringUtils.isNullOrEmpty(req.getParameter("role")) ? "USER" : req.getParameter("role");

            if (userId != 0) {  //ใช้เพื่อตรวจสอบว่าค่าของ userId ไม่เท่ากับ 0 หาก userId มีค่าไม่เท่ากับ 0 แสดงว่ามี id
                UserRepository userRepository = new UserRepository(); // เป็นคลาสหรืออ็อบเจ็กต์ที่ใช้สำหรับจัดการข้อมูลของผู้ใช้ (User). อาจจะเป็นคลาสที่ให้บริการดึงข้อมูลผู้ใช้จากฐานข้อมูลหรือแหล่งข้อมูลอื่น ๆ.

                User user = userRepository.findById(userId); // เรียกเมทอด findById ของ UserRepository เพื่อค้นหาผู้ใช้โดยใช้ userId ที่ระบุ. นั่นหมายความว่าจะดึงข้อมูลผู้ใช้จากแหล่งข้อมูล (เช่นฐานข้อมูล) ที่มี id ตรงกับ userId ที่ระบุ.
                // User user เก็บผลลัพธ์ของการค้นหาผู้ใช้. หลังจากที่เรียกเมทอด findById, user จะถูกกำหนดค่าเป็นผู้ใช้ที่ถูกค้นหา หรือ null หากไม่พบผู้ใช้ที่มี id ตรงกับ userId.

                if (user == null) { //ใช้เพื่อตรวจสอบว่าตัวแปร user มีค่าเป็น null หรือไม่. ถ้า user เป็น null หมายความว่าไม่พบผู้ใช้ที่มี id ตรงกับ userId
                    doGet(req, resp);
                    return;
                }

                if(!StringUtils.isNullOrEmpty(req.getParameter("password"))) { //ใช้เพื่อตรวจสอบว่าค่าที่รับมาจากพารามิเตอร์ "password" ในคำขอไม่ใช่ค่าว่างหรือ null. หากไม่ใช่ค่าว่างหรือ null
                    //เรียกใช้เมทอด hashPassword ที่อาจจะถูกนิยามในคลาส PasswordUtils เพื่อทำการแปลงรหัสผ่านเป็นรหัสผ่านที่ถูกแฮช (hashed password). รหัสผ่านที่แฮชมักจะถูกใช้เพื่อเพิ่มความปลอดภัยในการเก็บข้อมูลรหัสผ่าน.
                    String hashedPassword = PasswordUtils.hashPassword(req.getParameter("password"));

                    //กำหนดค่ารหัสผ่านที่ถูกแฮชให้กับผู้ใช้ (object user). น่าจะเป็นการบันทึกหรืออัปเดตรหัสผ่านในฐานข้อมูล.
                    user.setPassword(hashedPassword);
                }

                user.setUsername(username); //กำหนดค่าชื่อผู้ใช้ให้กับ user.
                user.setRole(role); //กำหนดค่าบทบาท (role) ให้กับ user.
                userRepository.update(user); // เรียกใช้เมทอด update ของ userRepository เพื่อทำการอัปเดตข้อมูลของผู้ใช้ในฐานข้อมูล.
            }
        }

        resp.sendRedirect(getServletContext().getContextPath() + "/admin/users"); // จะทำการเปลี่ยนเส้นทางของการเรียกใช้เว็บไซต์ (redirect) ไปยัง URL /admin/users.
    }
}
