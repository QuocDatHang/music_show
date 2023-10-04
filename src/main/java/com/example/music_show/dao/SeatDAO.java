package com.example.music_show.dao;
import com.example.music_show.model.Location;
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
}