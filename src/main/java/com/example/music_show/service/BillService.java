package com.example.music_show.service;

import com.example.music_show.dao.BillDAO;
import com.example.music_show.model.Bill;
import com.example.music_show.service.dto.Page;

public class BillService {
    private BillDAO billDAO;
    public BillService(){
        billDAO = new BillDAO();
    }

//    public Page<Bill> getAllBill(int page, boolean isShowRestore, String search){
//        return BillDAO.findAll(page, isShowRestore,search);
//    }

}
