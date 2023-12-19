package sit.int202.classicmodeltue.models;

import sit.int202.classicmodeltue.entities.Product;

//ClassicModelLineItem เป็นคลาสที่ implements CartItem interface,
// ซึ่งหมายความว่า ClassicModelLineItem ต้องประกอบด้วยเมธอดที่ถูกกำหนดใน CartItem.
// นอกจากนี้, คลาสนี้ยังมีเมธอด getProduct() เพื่อให้ได้ข้อมูลของสินค้าที่เกี่ยวข้อง.
public class ClassicModelLineItem implements CartItem {
    //ประกาศตัวแปร
    private Product product;
    private int quantity;
    private double percentDiscount;



    //เมื่อสร้าง ClassicModelLineItem ด้วยการระบุ Product เพียงอย่างเดียว, จำนวนสินค้าจะถูกตั้งค่าเป็น 1 และเปอร์เซ็นต์ส่วนลดจะเป็น 0.0 โดยค่าเหล่านี้เป็นค่าเริ่มต้นที่ถูกกำหนดในกรณีที่ไม่ได้ระบุค่าเอง.
    public ClassicModelLineItem(Product product) {
        this(product, 1, 0.0);
    }

    //เมื่อสร้าง ClassicModelLineItem ด้วยการระบุ Product และ quantity, เปอร์เซ็นต์ส่วนลดจะถูกตั้งค่าเป็น 0.0 โดยค่านี้เป็นค่าเริ่มต้นที่ถูกกำหนดในกรณีที่ไม่ได้ระบุค่าเอง.
    public ClassicModelLineItem(Product product, int quantity) {
        this(product, quantity, 0.0);
    }

    public ClassicModelLineItem(Product product, int quantity, double percentDiscount) {
        this.product = product; //กำหนดค่าของตัวแปร product ใน ClassicModelLineItem ด้วย Product ที่รับมา.
        this.quantity = quantity; //กำหนดค่าของตัวแปร quantity ใน ClassicModelLineItem ด้วยจำนวนสินค้าที่รับมา.
        this.percentDiscount = percentDiscount; //กำหนดค่าของตัวแปร percentDiscount ใน ClassicModelLineItem ด้วยเปอร์เซ็นต์ส่วนลดที่รับมา.
        //เมื่อสร้าง ClassicModelLineItem ด้วยการระบุ Product, quantity, และ percentDiscount, ตัวแปรต่าง ๆ ในอ็อบเจ็กต์จะถูกกำหนดค่าตามที่รับมา.
    }
    //เพื่อให้สามารถดึงข้อมูลของสินค้า (Product) ที่เกี่ยวข้องกับ ClassicModelLineItem ได้:
    public Product getProduct() {
        return product;
    }



    //เป็นเมธอดที่ไว้เพื่อให้สามารถดึงจำนวนสินค้า (quantity) ของ ClassicModelLineItem ได้
    //เมื่อเรียกใช้ getQuantity() บนอ็อบเจ็กต์ของ ClassicModelLineItem, จะได้ค่าจำนวนสินค้าที่ถูกกำหนดใน ClassicModelLineItem
    @Override
    public int getQuantity() {
        return quantity;
    }

    //เป็นเมธอดที่ให้การกำหนดหรือปรับปรุงจำนวนสินค้า
    //เมื่อเรียกใช้ setQuantity(int quantity) บนอ็อบเจ็กต์ของ ClassicModelLineItem แล้วกำหนดค่า quantity, จำนวนสินค้าใน ClassicModelLineItem จะถูกปรับปรุงตามค่าที่ระบุ.
    @Override
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    //เป็นเมธอดที่ไว้เพื่อให้สามารถดึงราคาต่อหน่วย (unitPrice)
    //เมื่อเรียกใช้ getUnitPrice() บนอ็อบเจ็กต์ของ ClassicModelLineItem, จะได้ค่าราคาต่อหน่วยของสินค้าที่ถูกกำหนดใน ClassicModelLineItem.
    @Override
    public double getUnitPrice() {
        return product.getPrice();
    }

    //เป็นเมธอดที่ไว้เพื่อคำนวณและคืนค่าราคารวม (total) โดยนำราคาต่อหน่วย (getUnitPrice()), จำนวนสินค้า (getQuantity()), และเปอร์เซ็นต์ส่วนลด (percentDiscount) มาคำนวณ
    //ในสูตรนี้, getUnitPrice() * getQuantity() หมายถึง ราคาต่อหน่วย คูณด้วย จำนวนสินค้า เพื่อให้ได้ราคารวมก่อนหักส่วนลด
    // และจากนั้นลบด้วยส่วนลดที่ได้รับ (getUnitPrice() * getQuantity() * percentDiscount) เพื่อได้ราคารวมที่หักส่วนลดแล้ว.
    @Override
    public double getTotal() {
        return getUnitPrice() * getQuantity()
                - getUnitPrice() * getQuantity() * percentDiscount;
    }

    //เป็นเมธอดที่ไว้เพื่อคืนค่าเปอร์เซ็นต์ส่วนลด (percentDiscount) และคูณด้วย 100 เพื่อแปลงให้เป็นเปอร์เซ็นต์:
    //เมื่อเรียกใช้ getPercentDiscount() บนอ็อบเจ็กต์ของ ClassicModelLineItem, จะได้ค่าเปอร์เซ็นต์ส่วนลดที่ถูกกำหนดใน ClassicModelLineItem และแปลงเป็นเปอร์เซ็นต์.
    @Override
    public double getPercentDiscount() {
        return percentDiscount*100;
    }

    //เป็นเมธอดที่ให้การกำหนดหรือปรับปรุงเปอร์เซ็นต์ส่วนลด
    //เมื่อเรียกใช้ setPercentDiscount(double percentDiscount) แล้วกำหนดค่า percentDiscount, ค่าเปอร์เซ็นต์ส่วนลดใน ClassicModelLineItem จะถูกปรับปรุงตามค่าที่ระบุ.
    public void setPercentDiscount(double percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    @Override
    public String toString() { //เป็นเมธอดที่ไว้สำหรับสร้างและคืนค่าสตริงที่แสดงข้อมูลที่สำคัญของอ็อบเจ็กต์
        //เมื่อเรียกใช้ toString()จะได้สตริงที่ประกอบด้วยข้อมูลเกี่ยวกับสินค้าที่เกี่ยวข้องกับ ClassicModelLineItem, ราคาต่อหน่วย, จำนวนสินค้า, และเปอร์เซ็นต์ส่วนลด.
        return '{' + product.getProductName() + ", " + getUnitPrice()
                + ", " + quantity + ", " + percentDiscount + "% }";
    }
}
