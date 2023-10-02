package dao;

import model.User;
import model.enumeration.ERole;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DatabaseConnection {

    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        String SELECT_ALL_USER = "SELECT u.*, r.name roleName FROM users u JOIN roles r " +
                "ON u.role_id = r.id";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setRole(ERole.valueOf(rs.getString("role")));
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }


    public User findById(int id) {
        String FIND_BY_ID = "SELECT u.*, r.name roleName FROM users u JOIN roles r on u.role_id = r.id HAVING u.id = ?";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setRole(ERole.valueOf(rs.getString("role")));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void create(User user) {
        String CREATE_USER = "INSERT INTO users (`userName`, `password`, `name`, `email`, `phoneNumber`, `role`) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_USER);

            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setString(6, String.valueOf(user.getRole()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void update(User user, int id){
        String EDIT_USER = "UPDATE users SET  userName = ?,  password = ?, name = ?, " +
                " email = ?, phoneNumber = ?, role = ? WHERE (id = ?)";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_USER);

            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setString(6, String.valueOf(user.getRole()));
            preparedStatement.setInt(7, user.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int id) {
        User deleteUser = findById(id);
        String DELETE_USER = "DELETE FROM users WHERE id = ?";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public User findByUserName(String userName){
        String FIND_BY_USER_NAME = "SELECT * FROM users u WHERE u.userName = ?";
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_USER_NAME);
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setRole(ERole.valueOf(rs.getString("role")));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
