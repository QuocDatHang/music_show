package com.example.music_show.dao;

import com.example.music_show.model.Singer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SingerDAO extends DatabaseConnection {
    public List<Singer> findAll() {
        var content = new ArrayList<Singer>();
        var SELECT_ALL = "SELECT * FROM singers";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getSingerByResultSet(rs));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return content;
    }
    private Singer getSingerByResultSet(ResultSet rs) throws SQLException {
        var singer = new Singer();
        singer.setId(rs.getInt("id"));
        singer.setName(rs.getString("name"));
        return singer;
    }
}
