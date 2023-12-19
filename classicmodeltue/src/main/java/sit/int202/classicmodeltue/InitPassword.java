package sit.int202.classicmodeltue;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import sit.int202.classicmodeltue.entities.Customer;
import sit.int202.classicmodeltue.repositories.CustomerRepository;


public class InitPassword {
    public static void main(String[] args) {
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2d,16,16);
        //hash(int iterations, int memory, int parallelism, char[] password)
        CustomerRepository repository = new CustomerRepository();
        repository.getEntityManager().getTransaction().begin();
        char[] password ;
        for(Customer c : repository.findAll()) {
            password = c.getCustomerNumber().toString().toCharArray();
            c.setPassword(argon2.hash(2, 16, 1, password));
        }
        repository.getEntityManager().getTransaction().commit();
    }
}

//โปรแกรม InitPassword ด้านบนนั้นใช้ Argon2 เพื่อทำการแฮชรหัสผ่านของลูกค้าทั้งหมดในฐานข้อมูล โดยให้แต่ละรหัสผ่านเป็นตัวเลขแนบกับเลขลูกค้าของเค้า. นอกจากนี้, มีการใช้ Entity Manager ในการเรียกใช้ Transaction ของฐานข้อมูล. ดังนั้น, ถ้าคุณใช้ Entity Manager ร่วมกับ JPA (Java Persistence API), คำสั่ง getTransaction() สามารถถูกใช้เพื่อเริ่มหรือ commit ธุรกรรมที่เกี่ยวข้องกับฐานข้อมูล.
//
//นอกจากนี้, โปรแกรมทำงานหลังจากที่ได้รับรายการลูกค้าทั้งหมดจาก repository.findAll() และทำการแฮชรหัสผ่านให้กับแต่ละลูกค้าโดยใช้ argon2.hash() และเลขลูกค้าเป็นรหัสผ่าน, และทำการ commit ธุรกรรม.
//
//นอกจากนี้, ต้องระวังการใช้ getTransaction() ในสถานการณ์จริงที่ใช้งานจริง, และแนะนำให้ใช้หรือทดสอบกับฐานข้อมูลทดสอบก่อนนำไปใช้งานจริง.
