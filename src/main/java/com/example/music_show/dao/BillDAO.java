package com.example.music_show.dao;

import java.math.BigDecimal;
import java.sql.*;

public class BillDAO extends DatabaseConnection {
    public int createBill(int userId, BigDecimal discount, String createAt, BigDecimal total){
        String  CREATE_BILL = "INSERT INTO `bills` (`userId`, `discount`, `createAt`, `total`) " +
                              "VALUES (?, ?, ?, ?)";
        String MAX_ID= "select max(id) as max_id from `bills`";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BILL);
            preparedStatement.setInt(1, userId);
            preparedStatement.setBigDecimal(2,discount);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(createAt));
            preparedStatement.setBigDecimal(4, total);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatementMax = connection.prepareStatement(MAX_ID);
            ResultSet rs = preparedStatementMax.executeQuery();
            while (rs.next()){
                return rs.getInt("max_id");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }return -1;
    }
}
