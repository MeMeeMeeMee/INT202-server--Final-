package sit.int202.classicmodeltue.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import sit.int202.classicmodeltue.entities.Environment;

public class EntityManagerBuilder {
    //สร้างและกำหนดค่า EntityManagerFactory:
    //emf: เป็นตัวแปรที่เก็บ EntityManagerFactory ที่ถูกสร้างขึ้นจาก Persistence.createEntityManagerFactory() โดยใช้ชื่อ persistence unit (Environment.PUNIT_NANME).
    //Environment.PUNIT_NANME: เป็นค่าคงที่ที่ได้จากคลาส Environment และนำมาใช้เป็นชื่อของ persistence unit ที่จะใช้ในการสร้าง EntityManagerFactory
    private final static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory(Environment.PUNIT_NANME);

    //เมธอดสำหรับการขอ EntityManager:
    //getEntityManager(): ใช้สำหรับขอ EntityManager จาก EntityManagerFactory ที่ได้รับ.
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}