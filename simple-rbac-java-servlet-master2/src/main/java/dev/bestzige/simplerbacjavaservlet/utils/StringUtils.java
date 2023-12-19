package dev.bestzige.simplerbacjavaservlet.utils;

public class StringUtils {
    public static boolean isNullOrEmpty(String str) {
        // ตรวจสอบว่าข้อความเป็น null หรือว่ามีค่าว่าง
        return str == null || str.trim().isEmpty();
    }
}
