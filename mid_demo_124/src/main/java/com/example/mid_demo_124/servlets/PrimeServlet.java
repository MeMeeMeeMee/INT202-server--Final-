package com.example.mid_demo_124.servlets;


import com.example.mid_demo_124.models.Prime;
import com.example.mid_demo_124.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PrimeServlet", value = "/is_prime")
public class PrimeServlet extends HttpServlet {
    List<Prime> primes = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Step 1: Retrieve the input number รับค่าที่ใส่เข้ามาที่ใช้ชื่อ "number"
        String numberStr = req.getParameter("number");

        // Step 2: Validate the input ตรวจสอบอินพุต
        if (numberStr == null || numberStr.trim().isEmpty()) { //ตรวจสอบอินพุตว่าเป็นnull หรือ เป็นค่าว่างหรือไม่
            // Invalid value
            primes.add(new Prime(0, "Invalid value"));
        } else {
            try {
                // Parse the input as an integer แปลงจาก Sting เป็น int
                int number = Integer.parseInt(numberStr);

                // Step 3: Check whether the number is prime เช็คค่าแล้วเก็บ True/false ไว้ในตัวแปร
                boolean isPrime = checkPrime(number);

                // Step 4: Create a Prime object and add it to the list เพิ่มค่าเข้าไปในarray
                primes.add(new Prime(number, isPrime ? "is prime" : "is not prime"));
            } catch (NumberFormatException e) {
                // Invalid value //รับกรณีที่ค่าที่ได้มาไม่ตรงกับที่ต้องการ
                primes.add(new Prime(0, "Invalid value"));
            }
        }

        // Step 5: Set the list of primes as an application attribute นำค่าที่ได้ไปใสไว้ใน application scope
        getServletContext().setAttribute("primes", primes);

        // Forward the request to the JSP for display ส่งไปแสดงที่หน้า prime.jsp
        req.getRequestDispatcher("/prime.jsp").forward(req, resp);
    }

    private boolean checkPrime(int number) {
        if (number <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

}
