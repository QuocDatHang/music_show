package com.example.music_show.controller;

import com.example.music_show.service.LocationService;
import com.example.music_show.service.ShowService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "userController", value = "/homePage")
public class UserController extends HttpServlet {
    private ShowService showService;
    private LocationService locationService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "findByCity" -> findByCity(req, resp);
            default -> showList(req, resp);
        }

    }

    private void findByCity(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("shows", showService.findAll());
        req.setAttribute("pageShowsByCity", showService.findByLocation(Integer.parseInt(pageString), req.getParameter("city")));
        req.getRequestDispatcher("/homePage.jsp").forward(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("shows", showService.findAll());
        req.setAttribute("pageShow", showService.getAllShow(Integer.parseInt(pageString), req.getParameter("searchShow")));
        req.setAttribute("searchShow", req.getParameter("searchShow"));
        req.getRequestDispatcher("/homePage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
       showService = new ShowService();
       locationService = new LocationService();
    }
}
