package sit.int202.classicmodeltue.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodeltue.entities.Office;

import java.util.List;

public class OfficeRepository {
    //เป็นตัวแปรที่ใช้เก็บ EntityManager ซึ่งใช้ในการเชื่อมต่อกับฐานข้อมูล.
    private EntityManager entityManager;

    //getEntityManager(): เป็นเมธอดที่ใช้เพื่อขอ EntityManager. ถ้า entityManager มีค่าเป็น null หรือไม่ได้เปิดใช้งาน, จะใช้ EntityManagerBuilder.getEntityManager() เพื่อสร้าง EntityManager ใหม่
   //คำสั่ง entityManager.isOpen(): ใช้ตรวจสอบว่า EntityManager ถูกเปิดใช้งานหรือไม่.
    //หาก entityManager มีค่าเป็น null หรือไม่ได้เปิดใช้งาน, จะทำการสร้าง EntityManager ใหม่จาก EntityManagerBuilder และกำหนดค่าให้กับ entityManager.
    //สุดท้ายจะคืนค่า entityManager ที่ได้.
    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    //findAll() เพื่อค้นหาทั้งหมด
    //เมธอดนี้ใช้ createNamedQuery("OFFICE.FIND_ALL") เพื่อสร้างและเรียกใช้ Named Query ที่ชื่อ "OFFICE.FIND_ALL" ซึ่งอาจถูกกำหนดไว้ในคลาส Office หรือใน XML configuration ของ JPA.
    //getResultList(): ใช้เพื่อรับรายการของผลลัพธ์ที่ได้จากการค้นหา.
    //สุดท้าย, จะคืนรายการของ Office ทั้งหมด.
    public List<Office> findAll() {
        return getEntityManager().createNamedQuery("OFFICE.FIND_ALL").getResultList();
    }

    //find(String officeCode) เพื่อค้นหาตามรหัสสำนักงาน
    //เมธอดนี้ใช้ getEntityManager().find(Office.class, officeCode) เพื่อทำการค้นหา Office โดยใช้รหัสสำนักงาน (officeCode).
    //Office.class: ระบุว่าจะค้นหาเอ็นทิตีแบบ Office.
    //officeCode: รหัสสำนักงานที่จะถูกใช้ในการค้นหา.
    //สุดท้าย, จะคืน Office ที่พบ (หากมี) หรือ null ถ้าไม่พบ
    public Office find(String officeCode) {
        return getEntityManager().find(Office.class, officeCode);
    }


    public void close() {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }

    //insert
    //เป็นเมธอดที่ใช้ในการเพิ่มข้อมูล Office ลงในฐานข้อมูลโดยใช้ JPA และจัดการกับ Transaction และข้อผิดพลาดที่อาจเกิดขึ้น
    public boolean insert(Office office) {
        try {
            EntityManager entityManager = getEntityManager(); //ขอ EntityManager จาก getEntityManager() เพื่อให้สามารถทำงานกับฐานข้อมูล.
            entityManager.getTransaction().begin(); // เริ่มทำ Transaction.
            entityManager.persist(office); //ทำการเพิ่มข้อมูล Office ลงในฐานข้อมูล. การใช้ persist บอก JPA ว่าต้องการจะเก็บข้อมูล Office ลงในฐานข้อมูล.
            entityManager.getTransaction().commit(); //ยืนยัน Transaction และทำการ commit เพื่อบันทึกการเปลี่ยนแปลง.
        } catch (Exception e) { //หากมีข้อผิดพลาดในการทำ Transaction หรือการ persist ข้อมูล, จะทำการ catch และคืนค่า false เพื่อบอกว่าการเพิ่มข้อมูลไม่สำเร็จ.
            return false;
        }
        return true; // หากทุกอย่างเสร็จสมบูรณ์โดยไม่เกิดข้อผิดพลาด, จะคืนค่า true เพื่อบอกว่าการเพิ่มข้อมูลสำเร็จ.
    }

    //delete
    //เป็นเมธอดที่ใช้ในการลบข้อมูล Office ออกจากฐานข้อมูลโดยใช้ JPA และจัดการกับ Transaction, ข้อผิดพลาด, และกรณีที่ office ไม่ได้ถูกจัดเก็บใน EntityManager.
    public boolean delete(Office office) {
        if (office != null) { //ทำการตรวจสอบว่า office ไม่ใช่ null เพื่อป้องกันการใช้งานที่ไม่ถูกต้อง.
            EntityManager entityManager = getEntityManager(); //ขอ EntityManager จาก getEntityManager() เพื่อให้สามารถทำงานกับฐานข้อมูล.
            if (entityManager.contains(office)) { //ตรวจสอบว่า office อยู่ในสถานะที่ถูกจัดเก็บโดย EntityManager หรือไม่.
                entityManager.getTransaction().begin(); //เริ่มทำ Transaction.
                entityManager.remove(office); //ลบข้อมูล Office ออกจากฐานข้อมูล.
                entityManager.getTransaction().commit(); //ยืนยัน Transaction และทำการ commit เพื่อบันทึกการเปลี่ยนแปลง.
                return true; //คืนค่า true เพื่อบอกว่าการลบข้อมูลสำเร็จ.
            } else {
                return delete(office.getOfficeCode()); // ถ้า office ไม่ได้ถูกจัดเก็บใน EntityManager, จะเรียกเมธอด delete ที่รับรหัสสำนักงาน (office.getOfficeCode())
            }
        }
        return false; //กรณี office เป็น null, จะคืนค่า false เพื่อบอกว่าการลบข้อมูลไม่สำเร็จ.
    }

