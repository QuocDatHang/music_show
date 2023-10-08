package com.example.music_show.dao;

import com.example.music_show.model.Show;
import com.example.music_show.model.Singer;
import com.example.music_show.service.dto.Page;
import com.example.music_show.service.dto.TicketDto;
import com.example.music_show.utils.DateTimeUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO extends DatabaseConnection {
    private LocationDAO locationDAO = new LocationDAO();
    private TicketInforDAO ticketInforDAO = new TicketInforDAO();

    public Page<TicketDto> getAllShow(int page, String search) {
        var result = new Page<TicketDto>();
        final int TOTAL_ELEMENT = 3;
        result.setCurrentPage(page);
        var content = new ArrayList<TicketDto>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";

        String SELECT_ALL = "SELECT s.*, l.city, GROUP_CONCAT(singers.name SEPARATOR ' - ') as singers FROM shows s " +
                "JOIN show_details sd ON s.id = sd.show_id " +
                "JOIN singers ON sd.singer_id = singers.id " +
                "JOIN locations l ON s.location_id = l.id " +
                "WHERE LOWER(s.showName) LIKE ? " +
                "OR LOWER(singers.name) LIKE ? group by s.id LIMIT ? OFFSET ? ";
        String SELECT_COUNT = "SELECT count(1) as count from ( " +
                "SELECT group_concat(singers.name) as singers FROM shows s " +
                "JOIN show_details sd ON s.id = sd.show_id " +
                "JOIN singers ON sd.singer_id = singers.id " +
                "WHERE LOWER(s.showName) LIKE ? " +
                "OR LOWER(singers.name) LIKE ? group by s.id ) as list";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3, TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getTicketDtoByResultSet(rs));
            }
            result.setContent(content);

            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("count") / TOTAL_ELEMENT));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<TicketDto> findAll() {
        var result = new ArrayList<TicketDto>();
        String SELECT_ALL = "SELECT s.*, l.city, GROUP_CONCAT(singers.name SEPARATOR ' - ') as singers FROM shows s " +
                "JOIN show_details sd ON s.id = sd.show_id " +
                "JOIN singers ON sd.singer_id = singers.id " +
                "JOIN locations l ON s.location_id = l.id " +
                " group by s.id ";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(getTicketDtoByResultSet(rs));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public Page<TicketDto> findByLocation(int page, String search) {
        var result = new Page<TicketDto>();
        final int TOTAL_ELEMENT = 6;
        result.setCurrentPage(page);
        var content = new ArrayList<TicketDto>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";

        String SELECT_ALL = "SELECT s.*, l.city, GROUP_CONCAT(singers.name SEPARATOR ' - ') as singers FROM shows s " +
                "JOIN show_details sd ON s.id = sd.show_id " +
                "JOIN singers ON sd.singer_id = singers.id " +
                "JOIN locations l ON s.location_id = l.id " +
                "WHERE LOWER(l.city) LIKE ? " +
                "GROUP BY s.id LIMIT ? OFFSET ? ";
        String SELECT_COUNT = "SELECT count(1) as count from ( " +
                "SELECT group_concat(singers.name) as singers FROM shows s " +
                "JOIN show_details sd ON s.id = sd.show_id " +
                "JOIN singers ON sd.singer_id = singers.id " +
                "JOIN locations l ON s.location_id = l.id " +
                "WHERE LOWER(l.city) LIKE ? " +
                "GROUP BY s.id ) as list";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1, search);
            preparedStatement.setInt(2, TOTAL_ELEMENT);
            preparedStatement.setInt(3, (page - 1) * TOTAL_ELEMENT);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getTicketDtoByResultSet(rs));
            }
            result.setContent(content);

            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("count") / TOTAL_ELEMENT));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public Show findById(int id) {
        var FIND_BY_ID = "SELECT * FROM `shows` WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return getShowByResultSet(rs);
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

    public void createShowDetail(int showId, int singerId) {
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
    public Show getShowByResultSet(ResultSet rs) throws SQLException {
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
    public TicketDto getTicketDtoByResultSet(ResultSet rs) throws SQLException {
        TicketDto ticketDto = new TicketDto();
        ticketDto.setId(rs.getInt("id"));
        ticketDto.setShowName(rs.getString("showName"));
        ticketDto.setTimeStart(rs.getString("timeStart"));
        ticketDto.setTimeEnd((rs.getString("timeEnd")));
        ticketDto.setLocation(locationDAO.findById(rs.getInt("location_id")));
        ticketDto.setPoster(rs.getString("poster"));
        ticketDto.setTicketInfor(ticketInforDAO.findById(rs.getInt("ticket_infor_id")));
        ticketDto.setSeatDiagramImage(rs.getString("seatDiagramImage"));
        ticketDto.setSingers(rs.getString("singers"));
        return ticketDto;
    }
}