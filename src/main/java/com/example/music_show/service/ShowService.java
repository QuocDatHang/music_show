package com.example.music_show.service;

import com.example.music_show.model.Show;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;

public class ShowService {
    public void getAllShow(){

    }
    public void create(HttpServletRequest req) throws ServletException, IOException {
        String uploadPath = "/images";

        Part filePart = req.getPart("imageFile");
        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;

        try (InputStream inputStream = filePart.getInputStream();
             OutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void update(Show show){

    }


}
