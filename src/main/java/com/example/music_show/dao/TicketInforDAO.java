package com.example.music_show.dao;

import com.example.music_show.model.TicketInfor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TicketInforDAO extends DatabaseConnection{
    public TicketInfor findById(int id){
        String FIND_BY_ID = "SELECT * FROM ticket_infors WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                var ticketInfor = new TicketInfor();
                ticketInfor.setId(rs.getInt("id"));
                ticketInfor.setPremium(rs.getBigDecimal("premium"));
                ticketInfor.setVip(rs.getBigDecimal("vip"));
                ticketInfor.setStandard(rs.getBigDecimal("standard"));
                return ticketInfor;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
