package com.example.music_show.dao;

import com.example.music_show.model.Bill;
import com.example.music_show.model.Show;
import com.example.music_show.model.Ticket;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO extends DatabaseConnection{
//   public List<Ticket> getAllSeat(){
//       List<Ticket> ticketList = new ArrayList<>();
//
//   }
    public void createTicket(int billid, int showid, int seatid, BigDecimal price){
        String CREATE_TICKET= "INSERT INTO `music_show_db`.`tickets` ( `bill_id`, `show_id`, `seat_id`, `price`) " +
                "VALUES (?, ?, ?, ?)";
        try(Connection connection=getConnection();
            PreparedStatement preparedStatement = getConnection().prepareStatement(CREATE_TICKET)){
            preparedStatement.setInt(1, billid);
            preparedStatement.setInt(2, showid);
            preparedStatement.setInt(3, seatid);
            preparedStatement.setBigDecimal(4, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
