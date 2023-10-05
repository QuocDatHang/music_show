package com.example.music_show.dao;

import com.example.music_show.model.Show;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class ShowDAO extends DatabaseConnection {
    private LocationDAO locationDAO = new LocationDAO();
    private TicketInforDAO ticketInforDAO = new TicketInforDAO();

    public Show findById(int id) {
        var FIND_BY_ID = "SELECT * FROM `shows` WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Show show = new Show();
                show.setId(rs.getInt("id"));
                show.setShowName(rs.getString("showName"));
                show.setTimeStart((rs.getTimestamp("timeStart")).toLocalDateTime());
                show.setTimeEnd((rs.getTimestamp("timeEnd")).toLocalDateTime());
                show.setLocation(locationDAO.findById(rs.getInt("location_id")));
                show.setPoster(rs.getString("poster"));
                show.setTicketInfor(ticketInforDAO.findById(rs.getInt("ticket_infor_id")));
                show.setSeatDiagramImage(rs.getString("seatDiagramImage"));
                return show;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int create(Show show) {
        String CREATE_SHOW = "INSERT INTO `shows` (`showName`, `timeStart`, `timeEnd`, `location_id`," +
                " `poster`, `ticket_infor_id`, `seatDiagramImage`) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_SHOW);
            preparedStatement.setString(1, show.getShowName());
            preparedStatement.setTimestamp(2, Timestamp.valueOf(show.getTimeStart()));
            preparedStatement.setTimestamp(3, Timestamp.valueOf(show.getTimeEnd()));
            preparedStatement.setInt(4, show.getLocation().getId());
            preparedStatement.setString(5, show.getPoster());
            preparedStatement.setInt(6, show.getTicketInfor().getId());
            preparedStatement.setString(7, show.getSeatDiagramImage());

            preparedStatement.executeUpdate();

            String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM `shows`";
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
    public void createShowDetail(int showId, int singerId){
        String CREATE_SHOW_DETAIL = "INSERT INTO `show_details` (`show_id`, `singer_id`) VALUES (?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_SHOW_DETAIL);
            preparedStatement.setInt(1, showId);
            preparedStatement.setInt(2, singerId);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
