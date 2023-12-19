package com.example.mid_demo_124.servlets;

import com.example.mid_demo_124.models.Prime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoryServlet", value = "/history")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the history attribute from the servlet context
        List<Prime> primesHistory = (List<Prime>) getServletContext().getAttribute("primes");

        // Set the list of primes as a request attribute for the JSP
        req.setAttribute("primesHistory", primesHistory);

        // Set the counts as request attributes for the JSP
        req.setAttribute("primeCount", primesHistory.stream().filter(prime -> prime.isPrime()).count());
        req.setAttribute("nonPrimeCount", primesHistory.stream().filter(prime -> !prime.isPrime()).count());

        // Forward the request to the history.jsp for display
        req.getRequestDispatcher("/history.jsp").forward(req, resp);
    }
}
