package com.example.music_show.service;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.model.Location;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.dto.Page;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

public class LocationService {
    private LocationDAO locationDAO;
    public LocationService(){
        locationDAO = new LocationDAO();
    }
    public Page<Location> getAllLocation(int page, String search){
        return locationDAO.getAllLocation(page, search);
    }
//    public int amountSeat(int id){
//        return locationDAO.getSeatList(id);
//    }
//    public Location findById(int id){
//        return locationDAO.findById(id);
//    }
public void create(HttpServletRequest req) {
//    String city = req.getParameter("city");
//    String address = req.getParameter("address");
//    String position = req.getParameter("position");
//
//    EStatus status = EStatus.AVAILABLE;
//    EType type = EType.valueOf(Arrays.toString(req.getParameterValues("type")));
//
//
//    Location location = new Location(0, city,address);
//    location.setId(locationDAO.create(location));
//
//    locationDAO.createSeat(position, status, type, location.getId());
    String city = req.getParameter("city");
    String address = req.getParameter("address");
    String[] typeValues = req.getParameterValues("type");
    String position = req.getParameter("position");

    EStatus status = EStatus.AVAILABLE;
    EType[] types = new EType[typeValues.length];

    for (int i = 0; i < typeValues.length; i++) {
        types[i] = EType.valueOf(typeValues[i]); // Chuyển đổi từ chuỗi sang enum
    }

    Location location = new Location(0, city, address);
    location.setId(locationDAO.create(location));

    for (EType type : types) {
        locationDAO.createSeat(position, status, type, location.getId());
    }

}
}
