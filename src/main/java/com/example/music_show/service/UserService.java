package com.example.music_show.service;

import com.example.music_show.dao.UserDAO;
import com.example.music_show.model.User;
import com.example.music_show.utils.PasswordUtils;

import java.util.List;

public class UserService {
    private final UserDAO userDAO;
    public UserService(){
        userDAO = new UserDAO();
    }
    public List<User> getAllUsers(){
        return userDAO.findAll();
    }
    public void create(User user){
        user.setPassword(PasswordUtils.encryptPassword(user.getPassword()));
        userDAO.create(user);
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
//    public boolean login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        String userName = req.getParameter("userName");
//        String password = req.getParameter("password");
//        var user = userDAO.findByUserName(userName);
//        if (user != null && PasswordUtils.checkPassword(password, user.getPassword())){
//            HttpSession session = req.getSession();
//            session.setAttribute("user", user);
//            if (user.getRole().getName().equals("Admin")){
//                resp.sendRedirect("/user?message=Login Successful");
//            } else if (user.getRole().getName().equals("User")) {
//                resp.sendRedirect("/user?action=showRestore&message=Login Successful");
//            }
//            else {
//                resp.sendRedirect("/index.jsp?message=Login Successful");
//            }
//            return true;
//        }
//        return false;
//    }
}
