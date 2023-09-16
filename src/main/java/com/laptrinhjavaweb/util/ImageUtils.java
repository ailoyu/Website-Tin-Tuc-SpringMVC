package com.laptrinhjavaweb.util;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.laptrinhjavaweb.converter.CustomMultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import javax.xml.bind.DatatypeConverter;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.UUID;

@Component
public class ImageUtils {

    private static final Path storageFolder = Paths.get("uploads"); // thư mục uploads lưu tất cả ảnh


    @Autowired
    private Cloudinary cloudinary;

    public String convertBase64toCloudinaryImage(String base64){
        try{
            String[] strings = base64.split(",");
            String extension;
            switch (strings[0]) {//check image's extension
                case "data:image/jpeg;base64":
                    extension = "jpeg";
                    break;
                case "data:image/png;base64":
                    extension = "png";
                    break;
                default://should write cases for more images types
                    extension = "jpg";
                    break;
            }

            //convert base64 string to binary data
            byte[] imageAvatar = DatatypeConverter.parseBase64Binary(strings[1]);
            String generatedFileName = UUID.randomUUID().toString().replace("-", "");
            CustomMultipartFile multipartFile = new CustomMultipartFile(imageAvatar);
            generatedFileName = generatedFileName + "." + extension;
            Map r = this.cloudinary.uploader().upload(imageAvatar,
                    ObjectUtils.asMap("resource_type", "auto"));
            String img = (String) r.get("secure_url");
            return img;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }


    @GetMapping("/files/{fileName:.+}")
    public byte[] readDetailFile(@PathVariable String fileName){
        try {

            Path file = storageFolder.resolve(fileName);
            Resource resource = new UrlResource(file.toUri());
            if(resource.exists() || resource.isReadable()){
                byte[] bytes = StreamUtils.copyToByteArray(resource.getInputStream());
                System.out.println("Đọc ảnh thành công");
                return bytes;
            } else {
                throw new RuntimeException("ko the đọc ra file ảnh!");
            }

            // trả ra hình ảnh
        }catch(Exception e){
            return null;
        }
    }



    public static String loadImageFromDatabase(String imageInDatabase){
        String urlPath = MvcUriComponentsBuilder.fromMethodName(ImageUtils.class,
                "readDetailFile", imageInDatabase.toString()).build().toUri().toString();
        return urlPath;
    }





}
