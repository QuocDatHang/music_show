package com.example.music_show.dao;

import java.math.BigDecimal;
import java.sql.*;

public class BillDAO extends DatabaseConnection {
    public int createBill(int userID, String createAt, BigDecimal total){
        String  CREATE_BILL = "INSERT INTO `music_show_db`.`bills` ( `userId`, `createAt`, `total`) VALUES ( ?, ?, ?)";
        String MAX_ID= "select max(id) as max_id from `music_show_db`.`bills`";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BILL);
            preparedStatement.setInt(1, userID);
            preparedStatement.setTimestamp(2, Timestamp.valueOf(createAt));
            preparedStatement.setBigDecimal(3,total);
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
