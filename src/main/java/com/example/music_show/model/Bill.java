package com.example.music_show.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDateTime;

public class Bill {
    private int id;
    private User user;
    private BigDecimal discount;
    private LocalDateTime createAt;
    private BigDecimal total;

    public Bill() {
    }

    public Bill(int id) {
        this.id = id;
    }


    public Bill(int id, User user, LocalDateTime createAt, BigDecimal total) {
        this.id = id;
        this.user = user;
        this.createAt = createAt;
        this.total = total;
    }

    public Bill(int id, User user, BigDecimal discount, LocalDateTime createAt, BigDecimal total) {
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

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
