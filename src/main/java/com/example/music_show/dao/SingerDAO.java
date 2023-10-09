package com.example.music_show.dao;

import com.example.music_show.model.Seat;
import com.example.music_show.model.Singer;
import com.example.music_show.service.dto.Page;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SingerDAO extends DatabaseConnection {
    public Page<Singer> findAll(int page, String search) {
        var result = new Page<Singer>();
        final int TOTAL_ELEMENT = 7;
        result.setCurrentPage(page);
        var content = new ArrayList<Singer>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";

        var SELECT_ALL = "SELECT * FROM singers WHERE LOWER(name) LIKE ? LIMIT ? OFFSET ?";
        var SELECT_COUNT = "SELECT COUNT(1) AS count FROM singers WHERE LOWER(name) LIKE ?";

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1, search);
            preparedStatement.setInt(2, TOTAL_ELEMENT);
            preparedStatement.setInt(3, (page - 1) * TOTAL_ELEMENT);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getSingerByResultSet(rs));
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

    public List<Singer> getAllSinger() {
        List<Singer> singers = new ArrayList<>();
        String SELECT_ALL = "SELECT * FROM singers ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                singers.add(getSingerByResultSet(rs));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return singers;
    }

    public List<Singer> findSingersByShowId(int id) {
        List<Singer> singers = new ArrayList<>();
        String FIND_SINGERS = "SELECT s.* FROM show_details sd JOIN singers s ON sd.singer_id = s.id WHERE sd.show_id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_SINGERS);
            preparedStatement.setInt(1, id);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                singers.add(getSingerByResultSet(rs));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return singers;
    }

    public Singer getSingerByResultSet(ResultSet rs) throws SQLException {
        var singer = new Singer();
        singer.setId(rs.getInt("id"));
        singer.setName(rs.getString("name"));
        singer.setSalary(rs.getBigDecimal("salary"));
        return singer;
    }

    public void create(String singerName, String salary) {
        var CREATE_SINGER = "INSERT INTO `singers` (`name`, `salary`) VALUES (?,?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE_SINGER)) {
            preparedStatement.setString(1, singerName);
            preparedStatement.setBigDecimal(2, new BigDecimal(salary));
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int id) {
        var DELETE_SINGER = "DELETE FROM `singers` WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SINGER)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
