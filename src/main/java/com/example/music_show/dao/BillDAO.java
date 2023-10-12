package com.example.music_show.dao;

import com.example.music_show.model.Bill;
import com.example.music_show.model.Singer;
import com.example.music_show.service.dto.Page;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;

public class BillDAO extends DatabaseConnection {
    private UserDAO userDAO = new UserDAO();
    public int createBill(int userId, BigDecimal discount, String createAt, BigDecimal total) {
        String CREATE_BILL = "INSERT INTO `bills` (`userId`, `discount`, `createAt`, `total`) " +
                "VALUES (?, ?, ?, ?)";
        String MAX_ID = "select max(id) as max_id from `bills`";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BILL);
            preparedStatement.setInt(1, userId);
            preparedStatement.setBigDecimal(2, discount);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(createAt));
            preparedStatement.setBigDecimal(4, total);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatementMax = connection.prepareStatement(MAX_ID);
            ResultSet rs = preparedStatementMax.executeQuery();
            while (rs.next()) {
                return rs.getInt("max_id");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        }
        return -1;
    }

    public Page<Bill> findAll(int page, String search) {
        var result = new Page<Bill>();
        final int TOTAL_ELEMENT = 10;
        result.setCurrentPage(page);
        var content = new ArrayList<Bill>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";

        var SELECT_ALL = "SELECT * FROM bills LIMIT ? OFFSET ?";
        var SELECT_COUNT = "SELECT COUNT(1) AS count FROM bills";

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setInt(1, TOTAL_ELEMENT);
            preparedStatement.setInt(2, (page - 1) * TOTAL_ELEMENT);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setUser(userDAO.findById(rs.getInt("userId")));
                bill.setDiscount(rs.getBigDecimal("discount"));
                bill.setCreateAt(rs.getTimestamp("createAt").toLocalDateTime());
                bill.setTotal(rs.getBigDecimal("total"));
                content.add(bill);
            }
            result.setContent(content);

            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("count") / TOTAL_ELEMENT));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
}
