package com.example.music_show.dao;

import com.example.music_show.model.TicketInfor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TicketInforDAO extends DatabaseConnection {
    public TicketInfor findById(int id) {
        String FIND_BY_ID = "SELECT * FROM ticket_infors WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                TicketInfor ticketInfor = new TicketInfor();
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

    public int create(TicketInfor ticketInfor) {
        String CREATE_TICKET_INFO = "INSERT INTO `ticket_infors` (`premium`, `vip`, `standard`) VALUES (?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_TICKET_INFO);
            preparedStatement.setBigDecimal(1, ticketInfor.getPremium());
            preparedStatement.setBigDecimal(2, ticketInfor.getVip());
            preparedStatement.setBigDecimal(3, ticketInfor.getStandard());
            preparedStatement.executeUpdate();

            String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM `ticket_infors`";
            PreparedStatement statementId = connection.prepareStatement(SELECT_MAX_ID);
            var rs = statementId.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_id");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }
    public void update(TicketInfor ticketInfor) {
        String UPDATE_TICKET_INFO = "UPDATE `music_show_db`.`ticket_infors`" +
                "SET `premium` = ?, `vip` = ?, `standard` = ? WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TICKET_INFO);
            preparedStatement.setBigDecimal(1, ticketInfor.getPremium());
            preparedStatement.setBigDecimal(2, ticketInfor.getVip());
            preparedStatement.setBigDecimal(3, ticketInfor.getStandard());
            preparedStatement.setInt(4, ticketInfor.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

