package com.hagulu.marondalgram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.hagulu.marondalgram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig  implements WebMvcConfigurer {

	@Autowired 
	private PermissionInterceptor interceptor;
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:///C:\\Users\\김인규\\Documents\\lecture\\webProjectSNS\\images/");

    }
}


