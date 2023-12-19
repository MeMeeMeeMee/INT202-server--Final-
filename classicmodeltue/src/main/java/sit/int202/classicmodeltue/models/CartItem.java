package sit.int202.classicmodeltue.models;

//CartItem เป็นส่วนสำคัญในการทำให้ Cart สามารถรับรายการที่มีลักษณะแตกต่างกันได้ โดยที่รายการนั้นต้องประกอบด้วยข้อมูลที่ได้จาก CartItem Interface.
public interface CartItem {
    public int getQuantity(); //คืนค่าจำนวนสินค้าในรายการ.

    public void setQuantity(int quantity); //ใช้ในการกำหนดหรือปรับปรุงจำนวนสินค้าในรายการ.

    public double getUnitPrice(); //คืนค่าราคาต่อหน่วยของสินค้าในรายการ.

    public double getTotal(); //คืนค่าราคารวมของรายการ (จำนวนสินค้า * ราคาต่อหน่วย).

    public double getPercentDiscount(); //คืนค่าเปอร์เซ็นต์ส่วนลดที่จะถูกนำไปใช้กับรายการ.
}
