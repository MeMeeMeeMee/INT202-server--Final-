package sit.int202.classicmodeltue.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "products") //ระบุชื่อตารางในฐานข้อมูลที่ Entity นี้จะถูกแมปไป.
@NamedQueries({ // ระบุการ query ที่ใช้งานกับ Entity นี้ ซึ่งในที่นี้มี 3 NamedQueries:
    @NamedQuery(name = "PRODUCT.FIND_ALL", query = "SELECT p FROM Product p"),// ใช้ select ทุกรายการจากตาราง.
    @NamedQuery(name = "PRODUCT.COUNT", query = "SELECT count(p) as count FROM Product p"), //ใช้ select นับจำนวนรายการทั้งหมดจากตาราง.
    @NamedQuery(name = "PRODUCT.FIND_BY_ALL_COLUMN", //ช้ select จากรายการที่ตรงกับคำค้นหาที่กำหนด.
            query = "SELECT p FROM Product p where p.productName like :p1 or p.productLine like :p2 or p.productDescription like :p3")
})
public class Product {
    @Id //ระบุว่า productCode เป็น primary key ของ Entity.
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    private Integer quantityInStock;
    private Double buyPrice;  // Cost
    @Column(name = "MSRP") // Manufacturer Suggestion Retail Price
    private Double price;
}
