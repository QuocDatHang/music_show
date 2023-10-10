package com.example.music_show.service;

import com.example.music_show.dao.ShowDAO;
import com.example.music_show.dao.TicketDAO;
import com.example.music_show.model.Show;
import com.example.music_show.service.dto.TicketDto;
import javax.servlet.http.HttpServletRequest;

public class TicketService {
    private ShowDAO showDAO = new ShowDAO() ;
    private TicketDAO ticketDAO = new TicketDAO();
    public void createTicket(HttpServletRequest req){

    }

//    public TicketDto detailShow(int id) {
//        TicketDto dto = new TicketDto();
//        Show show = showDAO.findById(id);
//        if (show != null) {
//            dto.setId(show.getId());
//            dto.setShowName(show.getShowName());
//            dto.setTimeStart(show.getTimeStart().toString());
//            dto.setTimeEnd(show.getTimeEnd().toString());
//            dto.setPoster(show.getPoster());
//            dto.setLocation(show.getLocation());
//            dto.setTicketInfor(show.getTicketInfor());
//            dto.setSeatDiagramImage(show.getSeatDiagramImage());
//        }
//        return dto;
//    }
}
