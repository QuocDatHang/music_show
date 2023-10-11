package com.example.music_show.service;

import com.example.music_show.dao.*;
import com.example.music_show.model.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


public class BillService {
    private BillDAO billDAO;
    private TicketDAO ticketDAO;
    private UserDAO userDAO;
    private SeatDAO seatDAO;
    private ShowDAO showDAO;

    public BillService() {
        billDAO = new BillDAO();
        userDAO = new UserDAO();
        ticketDAO = new TicketDAO();
        showDAO = new ShowDAO();
        seatDAO = new SeatDAO();
        userDAO = new UserDAO();
    }

    //    public Page<Bill> getAllBill(int page, boolean isShowRestore, String search){
//        return BillDAO.findAll(page, isShowRestore,search);
//    }
    public void createBill(HttpServletRequest req) {

        String createAt = req.getParameter("createAt");
        int userId = Integer.parseInt(req.getParameter("userId"));
        BigDecimal total = new BigDecimal(req.getParameter("totalPay").replaceAll("[^\\d]", ""));
        BigDecimal discount = new BigDecimal(req.getParameter("discountBill").replaceAll("[^\\d]", ""));
        int showId = Integer.parseInt(req.getParameter("showId"));
        Show show = showDAO.findById(showId);

        String[] premiumSeatsArray = req.getParameter("premiumSeats").split(" ");
        List<Integer> premiumSeats = new ArrayList<>();
        if (premiumSeatsArray != null) {
            premiumSeats = Arrays.stream(premiumSeatsArray)
                    .filter(s -> !s.isEmpty())
                    .map(s -> seatDAO.findByPosition(show.getLocation().getId(), s))
                    .map(s -> s.getId())
                    .collect(Collectors.toList());
        }
        String[] vipSeatsArray = req.getParameter("vipSeats").split(" ");
        List<Integer> vipSeats = new ArrayList<>();
        if (vipSeatsArray != null) {
            vipSeats = Arrays.stream(vipSeatsArray)
                    .filter(s -> !s.isEmpty())
                    .map(s -> seatDAO.findByPosition(show.getLocation().getId(), s))
                    .map(s -> s.getId())
                    .collect(Collectors.toList());
        }
        String[] standardSeatsArray = req.getParameter("standardSeats").split(" ");
        List<Integer> standardSeats = new ArrayList<>();
        if (standardSeatsArray != null) {
            standardSeats = Arrays.stream(standardSeatsArray)
                    .filter(s -> !s.isEmpty())
                    .map(s -> seatDAO.findByPosition(show.getLocation().getId(), s))
                    .map(s -> s.getId())
                    .collect(Collectors.toList());
        }

        int billId = billDAO.createBill(userId, discount, createAt, total);
        for (int i = 0; i < premiumSeats.size(); i++) {
            ticketDAO.createTicket(billId, showId, premiumSeats.get(i), show.getTicketInfor().getPremium());
            seatDAO.changeStatus(premiumSeats.get(i));
        }
        for (int i = 0; i < vipSeats.size(); i++) {
            ticketDAO.createTicket(billId, showId, vipSeats.get(i), show.getTicketInfor().getVip());
            seatDAO.changeStatus(vipSeats.get(i));
        }
        for (int i = 0; i < standardSeats.size(); i++) {
            ticketDAO.createTicket(billId, showId, standardSeats.get(i), show.getTicketInfor().getStandard());
            seatDAO.changeStatus(standardSeats.get(i));
        }
    }
}
