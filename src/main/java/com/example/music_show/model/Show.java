package com.example.music_show.model;

import java.time.LocalDateTime;
import java.util.List;
public class Show {
    private int id;
    private String showName;
    private LocalDateTime timeStart;
    private LocalDateTime timeEnd;
    private String poster;
    private Location location;
    private TicketInfor ticketInfor;
    private String seatDiagramImage;
    private List<ShowDetail> showDetailList;

    public Show() {
    }

    public Show(int id, String showName, LocalDateTime timeStart, LocalDateTime timeEnd, String poster, Location location, TicketInfor ticketInfor, String seatDiagramImage) {
        this.id = id;
        this.showName = showName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.poster = poster;
        this.location = location;
        this.ticketInfor = ticketInfor;
        this.seatDiagramImage = seatDiagramImage;
    }

    public Show(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getShowName() {
        return showName;
    }
    public void setShowName(String showName) {
        this.showName = showName;
    }

    public LocalDateTime getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(LocalDateTime timeStart) {
        this.timeStart = timeStart;
    }

    public LocalDateTime getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(LocalDateTime timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getPoster() {
        return poster;
    }
    public void setPoster(String poster) {
        this.poster = poster;
    }

    public TicketInfor getTicketInfor() {
        return ticketInfor;
    }

    public void setTicketInfor(TicketInfor ticketInfor) {
        this.ticketInfor = ticketInfor;
    }

    public String getSeatDiagramImage() {
        return seatDiagramImage;
    }

    public void setSeatDiagramImage(String seatDiagramImage) {
        this.seatDiagramImage = seatDiagramImage;
    }

    public Location getLocation() {
        return location;
    }
    public void setLocation(Location location) {
        this.location = location;
    }

    public List<ShowDetail> getShowDetailList() {
        return showDetailList;
    }

    public void setShowDetailList(List<ShowDetail> showDetailList) {
        this.showDetailList = showDetailList;
    }
}









