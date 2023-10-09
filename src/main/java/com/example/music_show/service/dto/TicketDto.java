package com.example.music_show.service.dto;

import com.example.music_show.model.Location;
import com.example.music_show.model.Seat;
import com.example.music_show.model.ShowDetail;
import com.example.music_show.model.TicketInfor;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public class TicketDto {

    private int id;
    private String showName;
    private String timeStart;
    private String timeEnd;
    private String poster;
    private Location location;
    private TicketInfor ticketInfor;
    private String seatDiagramImage;
    private String singers;
    private List<ShowDetail> showDetailList;



    public TicketDto() {
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

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
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

    public String getSingers() {
        return singers;
    }

    public void setSingers(String singers) {
        this.singers = singers;
    }

    public List<ShowDetail> getShowDetailList() {
        return showDetailList;
    }

    public void setShowDetailList(List<ShowDetail> showDetailList) {
        this.showDetailList = showDetailList;
    }
}
