package com.example.music_show.service.dto;

import com.example.music_show.model.Seat;

import java.sql.Date;
import java.util.List;

public class TicketDto {

    private String showName;
    private Date timeStart;
    private Date timeEnd;
    private String description;
    private String poster;

    private String city;
    private String address;
    private List<Seat> seatList;
}
