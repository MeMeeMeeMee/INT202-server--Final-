package dev.bestzige.simplerbacjavaservlet.repositories;

import dev.bestzige.simplerbacjavaservlet.entities.User;
import dev.bestzige.simplerbacjavaservlet.utils.EntityManagerBuilder;
import dev.bestzige.simplerbacjavaservlet.utils.StringUtils;
import jakarta.persistence.EntityManager;

import java.util.List;

public class UserRepository {
    private EntityManager entityManager; //ประกาศตัวแปร entityManager เป็น private ซึ่งหมายความว่ามันสามารถเข้าถึงได้เฉพาะในขอบเขตของคลาส AuthRepository นี้เท่านั้น.

    //เมธอดนี้ถูกใช้ในการดึง EntityManager. ถ้า EntityManager ยังไม่ถูกสร้างหรือปิดแล้ว, มันจะสร้าง EntityManager ใหม่โดยใช้ EntityManagerBuilder (ที่ไม่ได้แสดงในโค้ดที่คุณให้) และคืนค่า.
    private EntityManager getEntityManager() { // เมธอดนี้ถูกใช้ในการดึง EntityManager. หาก entityManager ยังไม่ถูกสร้างหรือปิดไปแล้ว
        if (entityManager == null || !entityManager.isOpen()) { //มันจะสร้าง EntityManager ใหม่โดยใช้ EntityManagerBuilder.getEntityManager() (ซึ่งเป็นเมธอดที่คุณไม่ได้แสดงไว้) และคืนค่า entityManager.
            entityManager = EntityManagerBuilder.getEntityManager(); //เมื่อ entityManager ได้รับการตรวจสอบแล้วและพร้อมใช้งาน, มันจะถูกคืนให้กับผู้เรียกในที่นี้คือเมธอด getEntityManager().
        }
        return entityManager;
    }

    public User findByUsername(String username) {
        try {
            //ช้ EntityManager เพื่อสร้าง Named Query ที่มีชื่อ "User.findByUsername". Named Query นี้ต้องถูกกำหนดในคลาส User โดยใช้ annotation @NamedQuery.
            return getEntityManager().createNamedQuery("User.findByUsername", User.class)
                    .setParameter("username", username) //กำหนดพารามิเตอร์ "username" ที่ได้รับมาจากเมธอดให้กับ Named Query. นี้จะเป็นการกำหนดค่าที่ต้องการค้นหาในฐานข้อมูล.
                    .getSingleResult(); //ดึงผลลัพธ์จาก Named Query ซึ่งมีการค้นหาข้อมูลผู้ใช้จากฐานข้อมูล. getSingleResult() จะคืนผลลัพธ์เดียวที่ค้นพบ (หรือจะเกิด Exception หากไม่พบ).
        } catch (Exception e) { //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception), จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า null เพื่อบอกว่าการค้นหาไม่สำเร็จ.
            e.printStackTrace();
            return null;
        }
    }

    public User findById(int id) {
        try {
            //ใช้ EntityManager เพื่อค้นหาผู้ใช้จากฐานข้อมูลโดยใช้เมธอด find. การใช้ find นี้จะค้นหาข้อมูลผู้ใช้โดยใช้คีย์หลัก (Primary Key) ที่กำหนดไว้ในฐานข้อมูล (ในที่นี้คือ ID).
            return getEntityManager().find(User.class, id);
        } catch (Exception e) { //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception), จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า null เพื่อบอกว่าการค้นหาไม่สำเร็จ.
            //การใช้ find เป็นวิธีที่มักถูกใช้ในการค้นหาข้อมูลโดยใช้คีย์หลัก โดย ID ในกรณีนี้จะเป็นคีย์หลัก. ถ้าไม่พบผู้ใช้ที่มี ID ที่กำหนด, find จะคืน null.
            e.printStackTrace();
            return null;
        }
    }

    public int countAll(String search) {
        try {
            if(StringUtils.isNullOrEmpty(search)) { //ตรวจสอบว่าตัวแปร search มีค่าเป็น null หรือ empty. ถ้าเป็นเช่น, จะใช้ Named Query "User.countAll" เพื่อนับทั้งหมด.

                //ใช้ EntityManager เพื่อสร้าง Named Query ที่มีชื่อ "User.countAll" เพื่อนับทั้งหมด. ชนิดข้อมูลที่คืนค่าจะเป็น Long.
                return getEntityManager().createNamedQuery("User.countAll", Long.class)
                        .getSingleResult() //ดึงผลลัพธ์จาก Named Query และแปลงเป็น int โดยใช้ intValue(). นี่คือจำนวนผู้ใช้ทั้งหมด.
                        .intValue();
            }

            //การทำงานในกรณีที่มีการค้นหา: ถ้าตัวแปร search มีค่า (ไม่เป็น null และไม่ empty), จะใช้ Named Query "User.countAllWithSearch" เพื่อนับจำนวนที่ตรงกับเงื่อนไขค้นหา.
            return getEntityManager().createNamedQuery("User.countAllWithSearch", Long.class)
                    //.setParameter("search", "%" + search + "%"): กำหนดพารามิเตอร์ "search" ที่รับมาจากเมธอดให้กับ Named Query. ในที่นี้จะใส่ % ทั้งสองด้านของ search เพื่อให้นับผลลัพธ์ที่มี search อยู่ในบางส่วนของชื่อผู้ใช้.
                    .setParameter("search", "%" + search + "%")
                    .getSingleResult()
                    .intValue();
        } catch (Exception e) { //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception) ในการค้นหา, จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า 0 เพื่อบอกว่าการค้นหาไม่สำเร็จ.
            e.printStackTrace();
            return 0;
        }
    }

