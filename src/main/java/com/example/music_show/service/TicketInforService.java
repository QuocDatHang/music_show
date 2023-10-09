package com.example.music_show.service;

import com.example.music_show.dao.TicketInforDAO;
import com.example.music_show.model.TicketInfor;

public class TicketInforService {
    public TicketInforDAO ticketInforDAO = new TicketInforDAO();
    public TicketInfor findById(int id){
        return ticketInforDAO.findById(id);
    }
    public int create(TicketInfor ticketInfor){
        return ticketInforDAO.create(ticketInfor);
    }
    public void update (TicketInfor ticketInfor){
        ticketInforDAO.update(ticketInfor);
    }
}
