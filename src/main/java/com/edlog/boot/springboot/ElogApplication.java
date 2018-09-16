package com.edlog.boot.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
/**
 * 
 * YEOTAE
 * @author user
 *
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class ElogApplication extends SpringBootServletInitializer{
	 
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ElogApplication.class);
    }
	
	public static void main(String[] args) {
		SpringApplication.run(ElogApplication.class, args);
	}
}
