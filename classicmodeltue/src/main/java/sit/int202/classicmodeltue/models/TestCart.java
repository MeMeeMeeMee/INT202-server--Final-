package sit.int202.classicmodeltue.models;

import sit.int202.classicmodeltue.entities.Product;
import sit.int202.classicmodeltue.repositories.ProductRepository;

public class TestCart {
    public static void main(String[] args) {
        //สร้างอ็อบเจ็กต์ Cart และ ProductRepository
        Cart<String, ClassicModelLineItem> cart = new Cart<>();
        ProductRepository productRepository = new ProductRepository();

        //ค้นหาสินค้าที่มีรหัส "S10_1678" จาก ProductRepository และเพิ่มลงใน Cart พร้อมกับจำนวนที่กำหนด:
        Product product = productRepository.findProduct("S10_1678");
        cart.addItem(product.getProductCode(), new ClassicModelLineItem(product, 5));

        //ค้นหาสินค้าอีกตัวที่มีรหัส "S12_3380" จาก ProductRepository และเพิ่มลงใน Cart ด้วยจำนวนที่กำหนดไว้เริ่มต้น (1):
        product = productRepository.findProduct("S12_3380");
        cart.addItem(product.getProductCode(), new ClassicModelLineItem(product));

        //พิมพ์ข้อมูลต่าง ๆ เกี่ยวกับ Cart
        System.out.println(cart.getNoOfItem());
        System.out.println(cart.getQuantity());
        System.out.println(cart.getTotalPrice());
        System.out.println(cart.getAllItem());

        //ลบสินค้าที่มีรหัส "S10_1678" ออกจาก Cart
        cart.removeItem("S10_1678");

        //พิมพ์ข้อมูลที่อัปเดตของ Cart หลังจากการลบรายการ:
        System.out.println(cart.getAllItem());
    }

    //คลาส TestCart จำลองสถานการณ์ที่สินค้าถูกเพิ่มลงในตะกร้าสินค้าและจากนั้นแสดงจำนวนและราคารวมของสินค้าในตะกร้า
    // หลังจากนั้นลบสินค้าหนึ่งรายการและแสดงข้อมูลที่อัปเดตเกี่ยวกับตะกร้า นี่คือลักษณะการใช้งานที่สามารถพบเห็นในการทดสอบการทำงานของตะกร้าสินค้า.

}