    public List<User> findAll(int page, int limit, String search) {
        try {
            // กำหนด limit และ page ให้มีค่าที่ถูกต้อง
            //ในกรณีที่ limit ไม่เป็นค่าที่ถูกต้อง (ไม่อยู่ในช่วง 1-100), ให้ใช้ค่าเริ่มต้นเป็น 10. ส่วนในกรณีที่ page ไม่เป็นค่าที่ถูกต้อง (น้อยกว่าหรือเท่ากับ 0), ให้ใช้หน้าที่ 1.
            limit = limit > 0 && limit <= 100 ? limit : 10;
            page = page > 0 ? page : 1;


            // ถ้าไม่มีการค้นหา (search เป็น null หรือ empty)
            // ให้ใช้ Named Query "User.findAll" เพื่อดึงข้อมูลทั้งหมด
            if (StringUtils.isNullOrEmpty(search)) {
                //ใช้ EntityManager เพื่อสร้าง Named Query ที่มีชื่อ "User.findAll" เพื่อดึงข้อมูลทั้งหมด. ชนิดข้อมูลที่คืนค่าจะเป็น User.
                return getEntityManager().createNamedQuery("User.findAll", User.class)
                        //กำหนดหน้าที่จะแสดง (หน้าแรกคือ 1) โดยใช้สูตร (page - 1) * limit. สูตรนี้ใช้ในการข้ามผลลัพธ์ที่มีอยู่ก่อนหน้าและเริ่มดึงผลลัพธ์จากตำแหน่งที่กำหนด.
                        .setFirstResult((page - 1) * limit) // กำหนดหน้าที่จะแสดง
                        //กำหนดจำนวนผู้ใช้ที่จะแสดงในแต่ละหน้า, ซึ่งคือ limit.
                        .setMaxResults(limit) // กำหนดจำนวนผู้ใช้ที่จะแสดงในแต่ละหน้า
                        .getResultList();
            }

            // ถ้ามีการค้นหา (search ไม่เป็น null และไม่ empty)
            // ให้ใช้ Named Query "User.findAllWithSearch" เพื่อดึงข้อมูลที่ตรงกับเงื่อนไขค้นหา
            return getEntityManager().createNamedQuery("User.findAllWithSearch", User.class)
                    //กำหนดพารามิเตอร์ "search" ที่ได้รับมาจากเมธอดให้กับ Named Query. ในที่นี้ % ที่เพิ่มไว้ทั้งสองด้านของ search คือ wildcard characters ที่ใช้ใน SQL เพื่อให้เกิดการ match กับข้อมูลที่มี search อยู่ในบางส่วนของชื่อผู้ใช้.
                    .setParameter("search", "%" + search + "%") // กำหนดพารามิเตอร์ "search"

                    //กำหนดหน้าที่จะแสดง (หน้าแรกคือ 1) โดยใช้สูตร (page - 1) * limit. สูตรนี้ใช้ในการข้ามผลลัพธ์ที่มีอยู่ก่อนหน้าและเริ่มดึงผลลัพธ์จากตำแหน่งที่กำหนด.
                    .setFirstResult((page - 1) * limit) // กำหนดหน้าที่จะแสดง

                    //.setMaxResults(limit): กำหนดจำนวนผู้ใช้ที่จะแสดงในแต่ละหน้า, ซึ่งคือ limit.
                    .setMaxResults(limit) // กำหนดจำนวนผู้ใช้ที่จะแสดงในแต่ละหน้า

                    .getResultList(); //ดึงผลลัพธ์จาก Named Query ซึ่งจะคืน List ของผู้ใช้ที่ตรงกับเงื่อนไขค้นหา.

            //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception) ในการค้นหา, จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า null เพื่อบอกว่าการค้นหาไม่สำเร็จ. การใช้ e.printStackTrace() ช่วยในการติดตามและแก้ไขข้อผิดพลาดในระหว่างการพัฒนา.
        } catch (Exception e) {
            // กรณีเกิด Exception ในการค้นหา
            e.printStackTrace();
            return null;
        }
    }


    public boolean remove(User user) {
        try {
            getEntityManager().getTransaction().begin(); //เริ่มทำ Transaction โดยเริ่มต้นด้วยการเรียก begin().
            getEntityManager().remove(user); //ลบผู้ใช้จากฐานข้อมูล.
            getEntityManager().getTransaction().commit(); //commit Transaction เพื่อบันทึกการเปลี่ยนแปลงลงในฐานข้อมูล.
            return true;
        } catch (Exception e) { //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception) ในขณะทำ Transaction, จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า false เพื่อบอกว่าการลบไม่สำเร็จ.
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(User user) {
        try {
            getEntityManager().getTransaction().begin(); //เริ่มทำ Transaction โดยเริ่มต้นด้วยการเรียก begin().
            getEntityManager().merge(user); //อัปเดตข้อมูลผู้ใช้ในฐานข้อมูล.
            getEntityManager().getTransaction().commit(); // commit Transaction เพื่อบันทึกการเปลี่ยนแปลงลงในฐานข้อมูล.
            return true;
        } catch (Exception e) { //ในกรณีที่มีข้อผิดพลาดเกิดขึ้น (Exception) ในขณะทำ Transaction, จะแสดง Stack Trace ของ Exception และเมธอดจะคืนค่า false เพื่อบอกว่าการอัปเดตไม่สำเร็จ.
            e.printStackTrace();
            return false;
        }
    }
}