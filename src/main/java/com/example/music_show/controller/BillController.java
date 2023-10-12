package com.example.music_show.controller;

import com.example.music_show.service.BillService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="BillController", urlPatterns = "/bill")

public class BillController extends HttpServlet {
    private BillService billService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            default -> showList(req, resp);
        }
    }
    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("pageBill", billService.getAllBill(Integer.parseInt(pageString), req.getParameter("searchBill")));
        req.getRequestDispatcher("./bill/bill.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
       billService = new BillService();
    }
}
