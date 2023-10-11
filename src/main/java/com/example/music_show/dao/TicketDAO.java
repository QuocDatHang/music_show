package com.example.music_show.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketDAO extends DatabaseConnection{
    public void createTicket(int billId, int showId, int seatId, BigDecimal price){
        String CREATE_TICKET= "INSERT INTO `music_show_db`.`tickets` ( `bill_id`, `show_id`, `seat_id`, `price`) " +
                "VALUES (?, ?, ?, ?)";
        try(Connection connection=getConnection();
            PreparedStatement preparedStatement = getConnection().prepareStatement(CREATE_TICKET)){
            preparedStatement.setInt(1, billId);
            preparedStatement.setInt(2, showId);
            preparedStatement.setInt(3, seatId);
            preparedStatement.setBigDecimal(4, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
