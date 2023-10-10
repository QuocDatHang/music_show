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
import java.io.*;


@MultipartConfig(
        location = "D:\\C0623G1\\Module-3\\Case study\\music_show\\src\\main\\webapp\\images",
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
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
            case "delete" -> delete(req, resp);
            default -> showList(req, resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        showService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/show?page=" + pageString);
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if(pageString == null){
            pageString="1";
        }
        req.setAttribute("singers", singerService.getAllSinger());
        req.setAttribute("pageLocation", locationService.getAllLocation(Integer.parseInt(pageString),req.getParameter("search")));
        req.setAttribute("singersEdit", singerService.findSingersByShowId(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("showEdit", showService.findById(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("showEditJSON", new ObjectMapper().writeValueAsString(showService.findDtoById(Integer.parseInt(req.getParameter("id")))));
        req.getRequestDispatcher("./show/edit.jsp").forward(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("pageShow", showService.getAllShow(Integer.parseInt(pageString), req.getParameter("searchShow")));
        req.setAttribute("searchShow", req.getParameter("searchShow"));
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
            case "edit" -> edit(req, resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showService.update(req);
        resp.sendRedirect("/show");
    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showService.create(req);
        resp.sendRedirect("/show");
    }

    @Override
    public void init() throws ServletException {
        locationService = new LocationService();
        showService = new ShowService();
        singerService = new SingerService();
    }
}