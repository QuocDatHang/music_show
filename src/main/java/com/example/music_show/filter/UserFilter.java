package com.example.music_show.filter;

import com.example.music_show.model.User;
import com.example.music_show.model.enumeration.ERole;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/ticket/*")
public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest)servletRequest).getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            ((HttpServletResponse)servletResponse).sendRedirect("/auth");
            return;
        }
        if(!(user.getRole() == ERole.USER)){
            ((HttpServletResponse)servletResponse).sendRedirect("/auth");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);

    }
}
