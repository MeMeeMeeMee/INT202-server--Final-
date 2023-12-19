package sit.int202.classicmodeltue.repositories;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodeltue.entities.Customer;

import java.util.List;

public class CustomerRepository {
    //เข้าถึงและสร้าง EntityManager
    private EntityManager entityManager;

    public EntityManager getEntityManager() { // เมื่อเรียกใช้เมธอดนี้, จะทำการตรวจสอบว่า
        //getEntityManager(): เมื่อเรียกใช้เมธอดนี้, จะทำการตรวจสอบว่า EntityManager มีค่าเป็น null หรือไม่เปิดใช้งาน
        // หากเป็นเช่นนั้น, จะใช้ EntityManagerBuilder.getEntityManager() เพื่อสร้าง EntityManager ใหม่.
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    //ค้นหาลูกค้าโดยใช้ชื่อผู้ใช้
    //findByName(String name): ใช้เพื่อค้นหาลูกค้าโดยใช้ชื่อผู้ใช้ (user name).
    // มีการใช้ Named Query ที่ชื่อ "CUSTOMER.FIND_USER" ซึ่งอาจถูกกำหนดในคลาส Customer
    // หรือ XML configuration ของ JPA.
    public Customer findByName(String name) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("CUSTOMER.FIND_USER");
        query.setParameter("user_account", name);
        return (Customer) query.getSingleResult();
    }

    //ค้นหาลูกค้าทั้งหมด: findAll(): ใช้เพื่อค้นหาลูกค้าทั้งหมดจากฐานข้อมูล.
    public List<Customer> findAll() {
        return getEntityManager().createQuery("select c from Customer c").getResultList();
    }
}
