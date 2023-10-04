package com.example.music_show.service;

import com.example.music_show.dao.SingerDAO;
import com.example.music_show.model.Singer;
import com.example.music_show.service.dto.Page;

import java.util.List;

public class SingerService {
    private final SingerDAO singerDAO = new SingerDAO();
    public Page<Singer> getAllSinger(int page, String search){
        return singerDAO.findAll(page, search);
    }
    public void create(String singerName){
        singerDAO.create(singerName);
    }
    public void delete(int id){
        singerDAO.delete(id);
    }
}
