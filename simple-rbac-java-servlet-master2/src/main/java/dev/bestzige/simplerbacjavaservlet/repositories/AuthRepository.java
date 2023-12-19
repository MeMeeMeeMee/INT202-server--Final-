package dev.bestzige.simplerbacjavaservlet.repositories;

import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.utils.EntityManagerBuilder;
import dev.bestzige.simplerbacjavaservlet.utils.PasswordUtils;
import jakarta.persistence.EntityManager;

public class AuthRepository {
    private EntityManager entityManager; //เก็บอ็อบเจกต์ของ EntityManager ซึ่งใช้ในการจัดการการเชื่อมต่อกับฐานข้อมูล.

    // Method สำหรับดึง EntityManager
    private EntityManager getEntityManager() {
        // ถ้า EntityManager ยังไม่ถูกสร้างหรือปิดแล้ว
        if (entityManager == null || !entityManager.isOpen()) {
            // ให้สร้าง EntityManager ใหม่โดยใช้ EntityManagerBuilder
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        // คืนค่า EntityManager
        return entityManager;
    }

    public boolean register(User user, String password) {
        try {
            //เข้ารหัสรหัสผ่าน: ใช้ PasswordUtils.hashPassword เพื่อเข้ารหัสรหัสผ่านที่ได้รับมาก่อนที่จะบันทึกในฐานข้อมูล.
            String hash = PasswordUtils.hashPassword(password);

            //กำหนดรหัสผ่านที่เข้ารหัสแล้วให้กับ User: กำหนดรหัสผ่านที่เข้ารหัสแล้วให้กับอ็อบเจกต์ User ที่ได้รับ.
            user.setPassword(hash);

            //เริ่มทำ Transaction: เริ่ม Transaction เพื่อทำการบันทึกข้อมูลผู้ใช้ในฐานข้อมูล.
            getEntityManager().getTransaction().begin();
            //บันทึกข้อมูลผู้ใช้ในฐานข้อมูล: ใช้ persist เพื่อบันทึกข้อมูลผู้ใช้ลงในฐานข้อมูล.
            getEntityManager().persist(user);
            //Commit การทำ Transaction: Commit การทำ Transaction เพื่อทำการบันทึกข้อมูลจริง ๆ ลงในฐานข้อมูล.
            getEntityManager().getTransaction().commit();

            //การลงทะเบียนสำเร็จ: หากไม่มีข้อผิดพลาดเกิดขึ้นในขณะทำ Transaction หรือบันทึกข้อมูล, เมธอดจะคืนค่า true เพื่อบอกว่าการลงทะเบียนสำเร็จ.
            return true;
        } catch (Exception e) {
            //Exception Handling: ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception), จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า false เพื่อบอกว่าการลงทะเบียนไม่สำเร็จ.
            e.printStackTrace();
            return false;
        }
    }

    public User login(String username, String password) {
        try {
            UserRepository userRepository = new UserRepository();
            User user = userRepository.findByUsername(username);

            if (!PasswordUtils.isPasswordValid(user.getPassword(), password)) {
                throw new Exception("Invalid password");
            }

            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}