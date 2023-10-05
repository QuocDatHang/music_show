package com.example.music_show.service;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.dao.ShowDAO;
import com.example.music_show.dao.TicketInforDAO;
import com.example.music_show.model.Location;
import com.example.music_show.model.Show;
import com.example.music_show.model.ShowDetail;
import com.example.music_show.model.TicketInfor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ShowService {
    private ShowDAO showDAO = new ShowDAO();
    private LocationService locationService = new LocationService();
    public void getAllShow(){

    }
    public void create(HttpServletRequest req) throws ServletException, IOException {
        String uploadPath = "/images";

        Part filePart = req.getPart("poster");
        String fileName = filePart.getSubmittedFileName();
        String poster = uploadPath + File.separator + fileName;

        try (InputStream inputStream = filePart.getInputStream();
             OutputStream outputStream = new FileOutputStream(poster)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Part filePart1 = req.getPart("seatDiagramImage");
        String fileName1 = filePart1.getSubmittedFileName();
        String seatDiagramImage = uploadPath + File.separator + fileName1;

        try (InputStream inputStream = filePart1.getInputStream();
             OutputStream outputStream = new FileOutputStream(seatDiagramImage)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Show show = new Show();
        show.setShowName(req.getParameter("showName"));
        show.setTimeStart(LocalDateTime.parse(req.getParameter("timeStart")));
        show.setTimeEnd(LocalDateTime.parse(req.getParameter("timeEnd")));
        show.setLocation(locationService.findByAddress(req.getParameter("location")));

        TicketInfor ticketInfor = new TicketInfor();
        ticketInfor.setPremium(new BigDecimal(req.getParameter("premium")));
        ticketInfor.setVip(new BigDecimal(req.getParameter("vip")));
        ticketInfor.setStandard(new BigDecimal(req.getParameter("standard")));

        show.setTicketInfor(ticketInfor);
        show.setPoster(poster);
        show.setSeatDiagramImage(seatDiagramImage);

        int showId = showDAO.create(show);

        ShowDetail showDetail = new ShowDetail();
//        showDetail.setShow();
    }

    public void update(Show show){

    }

    public Show findById(int id){
        return showDAO.findById(id);
    }
}
