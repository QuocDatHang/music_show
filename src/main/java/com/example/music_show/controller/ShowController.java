package com.example.music_show.controller;

import com.example.music_show.service.LocationService;
import com.example.music_show.service.ShowService;
import com.example.music_show.service.SingerService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
@WebServlet(name = "showController", urlPatterns = "/show")
public class ShowController extends HttpServlet {
    private LocationService locationService;
    private ShowService showService;
    private SingerService singerService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "showCreate" -> showCreate(req, resp);
            case "showEdit" -> showEdit(req, resp);
            default -> showList(req, resp);
        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./show/show.jsp").forward(req, resp);
    }

    public void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if(pageString == null){
            pageString="1";
        }
        req.setAttribute("singers", singerService.getAllSinger());
        req.setAttribute("pageLocation", locationService.getAllLocation(Integer.parseInt(pageString),req.getParameter("search")));
        req.getRequestDispatcher("./show/create.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create" -> create(req, resp);
        }
    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showService.create(req);
    }

    @Override
    public void init() throws ServletException {
        locationService = new LocationService();
        showService = new ShowService();
        singerService = new SingerService();
    }
}
