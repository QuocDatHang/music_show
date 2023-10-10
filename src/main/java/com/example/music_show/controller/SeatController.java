package com.example.music_show.controller;

import com.example.music_show.service.SeatService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="SeatController", urlPatterns = "/seat")
public class SeatController extends HttpServlet {
    private SeatService seatService;

    @Override
    public void init() throws ServletException {
        seatService = new SeatService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            default:
                showSeat(req,resp);
        }
    }

    private void showSeat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        seatService.findAll();
        req.getRequestDispatcher("seat/seat.jsp").forward(req, resp);
    }
}
