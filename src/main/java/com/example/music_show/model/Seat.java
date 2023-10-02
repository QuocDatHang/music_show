package com.example.music_show.model;

import com.example.music_show.model.enumeration.EStatus;
import com.example.music_show.model.enumeration.EType;

public class Seat {
    private int id;
    private String position;
    private EStatus status;
    private EType type;
    private Location location;

    public Seat() {
    }

    public Seat(int id, String position, EStatus status, EType type, Location location) {
        this.id = id;
        this.position = position;
        this.status = status;
        this.type = type;
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public EStatus getStatus() {
        return status;
    }

    public void setStatus(EStatus status) {
        this.status = status;
    }

    public EType getType() {
        return type;
    }

    public void setType(EType type) {
        this.type = type;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }
}
