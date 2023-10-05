package com.example.music_show.service;

import com.example.music_show.dao.TicketDAO;
import com.example.music_show.model.Ticket;
import com.example.music_show.model.enumeration.EStatus;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

public class TicketService {

    private TicketDAO ticketDAO = new TicketDAO();
    public void createTicket(HttpServletRequest req){
        int showId = 1;
        int billId =0;

        EStatus status = EStatus.AVAILABLE;


    }
}
