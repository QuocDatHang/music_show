package com.example.music_show.service;

import com.example.music_show.dao.ShowDAO;
import com.example.music_show.model.*;
import com.example.music_show.service.dto.Page;
import com.example.music_show.service.dto.TicketDto;
import com.example.music_show.utils.DateTimeUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@MultipartConfig(
        location = "D:\\C0623G1\\Module-3\\Case study\\music_show\\src\\main\\webapp\\images",
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ShowService {
    private static final long serialVersionUID = 1L;
    private ShowDAO showDAO = new ShowDAO();
    private TicketInforService ticketInforService = new TicketInforService();
    private LocationService locationService = new LocationService();

    private final String UPLOAD_DIRECTORY = "D:\\C0623G1\\Module-3\\Case study\\music_show\\src\\main\\webapp\\images";

    public Page<TicketDto> getAllShow(int page, String search) {
        return showDAO.getAllShow(page, search);
    }

    public List<TicketDto> findAll() {
        return showDAO.findAll();
    }

    public Page<TicketDto> findByLocation(int page, String search) {
        return showDAO.findByLocation(page, search);
    }

    public void create(HttpServletRequest req) throws ServletException, IOException {
        Part part = req.getPart("poster");
        String poster = extractFileName(part);
        part.write(poster);

        Part part1 = req.getPart("seatDiagramImage");
        String seatDiagramImage = extractFileName(part1);
        part1.write(seatDiagramImage);

        Show show = new Show();
        show.setShowName(req.getParameter("showName"));
        show.setTimeStart(DateTimeUtils.parse(req.getParameter("timeStart")));
        show.setTimeEnd(DateTimeUtils.parse(req.getParameter("timeEnd")));
        show.setLocation(locationService.findById(Integer.parseInt(req.getParameter("location"))));

        TicketInfor ticketInfor = new TicketInfor();
        ticketInfor.setPremium(new BigDecimal(req.getParameter("premium")));
        ticketInfor.setVip(new BigDecimal(req.getParameter("vip")));
        ticketInfor.setStandard(new BigDecimal(req.getParameter("standard")));
        ticketInfor.setId(ticketInforService.create(ticketInfor));

        show.setTicketInfor(ticketInfor);
        show.setPoster(poster);
        show.setSeatDiagramImage(seatDiagramImage);

        int showId = showDAO.create(show);
        show.setId(showId);

        List<Integer> singerIDs = Arrays.stream((req.getParameterValues("singerIds"))).map(Integer::parseInt).collect(Collectors.toList());
        for (Integer singerID : singerIDs) {
            showDAO.createShowDetail(show.getId(), singerID);
        }
    }

    public void update(HttpServletRequest req) throws ServletException, IOException {
        Show showEdit = findById(Integer.parseInt(req.getParameter("showId")));
        Part part = req.getPart("poster");
        String poster = extractFileName(part);
        part.write(poster);

        Part part1 = req.getPart("seatDiagramImage");
        String seatDiagramImage = extractFileName(part1);
        part1.write(seatDiagramImage);

        showEdit.setShowName(req.getParameter("showName"));
        showEdit.setTimeStart(DateTimeUtils.parse(req.getParameter("timeStart")));
        showEdit.setTimeEnd(DateTimeUtils.parse(req.getParameter("timeEnd")));
        showEdit.setLocation(locationService.findById(Integer.parseInt(req.getParameter("location"))));

        TicketInfor ticketInfor = new TicketInfor();
        ticketInfor.setId(showEdit.getTicketInfor().getId());
        ticketInfor.setPremium(new BigDecimal(req.getParameter("premium")));
        ticketInfor.setVip(new BigDecimal(req.getParameter("vip")));
        ticketInfor.setStandard(new BigDecimal(req.getParameter("standard")));
        ticketInforService.update(ticketInfor);

        showEdit.setTicketInfor(ticketInfor);
        showEdit.setPoster(poster);
        showEdit.setSeatDiagramImage(seatDiagramImage);

        showDAO.update(showEdit);
        List<ShowDetail> showDetailList = showDAO.findShowDetail(Integer.parseInt(req.getParameter("showId")));
        List<Integer> singerIDs = Arrays.stream((req.getParameterValues("singerIds"))).map(Integer::parseInt).collect(Collectors.toList());
        for (int i = 0; i < singerIDs.size(); i++) {
            showDAO.updateShowDetail(showDetailList.get(i).getId(), showEdit.getId(), singerIDs.get(i));
        }
    }

    public Show findById(int id) {
        return showDAO.findById(id);
    }

    public TicketDto findDtoById(int id) {
        return showDAO.findDtoById(id);
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return null;
    }

    public void delete(int id) {
        showDAO.delete(id);
    }
}
/**
 String image = null;
 String pathServerImage = req.getServletContext().getRealPath("/") + "images";
 String pathProjectImage = "F:\\ShopPhoneApp\\src\\main\\webapp\\images";
 String dbImageUrl = null;
 boolean imageUploaded = false;
 for (Part part : req.getParts()) {
 String fileName = extractFileName(part);
 if (!fileName.isEmpty()) {
 fileName = new File(fileName).getName();
 image = "/"+fileName;
 if (part.getContentType().equals("image/jpeg")) {
 String imagePath = "images" + File.separator + fileName;
 //                    part.write(pathProjectImage + File.separator + fileName);
 //                    part.write(getServletContext().getRealPath("/") + imagePath);
 writeImage(pathProjectImage + File.separator + fileName, part);
 writeImage(req.getServletContext().getRealPath("/") + imagePath, part);
 dbImageUrl = imagePath;
 imageUploaded = true;
 } else {
 req.setAttribute("errorImage", "File ảnh không hợp lệ!");
 }
 }
 }
 if (!imageUploaded) {
 req.setAttribute("errorImage", "File ảnh không được để trống hoặc không hợp lệ!");
 }
 Product product = new Product(productName, branch, image, price, quantity, warrantyPeriod, ram, size, color, camera, operatingSystem, pin);
 productService.create(product);
 resp.sendRedirect("/product?message=Created");
 **/