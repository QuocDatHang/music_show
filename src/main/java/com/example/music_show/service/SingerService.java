package com.example.music_show.service;

import com.example.music_show.dao.SingerDAO;
import com.example.music_show.model.Singer;

import java.util.List;

public class SingerService {
    private final SingerDAO singerDAO = new SingerDAO();
    public List<Singer> getAllSinger(){
        return singerDAO.findAll();
    }
    public void create(String singerName){
        singerDAO.create(singerName);
    }
    public void delete(int id){
        singerDAO.delete(id);
    }
}
