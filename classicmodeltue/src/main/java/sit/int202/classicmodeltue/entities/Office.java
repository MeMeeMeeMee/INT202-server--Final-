package sit.int202.classicmodeltue.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name = "Offices")
@Getter
@Setter
@ToString(exclude = {"addressLine1", "addressLine2", "territory"})
@NamedQueries(// ระบุการ query ที่ใช้งานกับ Entity นี้ ซึ่งในที่นี้มี 4 NamedQueries:
{
    @NamedQuery(name = "OFFICE.FIND_ALL", query = "select o from Office o"), //ใช้ select ทุกรายการจากตาราง.

    @NamedQuery(name = "OFFICE.FIND_BY_COUNTRY", //ใช้ select จากรายการที่ตรงกับประเทศที่กำหนด.
       query = "select o from Office o where o.country like :countryParam"),

    @NamedQuery(name = "OFFICE.DELETE", //ใช้ delete รายการที่ตรงกับรหัสสำนักงานที่กำหนด.
       query = "delete Office o where o.officeCode = :officeCode"),

    @NamedQuery(name = "OFFICE.FIND_BY_CITY_OR_COUNTRY", //ใช้ select จากรายการที่ตรงกับเมืองหรือประเทศที่กำหนด.
       query = "select o from Office o where lower(o.city) like :city or lower(o.country) like :country")
})
public class Office {
    @Id //ระบุว่า officeCode เป็น primary key ของ Entity.
    private String officeCode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String country;
    private String postalCode;
    private String phone;
    private String territory;
    //@OneToMany(mappedBy = "office"): ระบุความสัมพันธ์แบบหลายไปยัง (One-to-Many) กับ Entity Employee โดยใช้ field office ใน Employee เป็นค่าที่ใช้ map ความสัมพันธ์.
    @OneToMany(mappedBy = "office")
    private List<Employee> employeeList;
}
