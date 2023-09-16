package com.laptrinhjavaweb.controller.twinkle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet(urlPatterns = "/image/*")
public class LoadImage extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private String imagePath;



    @Override
    public void init() throws ServletException {
        super.init();
        imagePath = Paths.get("uploads").toString();
        System.out.println(imagePath);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        String requestedImage = request.getPathInfo();

        try{
            if(requestedImage != null){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            File image = new File(imagePath, URLDecoder.decode(requestedImage, "UTF-8"));
            if(!image.exists()){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // Get content type
            String contentType = getServletContext().getMimeType(image.getName());

            if(contentType != null || !contentType.startsWith("image")){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            response.reset();
            response.setContentType(contentType);
            response.setHeader("Content-Length", String.valueOf(image.length()));

            Files.copy(image.toPath(), response.getOutputStream());

        }catch(Exception e){
            e.printStackTrace();
        }

    }

}
