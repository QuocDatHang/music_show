package com.example.music_show.controller;

import com.example.music_show.service.SingerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.nio.file.Files.delete;

@WebServlet(name = "singerController", urlPatterns = "/singer")
public class SingerController extends HttpServlet {
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
        singerService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/singer?message=Delete successful!");
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./singer/create.jsp").forward(req, resp);
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("pageSinger", singerService.findAll(Integer.parseInt(pageString), req.getParameter("searchSinger")));
        req.setAttribute("searchSinger", req.getParameter("searchSinger"));
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("singer/singer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "create" -> create(req, resp);
            case "showEdit" -> showEdit(req, resp);
            default -> showList(req, resp);
        }
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        singerService.create(req.getParameter("singerName"));
        resp.sendRedirect("/singer?message=Create successful!");
    }

    @Override
    public void init() throws ServletException {
        singerService = new SingerService();
    }
}
