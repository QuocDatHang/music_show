package com.example.music_show.service;

import com.example.music_show.dao.LocationDAO;
import com.example.music_show.dao.SeatDAO;
import com.example.music_show.model.Location;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.dto.Page;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LocationService {
    private LocationDAO locationDAO;
    private SeatDAO seatDAO;

    public LocationService() {
        locationDAO = new LocationDAO();
        seatDAO = new SeatDAO();
    }

    public Page<Location> getAllLocation(int page, String search) {
        return locationDAO.getAllLocation(page, search);
    }

    public Location findById(int id) {
        return locationDAO.findById(id);
    }

    public Location findBySeat(int id) {
        return locationDAO.findByIdSeat(id);
    }

    public void create(HttpServletRequest req) {
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

    public void updateLocation (HttpServletRequest req) {

        int locationId = Integer.parseInt(req.getParameter("id"));
//        Location location = locationDAO.findById(locationId);

//        locationDAO.deleteSeat(locationId);
        String city = req.getParameter("city");
        String address = req.getParameter("address");
        Location location = new Location();
        location.setId(locationId);
        location.setCity(city);
        location.setAddress(address);
        locationDAO.updateLocation(location);
        List<Seat> seatList = locationDAO.getSeatList(locationId);

        String[] typeValues = req.getParameterValues("type");
        String position = req.getParameter("position");
        EStatus status = EStatus.AVAILABLE;
        EType[] types = new EType[typeValues.length];

//        for (int i = 0; i < typeValues.length; i++) {
//            types[i] = EType.valueOf(typeValues[i]); // Chuyển đổi từ chuỗi sang enum
//        }


        for(int i=0;i<seatList.size();i++){
            Seat seat = seatList.get(i);
            seatDAO.update(seat.getId(), position, typeValues[i]);
        }

    }

    public void deleteLocation(int id) {
        locationDAO.deleteLocation(id);
    }

    public Location findByAddress(String address) {
        return locationDAO.findByAddress(address);
    }
}

