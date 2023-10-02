package model;


import java.sql.Date;

public class Show {
    private int id;
    private String showName;
    private Date timeStart;
    private Date timeEnd;
    private String description;
    private String poster;
    private Location location;

    public Show(int id, String showName, Date timeStart, Date timeEnd, String description, String poster, Location location) {
        this.id = id;
        this.showName = showName;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.description = description;
        this.poster = poster;
        this.location = location;
    }

    public Show() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName;
    }

    public Date getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Date timeStart) {
        this.timeStart = timeStart;
    }

    public Date getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Date timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }
}
