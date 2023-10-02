package com.example.music_show.model;

import java.math.BigDecimal;

public class TicketInfor {
    private int id;
    private BigDecimal premium;
    private BigDecimal vip;
    private BigDecimal standard;

    public TicketInfor(int id, BigDecimal premium, BigDecimal vip, BigDecimal standard) {
        this.id = id;
        this.premium = premium;
        this.vip = vip;
        this.standard = standard;
    }

    public TicketInfor() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigDecimal getPremium() {
        return premium;
    }

    public void setPremium(BigDecimal premium) {
        this.premium = premium;
    }

    public BigDecimal getVip() {
        return vip;
    }

    public void setVip(BigDecimal vip) {
        this.vip = vip;
    }

    public BigDecimal getStandard() {
        return standard;
    }

    public void setStandard(BigDecimal standard) {
        this.standard = standard;
    }
}
