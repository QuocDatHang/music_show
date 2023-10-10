package com.example.music_show.model;

import java.util.List;

public class Location {
    private int id;
    private String city;
    private String address;
    private List<Seat> seatList;

    public Location() {
    }

    public Location(int id) {
        this.id = id;
    }

    public Location(int id, String city, String address) {
        this.id = id;
        this.city = city;
        this.address = address;
    }
    public Location(int id, String city, String address, List<Seat> seatList) {
        this.id = id;
        this.city = city;
        this.address = address;
        this.seatList = seatList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public List<Seat> getSeatList() {
        return seatList;
    }

    public void setSeatList(List<Seat> seatList) {
        this.seatList = seatList;
    }
}
