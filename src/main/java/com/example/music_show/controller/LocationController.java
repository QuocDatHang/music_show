package com.example.music_show.controller;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.LocationService;
import com.example.music_show.service.SeatService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LocationController", urlPatterns = "/location")
public class LocationController extends HttpServlet {
    private LocationService locationService;
    private SeatService seatService;
    private LocationDAO locationDAO;

    @Override
    public void init() throws ServletException {
        locationService = new LocationService();
        seatService = new SeatService();
        locationDAO = new LocationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "create":
                showCreate(req,resp);
                break;
            case "edit":
                showEdit(req,resp);
                break;
            case "delete":
                delete(req,resp);
                break;
            case "showSeat":
                showSeat(req,resp);
                break;
            default:
                showLocation(req,resp);
        }
    }

    private void showSeat(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("show", locationService.findBySeat(Integer.parseInt(req.getParameter("id"))));

    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        locationService.deleteLocation(id);
        resp.sendRedirect("/location?message=Deleted Successfully");
    }
    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("location", locationService.findById(id));
        req.setAttribute("type", EType.values());
        List<Seat> seats = locationDAO.getSeatList(id);
        req.setAttribute("seats", seats);
        req.getRequestDispatcher("location/edit.jsp").forward(req, resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Seat> seats = seatService.findAll();
        req.setAttribute("status", EStatus.values());
        req.setAttribute("type", EType.values());
//        req.setAttribute("SeatsJSON", new ObjectMapper().writeValueAsString(seats));
        req.getRequestDispatcher("location/create.jsp").forward(req,resp);
    }

    private void showLocation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           String pageString = req.getParameter("page");
           if(pageString == null){
               pageString="1";
           }
//           int id = Integer.parseInt(req.getParameter("id"));
           req.setAttribute("page", locationService.getAllLocation(Integer.parseInt(pageString),req.getParameter("search")));
//           req.setAttribute("id", locationService.amountSeat(id));
           req.setAttribute("search", req.getParameter("search"));
           req.getRequestDispatcher("location/location.jsp").forward(req,resp);

    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action== null){
            action="";
        }
        switch (action){
            case "create":
                create(req,resp);
                break;
            case "edit":
                update(req,resp);
                break;
//            default:
//                showList(req,resp);
        }

    }
    private void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        locationService.update(req);
        resp.sendRedirect("/location?message=Edited Successfully");
    }
    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        locationService.create(req);
        resp.sendRedirect("/location?message=Created Successfully");
    }

}
