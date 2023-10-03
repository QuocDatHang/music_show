package com.example.music_show.dao;

import com.example.music_show.model.Location;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocationDAO extends DatabaseConnection{
    public Page<Location> getAllLocation(int page, String search){
        Page<Location> result = new Page<>();
        final int TOTAL_ELEMENT = 10;
        result.setCurrentPage(page);
        List<Location> content = new ArrayList<>();
        if(search == null){
            search="";
        }
        search="%" + search.toLowerCase() +"%";

        String SELECT_ALL = "select l.* from locations l where (LOWER(l.city) LIKE ?) " +
                "limit 10 offset ?";
        String COUNT_ALL = "select count(*) cnt FROM locations l where (LOWER(l.city) LIKE ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)){
            preparedStatement.setString(1, search);
            preparedStatement.setInt(2, (page - 1)*TOTAL_ELEMENT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Location location = getLocationByResultSet(rs);
                location.setSeatList(getSeatList(location.getId()));
                content.add(location);
            }
            result.setContent(content);
            PreparedStatement preparedStatementCount = connection.prepareStatement(COUNT_ALL);
            preparedStatementCount.setString(1, search);
            ResultSet rsCount = preparedStatementCount.executeQuery();
            while (rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    private Location getLocationByResultSet(ResultSet rs) throws SQLException {
        Location location = new Location();
        location.setId(rs.getInt("id"));
        location.setCity(rs.getString("city"));
        location.setAddress(rs.getString("address"));
        return location;
    }
    public List<Seat> getSeatList(int id){
        String AMOUNT_SEAT= "select * from seats s where s.location_id=?";
        List<Seat> seatList = new ArrayList<>();
        int amountSeat = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(AMOUNT_SEAT)){
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Seat seat = new Seat();
                seat.setId(rs.getInt("id"));
                seat.setPosition(rs.getString("position"));
                seat.setStatus(EStatus.valueOf(rs.getString("status")));
                seat.setType(EType.valueOf(rs.getString("type")));
                seat.setLocation(new Location(rs.getInt("location_id")));
                seatList.add(seat);
                amountSeat++;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }return seatList;
    }
}
