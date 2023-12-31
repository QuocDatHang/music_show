package com.example.music_show.dao;

import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class SeatDAO extends DatabaseConnection{
    public List<Seat> findAll(){
        List<Seat> content = new ArrayList<>();
        String SELECT_ALL = "SELECT * " +
                " FROM seats ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getSeatByResultSet(rs));
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return content;
    }
    private Seat getSeatByResultSet(ResultSet rs) throws SQLException {
        Seat seat = new Seat();
        seat.setId(rs.getInt("id"));
        seat.setPosition(rs.getString("position"));
        seat.setStatus(EStatus.valueOf(rs.getString("status")));
        seat.setType(EType.valueOf(rs.getString("type")));
        return seat;
    }
    public Seat findById(int id){
        String SELECT_BY_ID = "SELECT * FROM seats where id=?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getSeatByResultSet(rs);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Seat findByPosition(int locationId, String position){
        String SELECT_BY_POSITION = "SELECT * FROM seats WHERE location_id = ? AND position = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_POSITION)) {
            preparedStatement.setInt(1, locationId);
            preparedStatement.setString(2, position);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getSeatByResultSet(rs);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void changeStatus(int id){
        String CHANGE_STATUS = "UPDATE `seats` SET `status` = 'SELECTED' WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHANGE_STATUS)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }}
    public void update(int seatID, String position, String type){

        String UPDATE_SEAT= "UPDATE `music_show_db`.`seats` SET `position` = ?, `type` = ? where id=?";
        try(Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SEAT)){
            preparedStatement.setString(1, position);
            preparedStatement.setString(2, String.valueOf(type));
            preparedStatement.setInt(3, seatID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }
}

