package com.example.music_show.controller;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.model.Location;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.LocationService;
import com.example.music_show.service.SeatService;
import com.example.music_show.service.ShowService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="TicketController", urlPatterns = "/ticket")
public class TicketController extends HttpServlet {
    private SeatService seatService;
    private ShowService showService;
    private LocationService locationService;
    private LocationDAO locationDAO;

    @Override
    public void init() throws ServletException {
        seatService = new SeatService();
        showService = new ShowService();
        locationService = new LocationService();
        locationDAO = new LocationDAO();
    }
    // getShowById return TicketDto (List<Seat>)

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action== null){
            action="";
        }
        switch (action){
            default:
                showDetail(req,resp);
        }
    }

    public void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Show
        // Show show = ...
        // Location location = show.getLocation()
        // List<Seat> seats = localtionDAO.getListSeat

        // request.setAttribute("show", show)
//        int idShow = Integer.parseInt(req.getParameter("id"));
//        req.setAttribute("show", showService.findById(idShow));
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("show", showService.findById(id));
        req.setAttribute("type", EType.values());
        List<Seat> seats = locationDAO.getSeatList(id);
        req.setAttribute("seats", seats);
        req.getRequestDispatcher("detail.jsp").forward(req, resp);


    }
}
