package com.example.music_show.service;

import com.example.music_show.dao.SeatDAO;
import com.example.music_show.model.Seat;
import java.util.List;

public class SeatService {
    private SeatDAO seatDAO = new SeatDAO();
    public List<Seat> findAll(){
        return seatDAO.findAll();
    }
    public Seat findSeatByID(int id){
        return seatDAO.findById(id);
    }
}