    //delete
    //ป็นเมธอดที่ใช้ในการลบข้อมูล Office จากฐานข้อมูลโดยให้ในรหัสสำนักงาน (officeCode) โดยใช้ JPA และจัดการกับ Transaction และกรณีที่ office ไม่พบในฐานข้อมูล.
    public boolean delete(String officeCode) {
        EntityManager entityManager = getEntityManager(); //ขอ EntityManager จาก getEntityManager() เพื่อให้สามารถทำงานกับฐานข้อมูล.
        Office office = find(officeCode); //ใช้เมธอด find(officeCode) เพื่อค้นหา Office จากรหัสสำนักงาน (officeCode).
        if (office != null) { //ตรวจสอบว่า office มีค่าต่างจาก null (ค้นพบข้อมูล).
            entityManager.getTransaction().begin(); //เริ่มทำ Transaction.
            entityManager.remove(office); //ลบข้อมูล Office ออกจากฐานข้อมูล.
            entityManager.getTransaction().commit(); //ยืนยัน Transaction และทำการ commit เพื่อบันทึกการเปลี่ยนแปลง.
            return true; // คืนค่า true เพื่อบอกว่าการลบข้อมูลสำเร็จ.
        }
        return false; // ถ้า office เป็น null, จะคืนค่า false เพื่อบอกว่าไม่พบข้อมูลที่ต้องการลบ.
    }

    //update
    //เป็นเมธอดที่ใช้ในการอัปเดตข้อมูล Office ในฐานข้อมูลโดยให้ข้อมูลใหม่จาก newOffice โดยใช้ JPA และจัดการกับ Transaction, ข้อผิดพลาด, และกรณีที่ newOffice เป็น null หรือไม่พบข้อมูลที่ต้องการอัปเดต
    public boolean update(Office newOffice) {
        if (newOffice != null) { //ตรวจสอบว่า newOffice ไม่ใช่ null เพื่อป้องกันการใช้งานที่ไม่ถูกต้อง.
            EntityManager entityManager = getEntityManager(); //ขอ EntityManager จาก getEntityManager() เพื่อให้สามารถทำงานกับฐานข้อมูล.
            Office office = find(newOffice.getOfficeCode()); //ใช้เมธอด find(newOffice.getOfficeCode()) เพื่อค้นหา Office จากรหัสสำนักงาน (officeCode).
            if (office != null) { // ตรวจสอบว่า office มีค่าต่างจาก null (ค้นพบข้อมูล).
                entityManager.getTransaction().begin(); //เริ่มทำ Transaction.
                //การอัปเดตทุกอาร์ทริบิวต์ของ office ด้วยข้อมูลใหม่จาก newOffice
                //set all attributes office with newOffice
                // example : office.setCity(newOffice.getCity());
                entityManager.getTransaction().commit();// ยืนยัน Transaction และทำการ commit เพื่อบันทึกการเปลี่ยนแปลง.
                return true;//คืนค่า true เพื่อบอกว่าการอัปเดตข้อมูลสำเร็จ.
            }
        }
        //ถ้า newOffice เป็น null, จะคืนค่า false เพื่อบอกว่าไม่มีข้อมูลใหม่ที่ให้ในการอัปเดต.
        //ถ้าไม่พบข้อมูล office จากรหัสสำนักงานที่กำลังอัปเดต, จะคืนค่า false เพื่อบอกว่าไม่มีข้อมูลที่ต้องการอัปเดต.
        return false;
    }

    //เป็นเมธอดที่ใช้ในการค้นหาข้อมูล Office จากฐานข้อมูลโดยให้เงื่อนไขที่เกี่ยวข้องกับเมืองหรือประเทศที่รับเข้ามา (cityOrCountry) โดยใช้ JPA.
    public List<Office> findByCityOrCountry(String cityOrCountry) {
        cityOrCountry = cityOrCountry.toLowerCase() + '%'; //ทำให้ข้อมูลที่รับเข้ามาเป็นตัวพิมพ์เล็กและเพิ่ม % ด้านหลัง. การใส่ % นั้นเพื่อให้สามารถค้นหาข้อมูลที่เริ่มต้นด้วย cityOrCountry ได้.
        Query query = getEntityManager().createNamedQuery("OFFICE.FIND_BY_CITY_OR_COUNTRY"); // สร้าง Query โดยใช้ชื่อคิวรีที่กำหนดไว้ในคลาส Office และที่ชื่อว่า "OFFICE.FIND_BY_CITY_OR_COUNTRY".
        query.setParameter("city", cityOrCountry); //กำหนดค่าของพารามิเตอร์ "city" ให้กับ Query.
        query.setParameter("country", cityOrCountry); // กำหนดค่าของพารามิเตอร์ "country" ให้กับ Query.
        return query.getResultList(); // คืนค่าลิสต์ของ Office ที่ตรงกับเงื่อนไขที่กำหนด.
    }
}
