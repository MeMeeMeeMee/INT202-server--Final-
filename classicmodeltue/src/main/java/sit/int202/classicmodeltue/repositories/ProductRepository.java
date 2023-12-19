package sit.int202.classicmodeltue.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodeltue.entities.Product;

import java.util.List;

public class ProductRepository { //ที่ให้บริการการจัดการข้อมูล Product ในฐานข้อมูล
    private static int PAGE_SIZE = 10; // กำหนดค่าคงที่ PAGE_SIZE ที่ใช้เป็นขนาดหน้าที่กำหนดไว้เริ่มต้น.
    private EntityManager entityManager; //ประกาศตัวแปร entityManager ที่ใช้เก็บ EntityManager.

    // เมธอด getEntityManager() ทำหน้าที่ดึง EntityManager หรือสร้างใหม่ถ้า entityManager ไม่ได้ถูกสร้างหรือถูกปิดไป.
    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) { //ตรวจสอบว่า entityManager ไม่ถูกสร้างหรือถูกปิด.
            entityManager = EntityManagerBuilder.getEntityManager(); // ถ้าเงื่อนไขเป็นจริง, จะสร้าง EntityManager ใหม่.
        }
        return entityManager; //คืนค่า EntityManager ที่ได้.
    }

    public int getDefaultPageSize() { //เมธอด getDefaultPageSize() ทำหน้าที่คืนค่า PAGE_SIZE ที่กำหนดไว้เริ่มต้น.
        return PAGE_SIZE; //คืนค่าขนาดหน้าที่กำหนดไว้เริ่มต้นที่ถูกกำหนดใน PAGE_SIZE.
    }

    //เมธอด findAll(int page, int pageSize) นี้ใช้ในการดึงข้อมูล Product จากฐานข้อมูลโดยให้กำหนดหน้าและขนาดหน้าที่ต้องการ.
    public List<Product> findAll(int page, int pageSize) {
        int startPosition = (page - 1) * pageSize; //คำนวณตำแหน่งเริ่มต้นของข้อมูลที่จะถูกดึงมา โดยใช้หมายเลขหน้า (page) และขนาดหน้า (pageSize).
        EntityManager entityManager = getEntityManager(); // ดึง EntityManager โดยใช้เมธอด getEntityManager().
        Query query = entityManager.createNamedQuery("PRODUCT.FIND_ALL"); // สร้าง Query โดยใช้ NamedQuery ที่มีชื่อว่า "PRODUCT.FIND_ALL" ซึ่งถูกกำหนดไว้ในคลาส Product.
        query.setFirstResult(startPosition); //กำหนดตำแหน่งเริ่มต้นของผลลัพธ์ที่จะถูกดึงมา.
        query.setMaxResults(pageSize); //กำหนดจำนวนข้อมูลที่จะถูกดึงมา.
        List<Product> productList = query.getResultList(); //ดึงข้อมูลจากฐานข้อมูลโดยใช้ getResultList() และเก็บผลลัพธ์ในลิสต์ของ Product.
        return productList; //คืนค่าลิสต์ของ Product ที่ถูกดึงมา.
    }

    //ใช้ในการนับจำนวนรายการทั้งหมดของ Product ในฐานข้อมูล และ findProduct(String productCode) ใช้ในการค้นหารายการ Product จากรหัสสินค้าที่กำหนด.
    public int countAll() {
        EntityManager entityManager = getEntityManager(); //ดึง EntityManager โดยใช้เมธอด getEntityManager().

        //entityManager.createNamedQuery("PRODUCT.COUNT"): สร้าง Query โดยใช้ NamedQuery ที่มีชื่อ "PRODUCT.COUNT" ซึ่งถูกกำหนดไว้ในคลาส Product.
        //((Number) query.getSingleResult()).intValue(): ดึงผลลัพธ์จาก Query และแปลงเป็น Number, จากนั้นเปลี่ยนเป็น int เพื่อให้ได้จำนวนรายการทั้งหมด.
        int number = ((Number) entityManager.createNamedQuery("PRODUCT.COUNT").getSingleResult()).intValue();
        return number;
    }

    public Product findProduct(String productCode) { //ค้นหารายการ Product จากฐานข้อมูลโดยใช้รหัสสินค้า (productCode). ถ้าพบรายการ, จะคืนค่า Product นั้น ๆ, ถ้าไม่พบจะคืนค่า null.
        return getEntityManager().find(Product.class, productCode);
    }

    //ใช้ในการค้นหาสินค้า (Product) จากฐานข้อมูลตามพารามิเตอร์ที่กำหนด.
    public List<Product> findByCatOrDesc(String searchParam) {
        EntityManager entityManager = getEntityManager(); //ดึง EntityManager โดยใช้เมธอด getEntityManager().
        Query query = entityManager.createNamedQuery("PRODUCT.FIND_BY_ALL_COLUMN"); //สร้าง Query โดยใช้ NamedQuery ที่มีชื่อ "PRODUCT.FIND_BY_ALL_COLUMN" ซึ่งถูกกำหนดไว้ในคลาส Product.
//        query.setFirstResult(0);
//        query.setMaxResults(PAGE_SIZE);
        query.setParameter("p1", "%"+searchParam+"%"); //กำหนดค่าพารามิเตอร์ p1 ใน NamedQuery ด้วยค่า %searchParam%.
        query.setParameter("p2", "%"+searchParam+"%");
        query.setParameter("p3", "%"+searchParam+"%");
//        System.out.println(query.getParameter("p1").getName()+ ", "+  query.getParameterValue("p1"));

        List<Product> productList = query.getResultList(); // ดึงข้อมูลจากฐานข้อมูลโดยใช้ getResultList() และเก็บผลลัพธ์ในลิสต์ของ Product.
        return productList; //คืนค่าลิสต์ของ Product ที่พบตามเงื่อนไขการค้นหา.
    }
}
