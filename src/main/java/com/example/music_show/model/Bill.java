package com.example.music_show.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Bill {
    private int id;
    private User user;
    private double discount;
    private Date createAt;
    private BigDecimal total;

    public Bill() {
    }

    public Bill(int id) {
        this.id = id;
    }

    public Bill(int id, User user, double discount, Date createAt, BigDecimal total) {
        this.id = id;
        this.user = user;
        this.discount = discount;
        this.createAt = createAt;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
