package com.example.music_show.controller;

import com.example.music_show.model.User;
import com.example.music_show.model.enumeration.ERole;
import com.example.music_show.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "authController", urlPatterns = "/auth")
public class AuthController extends HttpServlet {
    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "register":
                showRegister(req, resp);
                break;
            default:
                showLogin(req,resp);
        }
    }
    private void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("/auth/login.jsp").forward(req,resp);
    }

    private void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("Roles", ERole.values());
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("auth/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "register":
                register(req, resp);
                break;
            default:
                login(req,resp);
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean checkLogin = userService.login(req,resp);
        if(!checkLogin){
            resp.sendRedirect("/auth?message=Invalid username or password");
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        userService.register(getUserByRequest(req));
        resp.sendRedirect("/auth?message=Register Success");
    }
    private User getUserByRequest(HttpServletRequest req){
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        String fullName = req.getParameter("name");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        ERole role = ERole.USER;
        return new User(username,password,fullName,email,phoneNumber,role);
    }
    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }
}