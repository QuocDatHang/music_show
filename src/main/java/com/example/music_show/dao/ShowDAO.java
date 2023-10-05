package com.example.music_show.dao;
import com.example.music_show.model.Show;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class ShowDAO extends DatabaseConnection{
    private LocationDAO locationDAO = new LocationDAO();
    private TicketInforDAO ticketInforDAO = new TicketInforDAO();
    public Show findById(int id){
        String FIND_BY_ID = "SELECT * FROM `shows` WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
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
}