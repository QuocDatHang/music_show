package com.example.music_show.model;


import java.sql.Date;

public class Show {
    private int id;
    private String showName;
    private Date timeStart;
    private Date timeEnd;
    private String poster;
    private Location location;
    private TicketInfor ticketInfor;
    private String seatDiagramImage;

    public Show() {
    }

    public Show(int id, String showName, Date timeStart, Date timeEnd, String poster, Location location, TicketInfor ticketInfor, String seatDiagramImage) {
        this.id = id;
        this.showName = showName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.poster = poster;
        this.location = location;
        this.ticketInfor = ticketInfor;
        this.seatDiagramImage = seatDiagramImage;
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

    public Date getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Date timeStart) {
        this.timeStart = timeStart;
    }

    public Date getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Date timeEnd) {
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
}
