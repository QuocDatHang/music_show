package model;

public class ShowDetail {
    private int id;
    private Show show;
    private Singer singer;

    public ShowDetail() {
    }

    public ShowDetail(int id, Show show, Singer singer) {
        this.id = id;
        this.show = show;
        this.singer = singer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }
}
