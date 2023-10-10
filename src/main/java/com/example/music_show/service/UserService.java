package com.example.music_show.service;

import com.example.music_show.dao.UserDAO;
import com.example.music_show.model.User;
import com.example.music_show.model.enumeration.ERole;
import com.example.music_show.utils.PasswordUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserService {
    private final UserDAO userDAO;
    public UserService(){
        userDAO = new UserDAO();
    }
    public List<User> getAllUsers(){
        return userDAO.findAll();
    }
    public void register(User user){
        user.setPassword(PasswordUtils.encryptPassword(user.getPassword()));
        userDAO.register(user);
    }
    public void update(User user, int id){
        user.setPassword(PasswordUtils.encryptPassword(user.getPassword()));
        userDAO.update(user, id);
    }
    public void delete(int id){
        userDAO.delete(id);
    }
    public User findById(int id){
        return userDAO.findById(id);
    }
    public boolean login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        User user = userDAO.findByUserName(userName);
        if (user != null && PasswordUtils.checkPassword(password, user.getPassword())){
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            if (user.getRole()==ERole.ADMIN){
                resp.sendRedirect("/admin?id=${user.id}&message=Login Successful");
            } else if (user.getRole() == ERole.USER) {
                resp.sendRedirect("/homePage?userId=" + user.getId() + "&message=Login Successful");
            } else {
                resp.sendRedirect("/homePage?message=Login Success");
            }
            return true;
        }
        return false;
    }
}
