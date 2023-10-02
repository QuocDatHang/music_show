package com.example.music_show.model;

import java.math.BigDecimal;

public class Ticket {
    private int id;
    private Bill bill;
    private Show show;
    private Seat seat;
    private BigDecimal price;

    public Ticket() {
    }

    public Ticket(int id, Bill bill, Show show, Seat seat, BigDecimal price) {
        this.id = id;
        this.bill = bill;
        this.show = show;
        this.seat = seat;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
