package com.example.music_show.filter;

import com.example.music_show.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/book/*")
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ((HttpServletResponse) servletResponse).sendRedirect("/auth");
            return;
        }
        if (!user.getRole().equals("Admin")) {
            ((HttpServletResponse) servletResponse).sendRedirect("/auth");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);

    }
}