package com.example.music_show.dao;
import com.example.music_show.model.Location;
import com.example.music_show.model.Seat;
import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;
import com.example.music_show.service.LocationService;
import com.example.music_show.service.dto.Page;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class LocationDAO extends DatabaseConnection{
    //    private LocationService locationService;
//    private LocationDAO locationDAO = new LocationDAO();
//    public LocationDAO(){
//        locationService = new LocationService();
//    }
    public Page<Location> getAllLocation(int page, String search){
        Page<Location> result = new Page<>();
        final int TOTAL_ELEMENT = 10;
        result.setCurrentPage(page);
        List<Location> content = new ArrayList<>();
        if(search == null){
            search="";
        }
        search="%" + search.toLowerCase() +"%";
        String SELECT_ALL = "select l.* from locations l where (LOWER(l.city) LIKE ?) " +
                "limit 10 offset ?";
        String COUNT_ALL = "select count(*) cnt FROM locations l where (LOWER(l.city) LIKE ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)){
            preparedStatement.setString(1, search);
            preparedStatement.setInt(2, (page - 1)*TOTAL_ELEMENT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Location location = getLocationByResultSet(rs);
                location.setSeatList(getSeatList(location.getId()));
                content.add(location);
            }
            result.setContent(content);
            PreparedStatement preparedStatementCount = connection.prepareStatement(COUNT_ALL);
            preparedStatementCount.setString(1, search);
            ResultSet rsCount = preparedStatementCount.executeQuery();
            while (rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }return result;
    }
    private Location getLocationByResultSet(ResultSet rs) throws SQLException {
        Location location = new Location();
        location.setId(rs.getInt("id"));
        location.setCity(rs.getString("city"));
        location.setAddress(rs.getString("address"));
        return location;
    }
    public List<Seat> getSeatList(int id){
        String AMOUNT_SEAT= "select * from seats s where s.location_id=?";
        List<Seat> seatList = new ArrayList<>();
        int amountSeat = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(AMOUNT_SEAT)){
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                Seat seat = new Seat();
                seat.setId(rs.getInt("id"));
                seat.setPosition(rs.getString("position"));
                seat.setStatus(EStatus.valueOf(rs.getString("status")));
                seat.setType(EType.valueOf(rs.getString("type")));
                seat.setLocation(new Location(rs.getInt("location_id")));
                seatList.add(seat);
                amountSeat++;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }return seatList;
    }
    public Location findById(int id){
        String SELECT_BY_ID = "SELECT * FROM locations where id=?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getLocationByResultSet(rs);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
    public int create(Location location){
        String CREATE= "INSERT INTO `music_show_db`.`locations` ( `city`, `address`) VALUES ( ?, ?)";
        String MAX_ID = "SELECT MAX(ID) as max_id FROM locations";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, location.getCity());
            preparedStatement.setString(2, location.getAddress());
            preparedStatement.executeUpdate();
            PreparedStatement statementId = connection.prepareStatement(MAX_ID);
            ResultSet rs = statementId.executeQuery();
            if(rs.next()){
                return rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
        return -1;
    }
    public void createSeat(String position, EStatus status, EType type, int locationID){
        String CREATE_SEAT= "INSERT INTO `music_show_db`.`seats` (`position`, `status`, `type`, `location_id`) VALUES ( ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE_SEAT)) {
            preparedStatement.setString(1, position);
            preparedStatement.setString(2, String.valueOf(EStatus.valueOf(String.valueOf(status))));
            preparedStatement.setString(3, String.valueOf(EType.valueOf(String.valueOf(type))));
            preparedStatement.setInt(4, locationID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
    }
    public void deleteSeat(int locationId){
        String DELETE_SEAT = "DELETE FROM `music_show_db`.`seats` WHERE (`location_id` = ?)";
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement(DELETE_SEAT)){
            preparedStatement.setInt(1,locationId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateLocation(Location location){
        String UPDATE_LOCATION= "UPDATE `music_show_db`.`locations` SET `city` = ?, `address` = ? WHERE (`id` = ?)";
        try(Connection connection= getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_LOCATION)) {
            preparedStatement.setString(1, location.getCity());
            preparedStatement.setString(2, location.getAddress());
            preparedStatement.setInt(3, location.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteLocation(int id){
        String DELETE_SEAT = "DELETE FROM `music_show_db`.`seats` WHERE (`location_id` = ?)";
        String DELETE_LOCATION = "DELETE FROM `music_show_db`.`locations` WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SEAT);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_LOCATION);
            preparedStatement1.setInt(1, id);
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    // tim location theo address
    public Location findByAddress(String address){
        String FIND_BY_ADDRESS = "SELECT * FROM `locations` WHERE (`address` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ADDRESS);
            preparedStatement.setString(1, address);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                return getLocationByResultSet(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}