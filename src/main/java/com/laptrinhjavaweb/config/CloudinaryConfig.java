package com.laptrinhjavaweb.config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CloudinaryConfig {


    @Bean
    public Cloudinary cloudinary(){
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dxctlgwec",
                "api_key", "549471811253917",
                "api_secret", "TNO3efXg5Qvy94IbSwzXcAjed9A",
                "secure" , true));
        return cloudinary;
    }

}
