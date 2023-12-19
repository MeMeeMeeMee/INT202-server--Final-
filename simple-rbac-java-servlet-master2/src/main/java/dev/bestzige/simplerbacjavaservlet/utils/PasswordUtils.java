package dev.bestzige.simplerbacjavaservlet.utils;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

public class PasswordUtils {
    public static boolean isPasswordValid(String hash, String password) {
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2d); //สร้างอ็อบเจ็กต์ Argon2 โดยใช้ Argon2Factory.create และกำหนดประเภทของ Argon2 เป็น ARGON2d
        return argon2.verify(hash, password); //ใช้เมทอด verify ของอ็อบเจ็กต์ Argon2 เพื่อตรวจสอบว่ารหัสผ่านที่กำหนดเข้ามา (password) ตรงกับค่าแฮชที่เก็บไว้ (hash) หรือไม่. ถ้าตรงกันคืนค่า true, ไม่ตรงคืนค่า false.
    }

    public static String hashPassword(String password) {
        //สร้างอ็อบเจ็กต์ Argon2 โดยใช้ Argon2Factory.create และกำหนดประเภทของ Argon2 เป็น ARGON2d พร้อมกับพารามิเตอร์เสริมสองตัวที่กำหนดความยาวของแฮชและขนาดของเมมโมรีเป็น 16.
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2d, 16, 16);

        //ใช้เมทอด hash ของอ็อบเจ็กต์ Argon2 เพื่อแฮชรหัสผ่าน. มีพารามิเตอร์ที่ให้กำหนดค่าดังนี้:
        //2: จำนวนการปฏิบัติการแฮช (iterations)
        //16: ขนาดของเมมโมรีในไบต์
        //1: จำนวนเส้นทางการแฮช (parallelism)
        //password: รหัสผ่านที่ต้องการแฮช
        String hash = argon2.hash(2, 16, 1, password);

        return hash; //คืนค่าแฮชที่ได้.
    }
}
