package com.example.music_show.service;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.model.Location;
import com.example.music_show.service.dto.Page;

public class LocationService {
    private LocationDAO locationDAO;
    public LocationService(){
        locationDAO = new LocationDAO();
    }
    public Page<Location> getAllLocation(int page, String search){
        return locationDAO.getAllLocation(page, search);
    }
}
