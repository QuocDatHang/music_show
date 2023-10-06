package com.example.music_show.service;

import com.example.music_show.dao.SingerDAO;
import com.example.music_show.model.Singer;
import com.example.music_show.service.dto.Page;

import java.math.BigDecimal;
import java.util.List;

public class SingerService {
    private final SingerDAO singerDAO = new SingerDAO();
    public Page<Singer> findAll(int page, String search){
        return singerDAO.findAll(page, search);
    }
    public List<Singer> getAllSinger(){
        return singerDAO.getAllSinger();
    }
    public void create(String singerName, String salary){
        singerDAO.create(singerName, salary);
    }
    public void delete(int id){
        singerDAO.delete(id);
    }
}
