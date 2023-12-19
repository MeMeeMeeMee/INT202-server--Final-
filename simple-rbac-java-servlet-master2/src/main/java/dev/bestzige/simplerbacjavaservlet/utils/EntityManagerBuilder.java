package dev.bestzige.simplerbacjavaservlet.utils;

import dev.bestzige.simplerbacjavaservlet.Env;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManagerBuilder {

    //สร้าง EntityManagerFactory โดยใช้เมทอด Persistence.createEntityManagerFactory และให้ชื่อ Env.UNIT_NAME = "simple-rbac-java-servlet". Persistence.createEntityManagerFactory มักถูกใช้เพื่อสร้าง EntityManagerFactory จากไฟล์การกำหนดค่าที่มีชื่อเฉพาะ (persistence.xml) ภายใต้โครงข่ายของ JPA.
    private final static EntityManagerFactory emf = Persistence.createEntityManagerFactory(Env.UNIT_NAME);



    // สร้างและคืน EntityManager จาก EntityManagerFactory ที่ได้กำหนดไว้. EntityManager ใช้สำหรับการทำงานกับฐานข้อมูลผ่าน JPA.
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    //สรุป, โค้ดนี้ให้เครื่องมือจัดการการเชื่อมต่อกับฐานข้อมูล JPA ที่มีชื่อ "simple-rbac-java-servlet" และมีเมทอด getEntityManager() ที่ให้ EntityManager สำหรับการทำงานกับฐานข้อมูล. ที่นี้เป็นตัวอย่างการใช้ JPA ใน Java Servlet หรือโปรเจกต์ Java อื่น ๆ ที่ใช้งานกับฐานข้อมูล.
}
