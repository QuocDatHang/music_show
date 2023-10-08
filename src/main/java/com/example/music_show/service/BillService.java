package com.example.music_show.service;

import com.example.music_show.dao.BillDAO;
import com.example.music_show.dao.TicketDAO;
import com.example.music_show.dao.UserDAO;
import com.example.music_show.model.*;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.dto.Page;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class BillService {
    private BillDAO billDAO;
    private TicketDAO ticketDAO;
    private UserDAO userDAO;
    public BillService(){
        billDAO = new BillDAO();
        userDAO = new UserDAO();
        ticketDAO = new TicketDAO();
    }

//    public Page<Bill> getAllBill(int page, boolean isShowRestore, String search){
//        return BillDAO.findAll(page, isShowRestore,search);
//    }
    public void createBill(HttpServletRequest req){
        String createAT = (req.getParameter("createAT"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        BigDecimal total = new BigDecimal(req.getParameter("total"));
        int showID = Integer.parseInt(req.getParameter("showID"));
        List<Integer> seatIds = Arrays.stream(req.getParameterValues("seatIds"))
                .map(Integer::parseInt).collect(Collectors.toList());
        List<BigDecimal> prices = Arrays.stream(req.getParameterValues("prices"))
                .map(BigDecimal::new).collect(Collectors.toList());



       Bill bill = new Bill();
        bill.setId(billDAO.createBill(userId, createAT, total));
  for(int i=0; i<seatIds.size();i++){
      ticketDAO.createTicket(bill.getId(), showID, seatIds.get(i), prices.get(i));
  }
    }
}
