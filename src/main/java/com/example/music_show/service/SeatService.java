package com.example.music_show.service;

import com.example.music_show.dao.SeatDAO;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

public class SeatService {
    private SeatDAO seatDAO = new SeatDAO();
    public List<Seat> findAll(){
        return seatDAO.findAll();
    }
    public Seat findByID(int id){
        return seatDAO.findById(id);
    }
}
