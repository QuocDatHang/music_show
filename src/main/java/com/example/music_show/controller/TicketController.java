package com.example.music_show.controller;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.dao.UserDAO;
import com.example.music_show.model.*;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.*;
import com.example.music_show.service.dto.TicketDto;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name="TicketController", urlPatterns = "/ticket")
public class TicketController extends HttpServlet {
    private SeatService seatService;
    private ShowService showService;
    private LocationService locationService;
    private TicketService ticketService;
    private LocationDAO locationDAO;

    private UserService userService;
    private BillService billService;

    @Override
    public void init() throws ServletException {
        seatService = new SeatService();
        showService = new ShowService();
        locationService = new LocationService();
        locationDAO = new LocationDAO();
        ticketService = new TicketService();
        userService = new UserService();
        billService = new BillService();
    }
    // getShowById return TicketDto (List<Seat>)

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action== null){
            action="";
        }
        switch (action){
            case "showBill":
                showBillDetail(req,resp);
                break;
            default:
                showDetail(req,resp);
                break;
        }
    }

    private void showBillDetail(HttpServletRequest req, HttpServletResponse resp) {

    }



    public void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = 1;
        Show showdetail = showService.findById(id);
        TicketDto dto = ticketService.detailShow(id);
        req.setAttribute("show", showdetail);
        User user = userService.findById(Integer.parseInt(req.getParameter("userId"))) ;
        req.setAttribute("user", user);
        req.setAttribute("userJSON", new ObjectMapper().writeValueAsString(user));
        List<Seat> seats = locationDAO.getSeatList(showdetail.getLocation().getId());
        req.setAttribute("seats", seats);
        req.setAttribute("seatListJson", new ObjectMapper().writeValueAsString(seats));
        req.setAttribute("showJSON", new ObjectMapper().writeValueAsString(dto));
        req.getRequestDispatcher("detail.jsp").forward(req, resp);


    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createBill":
                createBill(req, resp);
                break;
//            case "edit":
//                update(req,resp);
//                break;
//            default:
//                showList(req,resp);
        }
    }

    private void createBill(HttpServletRequest req, HttpServletResponse resp) throws IOException {
         billService.createBill(req);
         resp.sendRedirect("/detail?message=Created Successfully");
    }
}

