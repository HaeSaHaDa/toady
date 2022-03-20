package edu.kosmo.today;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


@SpringBootApplication
public class TodayApplication {

	public static void main(String[] args) {
		SpringApplication.run(TodayApplication.class, args);
		//main이 돌아가면서 tomcat이 애플리케이션 수행 
	}
	
	@Bean //파일업로드를 위한 객체 생성
	public CommonsMultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}

}
