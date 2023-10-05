package com.example.music_show.dao;

import com.example.music_show.model.Ticket;

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
    public void createTicket(Ticket ticket){
        String CREATE_TICKET= "INSERT INTO `music_show_db`.`tickets` ( `bill_id`, `show_id`, `seat_id`, `price`) " +
                "VALUES (?, ?, ?, ?)";
        try(Connection connection=getConnection();
            PreparedStatement preparedStatement = getConnection().prepareStatement(CREATE_TICKET)){
            preparedStatement.setInt(1, ticket.getBill().getId());
            preparedStatement.setInt(2, ticket.getShow().getId());
            preparedStatement.setInt(3, ticket.getSeat().getId());
            preparedStatement.setBigDecimal(4, ticket.getPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
