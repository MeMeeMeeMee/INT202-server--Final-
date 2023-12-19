package sit.int202.classicmodeltue.models;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Cart<K, V extends CartItem> {
    private Map<K, V> map;

    //สร้างอ็อบเจ็กต์ Cart และกำหนดค่าให้กับตัวแปร map เป็น HashMap เพื่อเก็บรายการ (items) ในตะกร้า.
    public Cart() {
        this.map = new HashMap<>();
    }

    //มีวัตถุประสงค์เพื่อคืนค่าจำนวนรายการทั้งหมดที่อยู่ในตะกร้าสินค้า ซึ่งได้รับจากการใช้งานขนาดของ map ที่เก็บข้อมูล.
    public int getNoOfItem() {
        return map.size();
    }

    //มีวัตถุประสงค์เพื่อคืนค่าผลรวมของจำนวนสินค้าทั้งหมดในตะกร้าสินค้า.
    public int getQuantity() {
        return map.values().stream().mapToInt(o -> o.getQuantity()).sum();
    }

    //มีวัตถุประสงค์เพื่อคืนค่า Collection ที่ไม่สามารถแก้ไขได้ของทุกรายการในตะกร้าสินค้า.
    //จะคืน Collection ที่ไม่สามารถทำการเพิ่ม, ลบ, หรือแก้ไขข้อมูลภายในได้ (unmodifiable).
    // นั่นหมายความว่าข้อมูลใน Collection นี้จะเป็น "read-only" และการพยายามทำการแก้ไขข้อมูลจะทำให้เกิด UnsupportedOperationException.
    public Collection<V> getAllItem() {
        return Collections.unmodifiableCollection(map.values());
    }

    //มีวัตถุประสงค์เพื่อคืนค่าราคารวมของทุกรายการในตะกร้าสินค้า.
    //map.values().stream().mapToDouble(o -> o.getTotal()).sum()
    //ทำการแปลง map ไปเป็น Stream และใช้ mapToDouble เพื่อดึงค่าราคารวม (getTotal()) จากแต่ละ CartItem.
    //ส่วน sum() ทำหน้าที่รวมผลลัพธ์ทั้งหมดของ mapToDouble ที่ได้.
    //ในที่นี้, totalPrice จะได้ค่าเท่ากับราคารวมของทุกรายการใน shoppingCart.
    public double getTotalPrice() {
        return map.values().stream().mapToDouble(o -> o.getTotal()).sum();
    }

    public void addItem(K key, V value) {
        V item = map.get(key); //: ในบรรทัดนี้, มีการใช้ map.get(key) เพื่อดึง CartItem ที่มี key เป็น key จาก map. นั่นคือ, การตรวจสอบว่ามีรายการที่มี key เดียวกันอยู่ในตะกร้าหรือไม่.
        if (item == null) { //: ในกรณีที่ไม่พบ CartItem ที่มี key เดียวกัน, จะทำการเพิ่ม value เข้าไปใน map โดยใช้ map.put(key, value).
            map.put(key, value);

        } else { //ในกรณีที่พบ CartItem ที่มี key เดียวกันอยู่แล้ว, จะทำการบวกจำนวนสินค้า (quantity) ของ value เข้ากับ item ที่พบ.
            item.setQuantity(item.getQuantity() + value.getQuantity());
        }
    }

    public V removeItem(K key) { // มีวัตถุประสงค์เพื่อลบรายการที่มี key เป็น key ออกจากตะกร้าสินค้า และคืนค่า V ที่ถูกลบออก.
        return map.remove(key); //: ในบรรทัดนี้, map.remove(key) จะลบ CartItem ที่มี key เป็น key ออกจาก map และคืนค่า V ที่ถูกลบ. V คือประเภทข้อมูลของ CartItem หรือลูกนิยมของ Cart.
    }

    public void clear() { //มีวัตถุประสงค์เพื่อลบทุกรายการในตะกร้าสินค้า โดยใช้ map.clear() เพื่อลบทุกคีย์และค่าที่อยู่ใน map.
        map.clear();
    }
}
